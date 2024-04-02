/*
 * File:   main.c
 * Author: Aditya Chaudhary
 *
 * Created on September 04, 2024, 4:53 AM
 */
#include <xc.h>
#include <pic18f25k22.h>
#include "config.h"

void main(){
    // Configure the oscillator(64MHz using PLL)
    OSCCON = 0x70;  // 0b01110000
    OSCTUNE = 0xC0; // 0b11000000
    
    
    while(1){
    }
}