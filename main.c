/*
 * File:   main.c
 * Author: Aditya Chaudhary
 *
 * Created on April 04, 2024, 4:53 AM
 * EEPROM Model Number : AT24LC256
 */

#include <xc.h>
#include <pic18f25k22.h>
#include "config.h"
#include "i2c.h"

// #define DEBUG   //uncomment this line, if you want to enable debug mode
#define F_CPU 64000000 / 64
#define BAUD_RATE 9600
#define EEPROM_ADDRESS 0x50
#define DEVICE_CODE 0x21
#define PACKET_SIZE 50
#define RESPONSE_PACKET_SIZE 50
#define PACKET_START_MARKER_LOWER 0x3A
#define PACKET_START_MARKER_UPPER 0x23
#define PACKET_END_MARKER_LOWER 0x0D
#define PACKET_END_MARKER_UPPER 0x0A
#define LOOKUP_SECTION_CACHE_SIZE 400     //we can't cache 1000s of bytes, as we don't have that big amount of memory
				    //as cache buffer is of type char, each data stored is of 1 byte
				    //Size 200 means we making space of 400*1 = 400 bytes 

/* lookup section, where we will store all the starting address of credentials, for reference */
#define LOOKUP_SECTION_START 0x7800
#define LOOKUP_SECTION_END 0x7FFF

/* credential section, where we will store actual credential data */
#define CREDENTIAL_SECTION_START 0x0000
#define CREDENTIAL_SECTION_END 0x77FF

#define EEPROM_CAPACITY 0x7FFF // 32,768 locations of 8 bit each (32K x 8).

unsigned int timeout = 1000;		 // timeout variable
unsigned char interrupt_flag = 0x00; // interrupt flag
unsigned char requestBuffer[PACKET_SIZE];
unsigned char responseBuffer[RESPONSE_PACKET_SIZE]; // we will send 3 packets, device code, order code, additional data
unsigned char start_sequence_flag = 0x00;
unsigned char end_sequence_flag = 0x00;
unsigned short at24_eeprom_address = 0x0000;
unsigned char checkAck = 0x01;
unsigned char isPasswordSet = 0x01;
unsigned char isExceptionRaised = 0x00; // exception flag
unsigned char exception_code = 0x00;
unsigned char LOOKUP_SECTION_CACHE[LOOKUP_SECTION_CACHE_SIZE]; //with this size, we can store 200 starting addresses in cache buffer

enum ORDER_CODES
{
	PING = 0x11,
	WRITE_MEM = 0x01,
	READ_MEM = 0x02,
	READ_ENTRY = 0x03,
	DELETE_MEM = 0x10,
	SET_PASSWORD = 0x12,
	AUTH_CHECK = 0x13
};

enum PIC_EEPROM_CONFIG
{
	PASSWORD_ADDR_START = 0x00,
	PASSWORD_ADDR_END = 0x08,
	ADDRESS_POINTER_H = 0x0A,
	ADDRESS_POINTER_L = 0x0B,
	LOOKUP_POINTER_H = 0x0C,
	LOOKUP_POINTER_L = 0x0D
};
// address pointer will store address of next location where data will be stored on at24lc256
// pointer has both low and high byte, because word address in AT24LC256 is 16bit

enum EXCEPTION_CODES
{
	ILLEGAL_ORDER_CODE = 0x01,
	ILLEGAL_DEVICE_CODE = 0x02,
	MASTER_PASSWORD_NOT_SET = 0x03,
	AUTH_FAILED = 0x04,
	PASSWORD_LENGTH_EXCEED = 0x05,
	DEVICE_CODE_MISMATCH = 0x06,
	INSUFFICIENT_MEMORY = 0x07
};
// exception codes are used in responses, when operation fails on the device, we have to notify master.

// struct to hold variables related to receiving packets
typedef struct
{
	unsigned char buffer[PACKET_SIZE]; // buffer to store received packet data
	unsigned char index;			   // current index within the buffer
	unsigned char receiving;		   // flag indicating if currently receiving a packet
} ReceivePacketData;

// struct to hold variables related to request from master
typedef struct
{
	unsigned char DEVICE_ADDR;
	unsigned char ORDER_CODE;
	unsigned int payload_length_index;
	unsigned char payload_data[PACKET_SIZE - 2];
} UART_Request;

// struct to hold variables related to master password
// these are cache variables
typedef struct
{
	unsigned char PASSWORD_CACHE[PASSWORD_ADDR_END - PASSWORD_ADDR_START]; // we will only store payload, excluding its length
	unsigned char cache_length;
} Password;

