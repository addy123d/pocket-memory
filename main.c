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
#define RESPONSE_PACKET_SIZE 4
#define PACKET_START_MARKER_LOWER 0x3A
#define PACKET_START_MARKER_UPPER 0x23
#define PACKET_END_MARKER_LOWER 0x0D
#define PACKET_END_MARKER_UPPER 0x0A
#define EEPROM_CAPACITY 0x7FFF       //32,768 locations of 8 bit each (32K x 8).

unsigned int timeout = 1000;		 // timeout variable
unsigned char interrupt_flag = 0x00; // interrupt flag
unsigned char requestBuffer[PACKET_SIZE];
unsigned char responseBuffer[RESPONSE_PACKET_SIZE]; // we will send 3 packets, device code, order code, additional data
unsigned char start_sequence_flag = 0x00;
unsigned char end_sequence_flag = 0x00;
unsigned short at24_eeprom_address = 0x0000;
unsigned char checkAck = 0x01;


enum ORDER_CODES
{
	PING = 0x11,
	WRITE_MEM = 0x01,
	READ_MEM = 0x02,
	UPDATE_MEM = 0x03,
	DELETE_MEM = 0x04
};

// struct to hold variables related to receiving packets
typedef struct
{
	unsigned char buffer[PACKET_SIZE];         // buffer to store received packet data
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

UART_Request request_unit = {0, 0, 0, 0};
ReceivePacketData receiveData = {0, 0, 0};

/*integer to hex array*/
unsigned char digits[10] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09};

// Function declarations
void processRequest(void);
void createResponse(void);
void createPingResponse(void);
void writeDataToEEPROM();
void writeByteAT24_EEPROM(unsigned int, unsigned char);
int hexCharToInt(unsigned char hexValue);
void sendResponse(void);

/*
 *@desc: initialise uart, set appropriate registers regarding UART on PIC18F25K22
 *@params: none
 *@return: none
 */
