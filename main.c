/*
 * File:   main.c
 * Author: Aditya Chaudhary
 *
 * Created on April 04, 2024, 4:53 AM
 */
#include <xc.h>
#include <pic18f25k22.h>
#include "config.h"
#include "i2c.h"


#define F_CPU 64000000 / 64
#define BAUD_RATE 9600
#define EEPROM_ADDRESS 0x50

unsigned char check_ack = 0x01;
unsigned char eeprom_data = 0x00;
unsigned char eeprom_query_flag = 0x00;

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

    /* Baud rate=9600, SPBRG = (F_CPU /(64*9600))-1*/
    temp = (((float)(F_CPU) / (float)BAUD_RATE) - 1);
    SPBRG1 = (int)temp;

    INTCONbits.GIE = 1;    // Enable global interrupts
    INTCONbits.PEIE = 1;   // Enable peripheral interrupts
    PIE1bits.RC1IE = 1;    // set usart1 receive interrupt enable bit


    TXSTA1 = 0x20; /* Enable Transmit(TX) */
    RCSTA1 = 0x90; /* Enable Receive(RX) & Serial */
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
    unsigned char receive_data = 0x00;

    //check whether receive interrupt flag is set or not
    if (PIR1bits.RC1IF)
    {
     	receive_data = RCREG1;

        PIR1bits.RC1IF = 0;
    }

    //echo this same character back to host, when eeprom acknowledges our master
    if(check_ack == 0x00)
    {
        if(receive_data == 0x01){
            eeprom_query_flag = 0x01;
        }else{
            UART_TransmitChar(receive_data+1);
        }
    
    }
}




void main(){
    // Configure the oscillator(64MHz using PLL)
    OSCCON = 0x70;  // 0b01110000
    OSCTUNE = 0xC0; // 0b11000000

    UART_Init(); //initialises uart peripherals
    
    //check acknowledgement from eeprom memory
    I2C2_Init();
    
    I2C2_Start(); //start condition
    check_ack = I2C2_Send(EEPROM_ADDRESS << 1); // send control code(4 bits), the chip select(3 bits) and the R/W bit (logic low)
    I2C2_Send(0x00); //address high byte (MSB)
    I2C2_Send(0x01); //address low byte (LSB)
    I2C2_Send(0x0A); //data word to be written into the addressed memory location
    I2C2_Stop();     //send stop condition   

    while(1){
    	if(eeprom_query_flag){
	   //read eeprom memory	   
	   //send word address as part of write operation

	   I2C2_Start(); //send start condition
	   I2C2_Send(EEPROM_ADDRESS << 1); //send slave address with write bit
	   I2C2_Send(0x00); //word address high byte
	   I2C2_Send(0x01); //word address low byte

	   I2C2_Start(); //send start condition again
	   I2C2_Send((EEPROM_ADDRESS << 1) | 0x01); //send slave address with read bit
	   eeprom_data = I2C2_Read(); //read 8 bit data from the mentioned address
	   I2C2_Stop(); //send stop condition	

	   UART_TransmitChar(eeprom_data);
	   eeprom_query_flag = 0x00;
	}
    }
}