UART_Request request_unit = {0, 0, 0, 0};
ReceivePacketData receiveData = {0, 0, 0};
Password master = {0, 0};

/*integer to hex array*/
unsigned char digits[10] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09};

// Function declarations
void processRequest(void);
void createResponse(void);
void createPingResponse(void);
void writeDataToEEPROM();
void writeMasterPasswordToEEPROM();
void writeByteAT24_EEPROM(unsigned int, unsigned char);
unsigned char readByteAT24_EEPROM(unsigned short);
void ReadMasterPasswordFromEEPROM();
void ReadCredentials();
unsigned char isPasswordMatched();
void FormatDrive();
void ReadLookupEntries();
void EEPROM_Write(unsigned char addr, unsigned char eep_data);
unsigned char EEPROM_Read(unsigned char addr);
void sendResponse(unsigned char exception_occurred);

/*
 *@desc: initialise uart, set appropriate registers regarding UART on PIC18F25K22
 *@params: none
 *@return: none
 */
void UART_Init()
{
	float temp;

	TRISC6 = 0;			  /* Make Tx pin as output*/
	TRISC7 = 1;			  /* Make Rx pin as input*/
	ANSELCbits.ANSC7 = 0; // set input as digital

	INTCONbits.GIE = 1;	 // Enable global interrupts
	INTCONbits.PEIE = 1; 	 // Enable peripheral interrupts
	PIE1bits.RC1IE = 1;	 // set usart1 receive interrupt enable bit

	TXSTA1 = 0x20; /* Enable Transmit(TX) */
	RCSTA1 = 0x90; /* Enable Receive(RX) & Serial */

	/* Baud rate=9600, SPBRG = (F_CPU /(64*9600))-1*/
	temp = (((float)(F_CPU) / (float)BAUD_RATE) - 1);
	SPBRG1 = (int)temp;

	// below code is in assembly, refer datasheet for registers and respective addresses

	//	#asm
	//	TRISC_REG equ 0xF94
	//	BSR_REG equ 0xFE0
	//	ANSELC_REG equ 0xF3A
	//	TRANSMIT_REG equ 0xFAC
	//	RECEIVE_REG equ 0xFAB
	//	INTCON_REG equ 0xFF2
	//	PIE1_REG equ 0xF9D
	//
	//	;select bank 15
	//	MOVLW 0x0F
	//	MOVWF BSR_REG
	//
	//	;make rc6 output and rc7 pin digital input
	//	MOVLW 0b1011111 ;load value into w register
	//	MOVWF TRISC_REG ;load contents of w into TRISC_REG
	//
	//	MOVLW 0b01111100 ;load value into w register
	//	MOVWF ANSELC_REG ;load contents of w into ANSELC register
	//
	//	;enable global and peripheral interrupt
	//
	//	MOVLW 0b11000000 ;load value into w register
	//	MOVWF INTCON_REG ;load contents of w into INTCON_REG
	//
	//	;enable usart receive interrupt
	//
	//	MOVLW 0b00100000 ;load value into w register
	//	MOVWF PIE1_REG   ;load contents of w into PIE1_REG
	//
	//	;load TXSTA1 and RCSTA1 register
	//	MOVLW 0x20         ;Load value for TXSTA1 register
	//    	MOVWF TRANSMIT_REG ;Enable Transmit(TX)
	//			   ;TXSTA1 reg addr - 0xFAC, ref : https : // ww1.microchip.com/downloads/en/DeviceDoc/40001412G.pdf
	//
	//	MOVLW 0x90         ;Load value for RCSTA1 register
	//    	MOVWF RECEIVE_REG  ;Enable Receive(RX) & Serial
	//			   ;RCSTA1 reg addr - 0xFAB, ref : https: // ww1.microchip.com/downloads/en/DeviceDoc/40001412G.pdf
	// #endasm
}

/*
 *@desc: transmits one byte data via uart
 *@params: (unsigned char)data
 *@return: none
 */
void UART_TransmitChar(uint8_t data)
{
	while (!PIR1bits.TX1IF);
	TXREG = data;
}

/*
 *@desc: interrupt routine which receives one byte of data via uart
 *@params: none
 *@return: none
 */