void UART_Init()
{
	float temp;

	 TRISC6 = 0;           /* Make Tx pin as output*/
	 TRISC7 = 1;           /* Make Rx pin as input*/
	 ANSELCbits.ANSC7 = 0; // set input as digital

	
	INTCONbits.GIE = 1;    // Enable global interrupts
	INTCONbits.PEIE = 1;   // Enable peripheral interrupts
	PIE1bits.RC1IE = 1;    // set usart1 receive interrupt enable bit
	

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
//#endasm

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
		PIE1bits.RC1IE = 0; //disable usart receive interrupt
		
		//UART_TransmitChar(receivedChar);

		// check if we are currently receiving a packet
		if (!receiveData.receiving)
		{
			//first packet will be LOW byte of START sequence, followed by HIGH byte of START sequence
			// check if the received character is lower byte of start sequence
			if ((receivedChar == PACKET_START_MARKER_LOWER) && (start_sequence_flag == 0x00))
			{
				// set start_sequence_flag and wait for lower byte
				start_sequence_flag ^= 1;
			}

			// check if the received character is upper byte of start sequence
			if ((receivedChar == PACKET_START_MARKER_UPPER) && (start_sequence_flag == 0x01))
			{
				// we got a start sequence
				receiveData.receiving = 0x01;
				receiveData.index = 0;

				// clear start sequence flag
				start_sequence_flag ^= 1;
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
						end_sequence_flag  = 0x00;

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

		PIE1bits.RC1IE = 1; //enable usart receive interrupt
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

	// extract credential data from buffer and store it in struct buffer
	for (buffer_index = 0; requestBuffer[buffer_index + 2] != 0x00; buffer_index++){
		request_unit.payload_data[buffer_index] = requestBuffer[buffer_index + 2];

		//increment index, until reaches at the end of data, we want location, where length of data is stored.
		length_index = buffer_index + 2;
        }

	//store length location in struct as a global variable
	request_unit.payload_length_index = length_index;

	#ifdef DEBUG
		UART_TransmitChar(requestBuffer[length_index]); //this will transmit length of data
     	#endif
}

/*
 *@desc: create response, perform actions based on request
 *@params: none
 *@return: none
 */
void createResponse()
{
	unsigned char ORDER_CODE = request_unit.ORDER_CODE;

	//if device code matches with our device code, then only perform operations or send response. 
	if (request_unit.DEVICE_ADDR == DEVICE_CODE)
	{
		// if request matches our device code, only then this device will respond.
		switch (ORDER_CODE)
		{
		case PING: // ping request from master
			createPingResponse();
			break;
		case WRITE_MEM:
			writeDataToEEPROM();
			break;
		case READ_MEM:
			break;
		case UPDATE_MEM:
			break;
		case DELETE_MEM:
			break;
		default: // invalid function code
			break;
		}

		// send response bytes one by one
		sendResponse();
	}
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
	
	payload_length = (requestBuffer[request_unit.payload_length_index]) & 0xFF;																																																																																																																																									

	//store length of data first.
	writeByteAT24_EEPROM(at24_eeprom_address, requestBuffer[request_unit.payload_length_index]);
	at24_eeprom_address += 1; //increment address counter by 1 

	__delay_ms(10);

	//store data
	for(unsigned short i = 0; i < payload_length; i++){
		writeByteAT24_EEPROM((at24_eeprom_address + i), request_unit.payload_data[i]);
		__delay_ms(10);
	}

	//update address, at24_eeprom_address will point towards new location to store next data
	at24_eeprom_address += payload_length;
	//as, eeprom address is incremented by one while storing length of password, so addr + payload_length, will result into location, which is next to last byte stored.
	//for example, while storing length, address incremented by 1, so it became 0x0001.
        // now, 0x0001 + 0x000F -> 0x0010, this is the new location

	__delay_ms(100);
	

	//read last byte save in eeprom
	I2C2_Start(); //send start condition
	I2C2_Send(EEPROM_ADDRESS << 1); //send slave address with write bit
	I2C2_Send(((at24_eeprom_address - 1) >> 8) & 0xFF); //word address high byte
	I2C2_Send((at24_eeprom_address - 1) & 0xFF); //word address low byte

	I2C2_Start(); //send start condition again
	I2C2_Send((EEPROM_ADDRESS << 1) | 0x01); //send slave address with read bit
	eeprom_data = I2C2_Read(); //read 8 bit data from the mentioned address
	I2C2_Stop(); //send stop condition


	// update response buffer
	responseBuffer[0] = request_unit.DEVICE_ADDR;
	responseBuffer[1] = request_unit.ORDER_CODE;
	responseBuffer[2] = eeprom_data;         		// last data stored - address high byte
	responseBuffer[3] = (!checkAck) ? 0x01 : 0x00;		// last data stored - low byte
}

/*
 *@desc: writes byte to eeprom
 *@params: none
 *@return: none
 */
void writeByteAT24_EEPROM(unsigned int address, unsigned char data)
{
	I2C2_Start();					  // start condition
	checkAck = I2C2_Send(EEPROM_ADDRESS << 1);	  		  // send control code(4 bits), the chip select(3 bits) and the R/W bit (logic low)
	I2C2_Send((address >> 8) & 0xFF); 		  // address high byte (MSB)
	I2C2_Send(address & 0xFF);		  	  // address low byte (LSB)
	I2C2_Send(data);				  // data word to be written into the addressed memory location
	I2C2_Stop();					  // send stop condition
}


/*
 *@desc: send response byte by byte
 *@params: none
 *@return: none
 */
void sendResponse()
{
	unsigned int index = 0;

	// send start sequence
	UART_TransmitChar(0x3A); // send HIGH Byte of start sequence
	__delay_ms(10);
	UART_TransmitChar(0x23); // send LOW Byte of start sequence
	__delay_ms(10);

	for (index = 0; index < RESPONSE_PACKET_SIZE; index++)
	{
		UART_TransmitChar(responseBuffer[index]);
		__delay_ms(10);
	}

	// send end sequence
	UART_TransmitChar(0x0D);
	__delay_ms(10);
	UART_TransmitChar(0x0A);


	//reset request buffer
	index = PACKET_SIZE;
	while(index > 0){
	     requestBuffer[PACKET_SIZE - index] = 0xFF;
	     index--;
	}
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

void main()
{
	// Configure the oscillator(64MHz using PLL)
	OSCCON = 0x70;  // 0b01110000
	OSCTUNE = 0xC0; // 0b11000000

//#asm
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
//#endasm

	UART_Init(); // initialises uart peripherals
	I2C2_Init(); // initialises i2c peripherals

	while (1)
	{
		if (interrupt_flag)
		{
			createResponse();
			interrupt_flag = 0x00;
		}
	}
}