void __interrupt() isr(void)
{
	// check whether receive interrupt flag is set or not
	if (PIR1bits.RC1IF)
	{
		unsigned char receivedChar = RCREG;
		PIE1bits.RC1IE = 0; // disable usart receive interrupt

		// UART_TransmitChar(receivedChar);

		// check if we are currently receiving a packet
		if (!receiveData.receiving)
		{
			// first packet will be LOW byte of START sequence, followed by HIGH byte of START sequence
			//  check if the received character is lower byte of start sequence
			if ((receivedChar == PACKET_START_MARKER_LOWER) && (start_sequence_flag == 0x00))
			{
				// set start_sequence_flag and wait for lower byte
				start_sequence_flag = 0x01;
			}
			else if ((receivedChar == PACKET_START_MARKER_UPPER) && (start_sequence_flag == 0x01)) // check whether received char is start sequence upper byte.
			{
				// we got a start sequence
				receiveData.receiving = 0x01;
				receiveData.index = 0;

				// clear start sequence flag
				start_sequence_flag = 0x00;
			}
			else
			{ // if it's a random character, just clear start_sequence flag
				start_sequence_flag = 0x00;
			}
		}
		else
		{

			// check if the received character is lower byte of end sequence
			if ((receivedChar == PACKET_END_MARKER_LOWER) && (end_sequence_flag == 0x00))
			{
				end_sequence_flag = 0x01; // set end sequence flag.
			}
			else if ((receivedChar == PACKET_END_MARKER_UPPER) && (end_sequence_flag == 0x01))
			{

				// store null character at the end of buffer, '\0', hex - 0x00
				requestBuffer[receiveData.index++] = 0x00;

				// End of packet reached, process the packet
				processRequest();

				// Reset packet buffer and index for the next packet
				receiveData.index = 0;
				receiveData.receiving = 0x00;
				interrupt_flag = 0x01;

				// clear end sequence flag
				end_sequence_flag = 0x00;
			}
			else
			{

				// store the received character in the packet buffer
				// set limit, how much data buffer can store.
				if (receiveData.index < PACKET_SIZE)
				{
					if (end_sequence_flag == 0x01)
					{
						// we got end sequence lower byte, but it is not a sequence byte, but it is part of payload
						end_sequence_flag = 0x00;

						// we have to store lower byte of end sequence because it is part of payload
						requestBuffer[receiveData.index++] = PACKET_END_MARKER_LOWER;
					}

					requestBuffer[receiveData.index++] = receivedChar;
				}
				else
				{
					// suppose we reset index.
					receiveData.index = 0;
				}
			}
		}

	#ifdef DEBUG
		UART_TransmitChar(receivedChar + 1);
	#endif

		PIE1bits.RC1IE = 1; // enable usart receive interrupt
	}
}

/*
 *@desc: process request packets, and stores it int struct variables
 *@params: none
 *@return: none
 */
void processRequest()
{
	unsigned int buffer_index = 0;
	unsigned int length_index = 0;
	unsigned int i = 0;

	request_unit.DEVICE_ADDR = requestBuffer[0]; // extract device code from buffer and store in struct variable
	request_unit.ORDER_CODE = requestBuffer[1];	 // extract order code from buffer and store in struct variable

	//@Note: why there is a check for READ_MEM?
	//as when request to read some payload from eeprom, it may contain 0x00, as address high byte or low byte
	//but for other requests, 0x00 is treated as a null character, so it is going against that condition.
	
	if(request_unit.ORDER_CODE != READ_MEM){
		// extract credential data from buffer and store it in struct buffer
		for (buffer_index = 0; requestBuffer[buffer_index + 2] != 0x00; buffer_index++)
		{
			request_unit.payload_data[buffer_index] = requestBuffer[buffer_index + 2];

			// increment index, until reaches at the end of data, we want location, where length of data is stored.
			length_index = buffer_index + 2;
		}
	
		// store length location in struct as a global variable
		request_unit.payload_length_index = length_index;
	}else{
		//only for read memory order code, because 0x00 condition.
		request_unit.payload_data[0] = requestBuffer[2]; //word address low byte
		request_unit.payload_data[1] = requestBuffer[3]; //word address high byte
	}
	
	#ifdef DEBUG
		UART_TransmitChar(requestBuffer[length_index]); // this will transmit length of data
	#endif
}

/*
 *@desc: create response, perform actions based on request
 *@params: none
 *@return: none
 */
void createResponse()
{
	unsigned char CODE = request_unit.ORDER_CODE;

	// we have to start raising exception responses
	// check for if password is set or not
	if (!isPasswordSet)
	{
		isExceptionRaised = 0x01;
		exception_code = MASTER_PASSWORD_NOT_SET;
	}

	// if device code matches with our device code, then only perform operations or send response.
	if (request_unit.DEVICE_ADDR == DEVICE_CODE)
	{
		if ((!isExceptionRaised) || (CODE == SET_PASSWORD))
		{ // check for exception raise flag, if flag is raised, don't perform normal operations.
			// if request matches our device code, only then this device will respond.
			switch (CODE)
			{
			case PING: // ping request from master
				createPingResponse();
				break;
			case WRITE_MEM:
				writeDataToEEPROM();
				break;
			case READ_MEM:
				ReadCredentials();
				break;
			case READ_ENTRY:
				ReadLookupEntries();
				break;
			case DELETE_MEM:
				FormatDrive();
				break;
			case SET_PASSWORD:
				writeMasterPasswordToEEPROM(); // stores the master password
				break;
			case AUTH_CHECK:
				if (!isPasswordMatched()) // if authentication fails
				{
					isExceptionRaised = 0x01;	  // set exception raise flag, as exception occurred.
					exception_code = AUTH_FAILED; // 0x04 represents failed authentication
				}
				break;
			default: // invalid function code
				break;
			}
		}
	}else{
		//device code not matched
		isExceptionRaised = 0x01;
		exception_code = DEVICE_CODE_MISMATCH;
	}

		// send response bytes one by one
		sendResponse(isExceptionRaised);
}

/*
 *@desc: handles ping request from master, and creates response for same
 *@params: none
 *@none: none
 */

void createPingResponse()
{
	responseBuffer[0] = request_unit.DEVICE_ADDR;
	responseBuffer[1] = request_unit.ORDER_CODE;
	responseBuffer[2] = 0x00; // dummy data high byte
	responseBuffer[3] = 0x00; // dummy data low byte
}

/*
 *@desc: handles write request from master, and writes data to eeprom and responds master.
 *@params: none
 *@return: none
 */
void writeDataToEEPROM()
{
	unsigned short payload_length;
	unsigned char eeprom_data = 0x00;
	unsigned char at24_eep_addr_H = 0x00;
	unsigned char at24_eep_addr_L = 0x00;

	unsigned char at24_eep_lookup_addr_H = 0x00;
	unsigned char at24_eep_lookup_addr_L = 0x00;

	unsigned short at24_eeprom_addr_start = 0x0000;
	unsigned short at24_eep_lookup_addr = 0x0000;

	// read new location address from PIC-EEPROM
	// 0x0A and 0x0B, location to store address_counter which has address of location where new data will be stored.
	at24_eep_addr_H = EEPROM_Read(ADDRESS_POINTER_H);
	__delay_ms(500); // give sufficient time to read data from eeprom
	at24_eep_addr_L = EEPROM_Read(ADDRESS_POINTER_L); 

	// read new lookup address from PIC-EEPROM
	// 0x0C and 0x0D, location to store lookup_address_counter which has address of new lookup table entry where new entry is stored.
	at24_eep_lookup_addr_H = EEPROM_Read(LOOKUP_POINTER_H);
	__delay_ms(500);
	at24_eep_lookup_addr_L = EEPROM_Read(LOOKUP_POINTER_L);

	//(at24_eep_addr_H << 8, will give you 8 bit High byte of a 16bit integer)
	at24_eeprom_address = (at24_eep_addr_H << 8) | at24_eep_addr_L;

	at24_eep_lookup_addr = (at24_eep_lookup_addr_H << 8) | at24_eep_lookup_addr_L;

	// if it's a fresh eeprom, assign address reset address from CREDENTIAL_SECTION_START.
	if (at24_eeprom_address == 0xFFFF)
		at24_eeprom_address = CREDENTIAL_SECTION_START; // start from the first word address, i.e 0x0000

	// if its a fresh eeprom, at24_eep_lookup_addr will be 0xFFFF, therefore assign it start i.e LOOKUP_SECTION_START
	if(at24_eep_lookup_addr == 0xFFFF)
		at24_eep_lookup_addr = LOOKUP_SECTION_START;


	// assign start address to a local variable for further use
	at24_eeprom_addr_start = at24_eeprom_address;

	// length of string to be stored, convert it to 16bit
	payload_length = (requestBuffer[request_unit.payload_length_index]) & 0xFF;

	//check whether start address cross the limit of credential section which is 0x77FF
	if((CREDENTIAL_SECTION_END - at24_eeprom_address) <=  payload_length){
		//there is no enough space in eeprom to store payload
		isExceptionRaised = 0x01;
		exception_code = INSUFFICIENT_MEMORY;
		return;
	}


	// store length of data first.
	writeByteAT24_EEPROM(at24_eeprom_address, requestBuffer[request_unit.payload_length_index]);
	at24_eeprom_address += 1; // increment address counter by 1

	__delay_ms(10);

	// store data
	for (unsigned short i = 0; i < payload_length; i++)
	{
		writeByteAT24_EEPROM((at24_eeprom_address + i), request_unit.payload_data[i]);
		__delay_ms(10);
	}

	// update address, at24_eeprom_address will point towards new location to store next data
	at24_eeprom_address += payload_length;
	// as, eeprom address is incremented by one while storing length of password, so addr + payload_length, will result into location, which is next to last byte stored.
	// for example, while storing length, address incremented by 1, so it became 0x0001.
	//  now, 0x0001 + 0x000F -> 0x0010, this is the new location

	__delay_ms(500);
	// write next address location on PIC-EEPROM
	EEPROM_Write(ADDRESS_POINTER_H, ((at24_eeprom_address >> 8) & 0xFF)); // write word address HIGH Byte
	__delay_ms(500);													  // give some delay to conduct write operation
	EEPROM_Write(ADDRESS_POINTER_L, (at24_eeprom_address & 0xFF));		  // write word address LOW Byte
	__delay_ms(500);

	//check if lookup address is within range or not
	if(at24_eep_lookup_addr > (LOOKUP_SECTION_END - 1)){
		//Lookup address is pointing at 0x7FFF, which is last address of lookup section
		isExceptionRaised = 0x01;
		exception_code = INSUFFICIENT_MEMORY;
		return;
        }

	//store starting addresses of credentials in lookup section
	writeByteAT24_EEPROM(at24_eep_lookup_addr, ((at24_eeprom_addr_start >> 8) & 0xFF));
	__delay_ms(10);
	writeByteAT24_EEPROM((at24_eep_lookup_addr + 1), (at24_eeprom_addr_start & 0xFF));

	at24_eep_lookup_addr += 2; //each entry in lookup table will require 2 locations

	//update this new lookup table addr in PIC_EEPROM
	__delay_ms(500);
	EEPROM_Write(LOOKUP_POINTER_H, ((at24_eep_lookup_addr >> 8) & 0xFF)); //store high byte of new lookup table address
	__delay_ms(500);
	EEPROM_Write(LOOKUP_POINTER_L, (at24_eep_lookup_addr & 0xFF));	//store low byte of new lookup table address
	__delay_ms(500);

	// update response buffer
	responseBuffer[0] = request_unit.DEVICE_ADDR;
	responseBuffer[1] = request_unit.ORDER_CODE;
	responseBuffer[2] = (at24_eeprom_addr_start >> 8) & 0xFF; // START address high byte
	responseBuffer[3] = at24_eeprom_addr_start & 0xFF;        // START address low byte
	responseBuffer[4] = 0xFF; 				  // Termination Character '0xFF' for write response

	/* Termination character for write response is 0xFF, as we know
	 * throughout our device termination character is 0x00, but in this case we are returning start address to our users,
         * and '0x00' can be part of start address, it will create confusion between termination character.
         */ 
}

/*
 *@desc: writes master password on PIC-EEPROM, on reserved locations (00 - 0A)
 *@params: none
 *@return: none
 */
void writeMasterPasswordToEEPROM()
{
	unsigned char payload_length = 0x00;
	unsigned char index = 0x00;
	unsigned char pic_eeprom_addr;
	unsigned char last_byte_addr = 0x00;
	unsigned char last_byte_data = 0x00;

	pic_eeprom_addr = PASSWORD_ADDR_START; // Now, PASSWORD_ADDR_START is 0x00

	payload_length = requestBuffer[request_unit.payload_length_index];

	// maximum password length allowed is 8bytes
	// we reserved 9 addresses for password, range is 0x00 - 0x08.
	// 9 because first byte will be length of password, rest 8 will be password.
	// payload length can be maximum (password_addr_end - password_addr_start).
	// for now 0x00 is start and 0x08 is end, that means we have 9 locations. 9th location to store length of payload.

	if (payload_length > (PASSWORD_ADDR_END - PASSWORD_ADDR_START))
	{
		isExceptionRaised = 0x01;
		exception_code = PASSWORD_LENGTH_EXCEED;		

		// entered password is bigger than locations reserved on eeprom.
		return;
	}

	// write length to eeprom
	__delay_ms(1000);
	EEPROM_Write(pic_eeprom_addr, payload_length); // In this case payload length is 8 bit.
	__delay_ms(1000);

	// increment address counter.
	pic_eeprom_addr++;

	// store rest of password inside eeprom
	for (index = 0x00; index < payload_length; index++)
	{
		__delay_ms(500);
		EEPROM_Write((pic_eeprom_addr + index), request_unit.payload_data[index]);
		__delay_ms(500);

		last_byte_addr = pic_eeprom_addr + index;
	}

	__delay_ms(100);
	last_byte_data = EEPROM_Read(last_byte_addr);
	__delay_ms(100);

	isExceptionRaised = 0x00;
	isPasswordSet == 0x01;

	// update response buffer
	responseBuffer[0] = request_unit.DEVICE_ADDR;
	responseBuffer[1] = request_unit.ORDER_CODE;
	responseBuffer[2] = last_byte_data;
}

/*
 *@desc: writes byte to eeprom
 *@params: none
 *@return: none
 */
void writeByteAT24_EEPROM(unsigned int address, unsigned char data)
{
	I2C2_Start();				   // start condition
	checkAck = I2C2_Send(EEPROM_ADDRESS << 1); // send control code(4 bits), the chip select(3 bits) and the R/W bit (logic low)
	I2C2_Send((address >> 8) & 0xFF);	   // address high byte (MSB)
	I2C2_Send(address & 0xFF);		   // address low byte (LSB)
	I2C2_Send(data);			   // data word to be written into the addressed memory location
	I2C2_Stop();				   // send stop condition
}

/*
 *@desc: reads byte from eeprom
 *@params: (unsigned short) address
 *@return: (unsigned char) eeprom_data
 */
unsigned char readByteAT24_EEPROM(unsigned short address){
	unsigned char eeprom_data = 0x00;

	I2C2_Start(); 			         //send start condition
	I2C2_Send(EEPROM_ADDRESS << 1);          //send slave address with write bit
	I2C2_Send((address >> 8) & 0xFF);        //word address high byte
	I2C2_Send(address & 0xFF);               //word address low byte

	I2C2_Start();                            //send start condition again
	I2C2_Send((EEPROM_ADDRESS << 1) | 0x01); //send slave address with read bit
	eeprom_data = I2C2_Read();               //read 8 bit data from the mentioned address
	I2C2_Stop();                             //send stop condition

	return eeprom_data;	
}


/*
 *@desc: send response byte by byte
 *@params: none
 *@return: none
 */
void sendResponse(unsigned char isExceptionOccurred)
{
	unsigned int index = 0;

	// send start sequence
	UART_TransmitChar(0x3A); // send HIGH Byte of start sequence
	__delay_ms(10);
	UART_TransmitChar(0x23); // send LOW Byte of start sequence
	__delay_ms(10);

	if (!isExceptionOccurred)
	{
		for (index = 0; index < RESPONSE_PACKET_SIZE; index++)
		{
			UART_TransmitChar(responseBuffer[index]);
			__delay_ms(10);
		}
	}
	else
	{
		// exception occurred
		UART_TransmitChar(DEVICE_CODE); // send device code
		__delay_ms(10);
		UART_TransmitChar(0xFE); // order code is 0xFE, that means exception occurred
		__delay_ms(10);
		UART_TransmitChar(exception_code); // send exception code, so that master can understand what happened.
		__delay_ms(10);

		isExceptionRaised = 0x00; // clear exception raised flag
		exception_code = 0x00;	  // clear exception code
	}

	// send end sequence
	UART_TransmitChar(0x0D);
	__delay_ms(10);
	UART_TransmitChar(0x0A);

	// reset request buffer
	index = PACKET_SIZE;
	while (index > 0)
	{
		requestBuffer[PACKET_SIZE - index] = 0xFF;
		index--;
	}

	//flush response buffer
	index = 0;
	while(index < RESPONSE_PACKET_SIZE){
		responseBuffer[index] = 0xFF;
		index++;
	} 
}

/*
 *@desc: writes data to eeprom
 *@params: (unsigned short addr, unsigned char eep_data)
 *@return: nothing
 */
void EEPROM_Write(unsigned char addr, unsigned char eep_data)
{
	__delay_ms(500);

	EEADR = addr & 0xFF; // word address
	EEDATA = eep_data;	 // holds the data.

	EECON1bits.EEPGD = 0; // access data eeprom memory, memory select bit
	EECON1bits.CFGS = 0;  // access flash or data eeprom memory, comfiguration select bit
	EECON1bits.WREN = 1;  // allows write cycles to flash program/data eeprom

	INTCONbits.GIE = 0; // disable global interrupts

	// This sequence is important to write data in eeprom
	EECON2 = 0x55;
	EECON2 = 0xAA;
	EECON1bits.WR = 1; // Write Control Bit, Initiates a data EEPROM erase/write cycle or a program memory erase cycle or write cycle.

	INTCONbits.GIE = 1; // enable global interrupts

	// PIE2bits.EEIE = 1; // Data EEPROM/Flash Write Operation Interrupt Enable bit
	while (PIR2bits.EEIF == 0)
		; // wait for write operation complete

	PIR2bits.EEIF = 0; // reset flag after eeprom write operation.
}

/*
 *@desc: reads data from 25K22 eeprom
 *@params: (unsigned short)addr
 *@return: (unsigned char) eep_data
 */
unsigned char EEPROM_Read(unsigned char addr)
{
	EEADR = addr;		  // word address
	EECON1bits.EEPGD = 0; // reset memory select bit
	EECON1bits.RD = 1;	  // set read control bit

	return EEDATA;
}

// writing to eeprom
//  I2C2_Start(); //start condition
//  check_ack = I2C2_Send(EEPROM_ADDRESS << 1); // send control code(4 bits), the chip select(3 bits) and the R/W bit (logic low)
//  I2C2_Send(0x00); //address high byte (MSB)
//  I2C2_Send(0x01); //address low byte (LSB)
//  I2C2_Send(0x0A); //data word to be written into the addressed memory location
//  I2C2_Stop();     //send stop condition

// reading from eeprom
//  I2C2_Start(); //send start condition
//  I2C2_Send(EEPROM_ADDRESS << 1); //send slave address with write bit
//  I2C2_Send(0x00); //word address high byte
//  I2C2_Send(0x01); //word address low byte
//
//  I2C2_Start(); //send start condition again
//  I2C2_Send((EEPROM_ADDRESS << 1) | 0x01); //send slave address with read bit
//  eeprom_data = I2C2_Read(); //read 8 bit data from the mentioned address
//  I2C2_Stop(); //send stop condition

/*
 *@desc: reads password bytes from PIC EEPROM
 *@params: none
 *@return: none
 */
void ReadMasterPasswordFromEEPROM()
{
	unsigned char password_length = 0x00;
	unsigned char password_addr = PASSWORD_ADDR_START;

	// read master password from PIC EEPROM, we will store that password as cache
	__delay_ms(500);
	password_length = EEPROM_Read(password_addr);
	__delay_ms(500);
	password_addr += 1; // Increment address counter by 1

	if (password_length != 0xFF)
	{
		// store whole password in cache array
		for (unsigned char index = 0x00; index < password_length; index++)
		{
			__delay_ms(500);
			master.PASSWORD_CACHE[index] = EEPROM_Read(password_addr + index); // store each password byte in cache buffer
			__delay_ms(500);
		}

		isExceptionRaised = 0x00; // reset exception raise flag
		exception_code = 0x00;	  // clear exception code variable
	}
	else
	{
		isPasswordSet = 0x00; // clear the password set flag, this means user needs to set master password to interact with this device
	}

	// store cached password length in global struct variable.
	master.cache_length = password_length;
}

/*
 *@desc: reads payload data which is stored on AT24LC256
 *@params: none
 *@return: none
 */
void ReadCredentials(){
	//extract starting address from read credential request
	//payload length is all we know that it is 2 bytes, payload will contain high and low byte

	unsigned char index = 0x00;
	unsigned char last_char_index = 0x00;
	unsigned char response_index = 0x00;
	unsigned char payload_length = 0x02;
	unsigned short credential_length = 0x00;
	unsigned char ADDR[2];
	unsigned short START_ADDR = 0x0000;

	for(index = 0; index < payload_length; index++)
	     ADDR[index] = request_unit.payload_data[index];

	UART_TransmitChar(ADDR[0]);
	UART_TransmitChar(ADDR[1]);

	//ADDR[0] - HIGH BYTE
	//ADDR[1] - LOW BYTE
	//now we got the start address, as we know, we will get length of credential, extract that first
	START_ADDR = (ADDR[0] << 8) | ADDR[1];

	__delay_ms(50);
	//read credential length from eeprom
	credential_length = (readByteAT24_EEPROM(START_ADDR)) & 0xFF;
	__delay_ms(50);	

	UART_TransmitChar((credential_length >> 8) & 0xFF);
	UART_TransmitChar(credential_length & 0xFF);

	START_ADDR += 1; //point to next location

	if(credential_length == 0x00FF){
		//this means it's an empty location, there is no credential stored with this starting address
		UART_TransmitChar(0xFF);
		return;
	}
	
	//update response buffer first two bytes	
	responseBuffer[0] = request_unit.DEVICE_ADDR;
        responseBuffer[1] = request_unit.ORDER_CODE;

	response_index += 2;

	//store credentials in response buffer
	for(unsigned short i = 0; i < credential_length; i++){
		responseBuffer[response_index + i] = readByteAT24_EEPROM(START_ADDR + i);
		UART_TransmitChar(responseBuffer[response_index + i]);
		last_char_index = response_index + i;
	}

	//end response buffer with null character
	responseBuffer[last_char_index + 1] = 0x00; //end with null character
}

/*
 *@desc: stores all the address inside cache
 *@params: none
 *@return: none
 */
void storeLookUpEntries(){
	unsigned short section_start = LOOKUP_SECTION_START;
	
	for(unsigned int i = 0; i < LOOKUP_SECTION_CACHE_SIZE; i++)
		LOOKUP_SECTION_CACHE[i] = readByteAT24_EEPROM((section_start + i));
}

/*
 *@desc: matches user entered password with cache stored password
 *@params: none
 *@return: (unsigned char) matchFlag, will either 0x01 or 0x00, depends on the authentication
 */
unsigned char isPasswordMatched()
{
	unsigned char payload_length = 0x00;
	unsigned char index = 0x00;
	unsigned char matchFlag = 0x01;

	// length of password payload
	payload_length = requestBuffer[request_unit.payload_length_index];

	// check if password length matches
	if (payload_length != master.cache_length)
	{
		// if master password length does not matches with user entered password
		return 0x00;
	}

	// if length matches, check if password matches bytes.
	for (index = 0x00; index < master.cache_length; index++)
	{

		UART_TransmitChar(master.PASSWORD_CACHE[index]);
		UART_TransmitChar(request_unit.payload_data[index]);

		if (master.PASSWORD_CACHE[index] != request_unit.payload_data[index])
		{					  // if any one of the bytes mismatches, clear the flag and break the loop
			matchFlag = 0x00; // reset the flag
			break;			  // break the loop here itself
		}
	}

	return matchFlag;
}

/*
 *@desc: reads entries from lookup cache
 *@params: none
 *@return: none
 */
void ReadLookupEntries(){
	for(unsigned int index = 0; index < LOOKUP_SECTION_CACHE_SIZE; index++){
		UART_TransmitChar(LOOKUP_SECTION_CACHE[index]);
	}
}

/*
 *@desc: formats AT24LC256, substitutes each byte by 0xFF
 *@params: none
 *@return: none
 */
void FormatDrive(){
	unsigned short index = 0x0000;
	unsigned char mask_data = 0xFF;	

	//U sure brother ?
	for(index = 0x0000; index <= EEPROM_CAPACITY; index++){

		//transmit address which gets erased to notify user
		UART_TransmitChar((index >> 8) & 0xFF); //HIGH Byte
		UART_TransmitChar(index & 0xFF); //LOW Byte

		__delay_ms(10);
		writeByteAT24_EEPROM(index, mask_data);	
	}

	//we have to reset PIC-EEPROM ADDRESS POINTER
	__delay_ms(500);
	EEPROM_Write(ADDRESS_POINTER_H, 0xFF);
	__delay_ms(500);
	EEPROM_Write(ADDRESS_POINTER_L, 0xFF);		
	__delay_ms(500);

	//create response buffer
	responseBuffer[0] = request_unit.DEVICE_ADDR;
        responseBuffer[1] = request_unit.ORDER_CODE;
}


void main()
{
	// Configure the oscillator(64MHz using PLL)
	OSCCON = 0x70;	// 0b01110000
	OSCTUNE = 0xC0; // 0b11000000

	// #asm
	//	OSCCON_REG equ 0xFD3
	//	OSCTUNE_REG equ 0xF9B
	//
	//	;configuring oscillator(64Mhz using PLL)
	//
	//	MOVLW 0x70       ;load contents in w register
	//	MOVWF OSCCON_REG ;load contents from w into OSCCON register
	//
	//	MOVLW 0xC0       ;load contents in w register
	//	MOVWF OSCTUNE_REG;load contents from w into OSCTUNE register
	// #endasm

	UART_Init();			  // initialises uart peripherals
	I2C2_Init();			  // initialises i2c peripherals
	ReadMasterPasswordFromEEPROM();   // reads password from pic eeprom and caches it in an array buffer.
	__delay_ms(100);
	storeLookUpEntries();		  // reads all the entries in the lookup table
	__delay_ms(100);

	while (1)
	{
		if (interrupt_flag)
		{
			createResponse();
			interrupt_flag = 0x00;
		}
	}
}
