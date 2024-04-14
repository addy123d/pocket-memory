subtitle "Microchip MPLAB XC8 C Compiler v2.46 (Free license) build 20240104201356 Og9 "

pagewidth 120

	opt flic

	processor	18F25K22
include "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\18f25k22.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 54 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ANSELA equ 0F38h ;# 
# 99 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ANSELB equ 0F39h ;# 
# 149 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ANSELC equ 0F3Ah ;# 
# 200 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PMD2 equ 0F3Dh ;# 
# 238 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PMD1 equ 0F3Eh ;# 
# 303 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PMD0 equ 0F3Fh ;# 
# 380 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
VREFCON2 equ 0F40h ;# 
# 385 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DACCON1 equ 0F40h ;# 
# 482 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
VREFCON1 equ 0F41h ;# 
# 487 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DACCON0 equ 0F41h ;# 
# 602 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
VREFCON0 equ 0F42h ;# 
# 607 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FVRCON equ 0F42h ;# 
# 696 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUICON equ 0F43h ;# 
# 701 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUICONH equ 0F43h ;# 
# 846 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCONL equ 0F44h ;# 
# 851 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCON1 equ 0F44h ;# 
# 1000 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCONH equ 0F45h ;# 
# 1005 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCON0 equ 0F45h ;# 
# 1112 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SRCON1 equ 0F46h ;# 
# 1174 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SRCON0 equ 0F47h ;# 
# 1245 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPTMRS1 equ 0F48h ;# 
# 1297 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPTMRS0 equ 0F49h ;# 
# 1371 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T6CON equ 0F4Ah ;# 
# 1442 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PR6 equ 0F4Bh ;# 
# 1462 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR6 equ 0F4Ch ;# 
# 1482 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T5GCON equ 0F4Dh ;# 
# 1577 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T5CON equ 0F4Eh ;# 
# 1686 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR5 equ 0F4Fh ;# 
# 1693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR5L equ 0F4Fh ;# 
# 1713 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR5H equ 0F50h ;# 
# 1733 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T4CON equ 0F51h ;# 
# 1804 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PR4 equ 0F52h ;# 
# 1824 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR4 equ 0F53h ;# 
# 1844 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP5CON equ 0F54h ;# 
# 1908 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR5 equ 0F55h ;# 
# 1915 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR5L equ 0F55h ;# 
# 1935 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR5H equ 0F56h ;# 
# 1955 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP4CON equ 0F57h ;# 
# 2019 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR4 equ 0F58h ;# 
# 2026 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR4L equ 0F58h ;# 
# 2046 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR4H equ 0F59h ;# 
# 2066 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTR3CON equ 0F5Ah ;# 
# 2142 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCP3AS equ 0F5Bh ;# 
# 2147 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP3AS equ 0F5Bh ;# 
# 2384 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWM3CON equ 0F5Ch ;# 
# 2454 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP3CON equ 0F5Dh ;# 
# 2536 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR3 equ 0F5Eh ;# 
# 2543 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR3L equ 0F5Eh ;# 
# 2563 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR3H equ 0F5Fh ;# 
# 2583 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SLRCON equ 0F60h ;# 
# 2615 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
WPUB equ 0F61h ;# 
# 2677 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IOCB equ 0F62h ;# 
# 2716 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTR2CON equ 0F63h ;# 
# 2856 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCP2AS equ 0F64h ;# 
# 2861 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP2AS equ 0F64h ;# 
# 3098 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWM2CON equ 0F65h ;# 
# 3168 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP2CON equ 0F66h ;# 
# 3250 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR2 equ 0F67h ;# 
# 3257 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR2L equ 0F67h ;# 
# 3277 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR2H equ 0F68h ;# 
# 3297 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2CON3 equ 0F69h ;# 
# 3359 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2MSK equ 0F6Ah ;# 
# 3429 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2CON2 equ 0F6Bh ;# 
# 3574 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2CON1 equ 0F6Ch ;# 
# 3694 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2STAT equ 0F6Dh ;# 
# 4094 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2ADD equ 0F6Eh ;# 
# 4164 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2BUF equ 0F6Fh ;# 
# 4184 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCON2 equ 0F70h ;# 
# 4189 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUD2CON equ 0F70h ;# 
# 4446 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCSTA2 equ 0F71h ;# 
# 4451 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC2STA equ 0F71h ;# 
# 4734 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXSTA2 equ 0F72h ;# 
# 4739 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX2STA equ 0F72h ;# 
# 4986 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXREG2 equ 0F73h ;# 
# 4991 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX2REG equ 0F73h ;# 
# 5024 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCREG2 equ 0F74h ;# 
# 5029 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC2REG equ 0F74h ;# 
# 5062 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRG2 equ 0F75h ;# 
# 5067 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP2BRG equ 0F75h ;# 
# 5100 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRGH2 equ 0F76h ;# 
# 5105 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP2BRGH equ 0F76h ;# 
# 5138 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM2CON1 equ 0F77h ;# 
# 5143 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM12CON equ 0F77h ;# 
# 5260 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM2CON0 equ 0F78h ;# 
# 5265 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM2CON equ 0F78h ;# 
# 5540 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM1CON0 equ 0F79h ;# 
# 5545 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM1CON equ 0F79h ;# 
# 5962 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE4 equ 0F7Ah ;# 
# 5994 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR4 equ 0F7Bh ;# 
# 6026 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR4 equ 0F7Ch ;# 
# 6066 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE5 equ 0F7Dh ;# 
# 6098 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR5 equ 0F7Eh ;# 
# 6130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR5 equ 0F7Fh ;# 
# 6176 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTA equ 0F80h ;# 
# 6467 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTB equ 0F81h ;# 
# 6840 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTC equ 0F82h ;# 
# 7171 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTE equ 0F84h ;# 
# 7246 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LATA equ 0F89h ;# 
# 7358 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LATB equ 0F8Ah ;# 
# 7470 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LATC equ 0F8Bh ;# 
# 7582 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISA equ 0F92h ;# 
# 7587 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DDRA equ 0F92h ;# 
# 7804 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISB equ 0F93h ;# 
# 7809 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DDRB equ 0F93h ;# 
# 8026 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISC equ 0F94h ;# 
# 8031 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DDRC equ 0F94h ;# 
# 8248 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISE equ 0F96h ;# 
# 8269 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
OSCTUNE equ 0F9Bh ;# 
# 8339 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
HLVDCON equ 0F9Ch ;# 
# 8344 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LVDCON equ 0F9Ch ;# 
# 8619 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE1 equ 0F9Dh ;# 
# 8696 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR1 equ 0F9Eh ;# 
# 8773 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR1 equ 0F9Fh ;# 
# 8850 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE2 equ 0FA0h ;# 
# 8936 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR2 equ 0FA1h ;# 
# 9022 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR2 equ 0FA2h ;# 
# 9108 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE3 equ 0FA3h ;# 
# 9218 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR3 equ 0FA4h ;# 
# 9296 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR3 equ 0FA5h ;# 
# 9374 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EECON1 equ 0FA6h ;# 
# 9440 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EECON2 equ 0FA7h ;# 
# 9460 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EEDATA equ 0FA8h ;# 
# 9480 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EEADR equ 0FA9h ;# 
# 9550 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCSTA1 equ 0FABh ;# 
# 9555 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCSTA equ 0FABh ;# 
# 9559 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC1STA equ 0FABh ;# 
# 10006 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXSTA1 equ 0FACh ;# 
# 10011 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXSTA equ 0FACh ;# 
# 10015 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX1STA equ 0FACh ;# 
# 10381 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXREG1 equ 0FADh ;# 
# 10386 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXREG equ 0FADh ;# 
# 10390 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX1REG equ 0FADh ;# 
# 10459 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCREG1 equ 0FAEh ;# 
# 10464 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCREG equ 0FAEh ;# 
# 10468 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC1REG equ 0FAEh ;# 
# 10537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRG1 equ 0FAFh ;# 
# 10542 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRG equ 0FAFh ;# 
# 10546 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP1BRG equ 0FAFh ;# 
# 10615 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRGH1 equ 0FB0h ;# 
# 10620 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRGH equ 0FB0h ;# 
# 10624 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP1BRGH equ 0FB0h ;# 
# 10693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T3CON equ 0FB1h ;# 
# 10801 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR3 equ 0FB2h ;# 
# 10808 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR3L equ 0FB2h ;# 
# 10828 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR3H equ 0FB3h ;# 
# 10848 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T3GCON equ 0FB4h ;# 
# 10943 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCP1AS equ 0FB6h ;# 
# 10948 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCPAS equ 0FB6h ;# 
# 11325 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWM1CON equ 0FB7h ;# 
# 11330 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWMCON equ 0FB7h ;# 
# 11579 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCON1 equ 0FB8h ;# 
# 11584 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCON equ 0FB8h ;# 
# 11588 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCTL equ 0FB8h ;# 
# 11592 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUD1CON equ 0FB8h ;# 
# 12253 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTR1CON equ 0FB9h ;# 
# 12258 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTRCON equ 0FB9h ;# 
# 12403 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T2CON equ 0FBAh ;# 
# 12474 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PR2 equ 0FBBh ;# 
# 12494 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR2 equ 0FBCh ;# 
# 12514 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP1CON equ 0FBDh ;# 
# 12596 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR1 equ 0FBEh ;# 
# 12603 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR1L equ 0FBEh ;# 
# 12623 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR1H equ 0FBFh ;# 
# 12643 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADCON2 equ 0FC0h ;# 
# 12714 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADCON1 equ 0FC1h ;# 
# 12782 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADCON0 equ 0FC2h ;# 
# 12907 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADRES equ 0FC3h ;# 
# 12914 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADRESL equ 0FC3h ;# 
# 12934 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADRESH equ 0FC4h ;# 
# 12954 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1CON2 equ 0FC5h ;# 
# 12959 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPCON2 equ 0FC5h ;# 
# 13308 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1CON1 equ 0FC6h ;# 
# 13313 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPCON1 equ 0FC6h ;# 
# 13546 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1STAT equ 0FC7h ;# 
# 13551 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPSTAT equ 0FC7h ;# 
# 14176 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1ADD equ 0FC8h ;# 
# 14181 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPADD equ 0FC8h ;# 
# 14430 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1BUF equ 0FC9h ;# 
# 14435 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPBUF equ 0FC9h ;# 
# 14484 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1MSK equ 0FCAh ;# 
# 14489 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPMSK equ 0FCAh ;# 
# 14622 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1CON3 equ 0FCBh ;# 
# 14627 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPCON3 equ 0FCBh ;# 
# 14744 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T1GCON equ 0FCCh ;# 
# 14839 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T1CON equ 0FCDh ;# 
# 14952 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR1 equ 0FCEh ;# 
# 14959 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR1L equ 0FCEh ;# 
# 14979 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR1H equ 0FCFh ;# 
# 14999 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCON equ 0FD0h ;# 
# 15132 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
WDTCON equ 0FD1h ;# 
# 15160 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
OSCCON2 equ 0FD2h ;# 
# 15217 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
OSCCON equ 0FD3h ;# 
# 15300 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T0CON equ 0FD5h ;# 
# 15370 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR0 equ 0FD6h ;# 
# 15377 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR0L equ 0FD6h ;# 
# 15397 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR0H equ 0FD7h ;# 
# 15417 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
STATUS equ 0FD8h ;# 
# 15488 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR2 equ 0FD9h ;# 
# 15495 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR2L equ 0FD9h ;# 
# 15515 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR2H equ 0FDAh ;# 
# 15522 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PLUSW2 equ 0FDBh ;# 
# 15542 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PREINC2 equ 0FDCh ;# 
# 15562 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTDEC2 equ 0FDDh ;# 
# 15582 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTINC2 equ 0FDEh ;# 
# 15602 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INDF2 equ 0FDFh ;# 
# 15622 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BSR equ 0FE0h ;# 
# 15629 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR1 equ 0FE1h ;# 
# 15636 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR1L equ 0FE1h ;# 
# 15656 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR1H equ 0FE2h ;# 
# 15663 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PLUSW1 equ 0FE3h ;# 
# 15683 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PREINC1 equ 0FE4h ;# 
# 15703 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTDEC1 equ 0FE5h ;# 
# 15723 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTINC1 equ 0FE6h ;# 
# 15743 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INDF1 equ 0FE7h ;# 
# 15763 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
WREG equ 0FE8h ;# 
# 15801 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR0 equ 0FE9h ;# 
# 15808 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR0L equ 0FE9h ;# 
# 15828 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR0H equ 0FEAh ;# 
# 15835 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PLUSW0 equ 0FEBh ;# 
# 15855 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PREINC0 equ 0FECh ;# 
# 15875 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTDEC0 equ 0FEDh ;# 
# 15895 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTINC0 equ 0FEEh ;# 
# 15915 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INDF0 equ 0FEFh ;# 
# 15935 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INTCON3 equ 0FF0h ;# 
# 16027 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INTCON2 equ 0FF1h ;# 
# 16097 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INTCON equ 0FF2h ;# 
# 16214 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PROD equ 0FF3h ;# 
# 16221 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PRODL equ 0FF3h ;# 
# 16241 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PRODH equ 0FF4h ;# 
# 16261 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TABLAT equ 0FF5h ;# 
# 16283 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTR equ 0FF6h ;# 
# 16290 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTRL equ 0FF6h ;# 
# 16310 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTRH equ 0FF7h ;# 
# 16330 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTRU equ 0FF8h ;# 
# 16361 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCLAT equ 0FF9h ;# 
# 16368 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PC equ 0FF9h ;# 
# 16375 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCL equ 0FF9h ;# 
# 16395 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCLATH equ 0FFAh ;# 
# 16415 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCLATU equ 0FFBh ;# 
# 16422 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
STKPTR equ 0FFCh ;# 
# 16528 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOS equ 0FFDh ;# 
# 16535 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOSL equ 0FFDh ;# 
# 16555 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOSH equ 0FFEh ;# 
# 16575 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ANSELA equ 0F38h ;# 
# 99 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ANSELB equ 0F39h ;# 
# 149 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ANSELC equ 0F3Ah ;# 
# 200 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PMD2 equ 0F3Dh ;# 
# 238 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PMD1 equ 0F3Eh ;# 
# 303 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PMD0 equ 0F3Fh ;# 
# 380 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
VREFCON2 equ 0F40h ;# 
# 385 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DACCON1 equ 0F40h ;# 
# 482 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
VREFCON1 equ 0F41h ;# 
# 487 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DACCON0 equ 0F41h ;# 
# 602 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
VREFCON0 equ 0F42h ;# 
# 607 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FVRCON equ 0F42h ;# 
# 696 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUICON equ 0F43h ;# 
# 701 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUICONH equ 0F43h ;# 
# 846 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCONL equ 0F44h ;# 
# 851 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCON1 equ 0F44h ;# 
# 1000 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCONH equ 0F45h ;# 
# 1005 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CTMUCON0 equ 0F45h ;# 
# 1112 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SRCON1 equ 0F46h ;# 
# 1174 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SRCON0 equ 0F47h ;# 
# 1245 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPTMRS1 equ 0F48h ;# 
# 1297 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPTMRS0 equ 0F49h ;# 
# 1371 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T6CON equ 0F4Ah ;# 
# 1442 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PR6 equ 0F4Bh ;# 
# 1462 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR6 equ 0F4Ch ;# 
# 1482 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T5GCON equ 0F4Dh ;# 
# 1577 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T5CON equ 0F4Eh ;# 
# 1686 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR5 equ 0F4Fh ;# 
# 1693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR5L equ 0F4Fh ;# 
# 1713 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR5H equ 0F50h ;# 
# 1733 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T4CON equ 0F51h ;# 
# 1804 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PR4 equ 0F52h ;# 
# 1824 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR4 equ 0F53h ;# 
# 1844 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP5CON equ 0F54h ;# 
# 1908 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR5 equ 0F55h ;# 
# 1915 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR5L equ 0F55h ;# 
# 1935 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR5H equ 0F56h ;# 
# 1955 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP4CON equ 0F57h ;# 
# 2019 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR4 equ 0F58h ;# 
# 2026 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR4L equ 0F58h ;# 
# 2046 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR4H equ 0F59h ;# 
# 2066 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTR3CON equ 0F5Ah ;# 
# 2142 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCP3AS equ 0F5Bh ;# 
# 2147 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP3AS equ 0F5Bh ;# 
# 2384 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWM3CON equ 0F5Ch ;# 
# 2454 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP3CON equ 0F5Dh ;# 
# 2536 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR3 equ 0F5Eh ;# 
# 2543 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR3L equ 0F5Eh ;# 
# 2563 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR3H equ 0F5Fh ;# 
# 2583 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SLRCON equ 0F60h ;# 
# 2615 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
WPUB equ 0F61h ;# 
# 2677 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IOCB equ 0F62h ;# 
# 2716 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTR2CON equ 0F63h ;# 
# 2856 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCP2AS equ 0F64h ;# 
# 2861 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP2AS equ 0F64h ;# 
# 3098 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWM2CON equ 0F65h ;# 
# 3168 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP2CON equ 0F66h ;# 
# 3250 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR2 equ 0F67h ;# 
# 3257 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR2L equ 0F67h ;# 
# 3277 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR2H equ 0F68h ;# 
# 3297 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2CON3 equ 0F69h ;# 
# 3359 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2MSK equ 0F6Ah ;# 
# 3429 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2CON2 equ 0F6Bh ;# 
# 3574 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2CON1 equ 0F6Ch ;# 
# 3694 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2STAT equ 0F6Dh ;# 
# 4094 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2ADD equ 0F6Eh ;# 
# 4164 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP2BUF equ 0F6Fh ;# 
# 4184 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCON2 equ 0F70h ;# 
# 4189 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUD2CON equ 0F70h ;# 
# 4446 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCSTA2 equ 0F71h ;# 
# 4451 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC2STA equ 0F71h ;# 
# 4734 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXSTA2 equ 0F72h ;# 
# 4739 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX2STA equ 0F72h ;# 
# 4986 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXREG2 equ 0F73h ;# 
# 4991 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX2REG equ 0F73h ;# 
# 5024 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCREG2 equ 0F74h ;# 
# 5029 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC2REG equ 0F74h ;# 
# 5062 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRG2 equ 0F75h ;# 
# 5067 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP2BRG equ 0F75h ;# 
# 5100 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRGH2 equ 0F76h ;# 
# 5105 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP2BRGH equ 0F76h ;# 
# 5138 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM2CON1 equ 0F77h ;# 
# 5143 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM12CON equ 0F77h ;# 
# 5260 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM2CON0 equ 0F78h ;# 
# 5265 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM2CON equ 0F78h ;# 
# 5540 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM1CON0 equ 0F79h ;# 
# 5545 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CM1CON equ 0F79h ;# 
# 5962 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE4 equ 0F7Ah ;# 
# 5994 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR4 equ 0F7Bh ;# 
# 6026 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR4 equ 0F7Ch ;# 
# 6066 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE5 equ 0F7Dh ;# 
# 6098 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR5 equ 0F7Eh ;# 
# 6130 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR5 equ 0F7Fh ;# 
# 6176 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTA equ 0F80h ;# 
# 6467 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTB equ 0F81h ;# 
# 6840 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTC equ 0F82h ;# 
# 7171 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PORTE equ 0F84h ;# 
# 7246 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LATA equ 0F89h ;# 
# 7358 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LATB equ 0F8Ah ;# 
# 7470 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LATC equ 0F8Bh ;# 
# 7582 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISA equ 0F92h ;# 
# 7587 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DDRA equ 0F92h ;# 
# 7804 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISB equ 0F93h ;# 
# 7809 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DDRB equ 0F93h ;# 
# 8026 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISC equ 0F94h ;# 
# 8031 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
DDRC equ 0F94h ;# 
# 8248 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TRISE equ 0F96h ;# 
# 8269 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
OSCTUNE equ 0F9Bh ;# 
# 8339 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
HLVDCON equ 0F9Ch ;# 
# 8344 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
LVDCON equ 0F9Ch ;# 
# 8619 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE1 equ 0F9Dh ;# 
# 8696 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR1 equ 0F9Eh ;# 
# 8773 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR1 equ 0F9Fh ;# 
# 8850 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE2 equ 0FA0h ;# 
# 8936 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR2 equ 0FA1h ;# 
# 9022 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR2 equ 0FA2h ;# 
# 9108 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIE3 equ 0FA3h ;# 
# 9218 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PIR3 equ 0FA4h ;# 
# 9296 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
IPR3 equ 0FA5h ;# 
# 9374 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EECON1 equ 0FA6h ;# 
# 9440 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EECON2 equ 0FA7h ;# 
# 9460 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EEDATA equ 0FA8h ;# 
# 9480 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
EEADR equ 0FA9h ;# 
# 9550 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCSTA1 equ 0FABh ;# 
# 9555 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCSTA equ 0FABh ;# 
# 9559 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC1STA equ 0FABh ;# 
# 10006 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXSTA1 equ 0FACh ;# 
# 10011 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXSTA equ 0FACh ;# 
# 10015 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX1STA equ 0FACh ;# 
# 10381 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXREG1 equ 0FADh ;# 
# 10386 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TXREG equ 0FADh ;# 
# 10390 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TX1REG equ 0FADh ;# 
# 10459 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCREG1 equ 0FAEh ;# 
# 10464 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCREG equ 0FAEh ;# 
# 10468 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RC1REG equ 0FAEh ;# 
# 10537 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRG1 equ 0FAFh ;# 
# 10542 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRG equ 0FAFh ;# 
# 10546 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP1BRG equ 0FAFh ;# 
# 10615 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRGH1 equ 0FB0h ;# 
# 10620 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SPBRGH equ 0FB0h ;# 
# 10624 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SP1BRGH equ 0FB0h ;# 
# 10693 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T3CON equ 0FB1h ;# 
# 10801 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR3 equ 0FB2h ;# 
# 10808 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR3L equ 0FB2h ;# 
# 10828 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR3H equ 0FB3h ;# 
# 10848 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T3GCON equ 0FB4h ;# 
# 10943 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCP1AS equ 0FB6h ;# 
# 10948 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ECCPAS equ 0FB6h ;# 
# 11325 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWM1CON equ 0FB7h ;# 
# 11330 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PWMCON equ 0FB7h ;# 
# 11579 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCON1 equ 0FB8h ;# 
# 11584 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCON equ 0FB8h ;# 
# 11588 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUDCTL equ 0FB8h ;# 
# 11592 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BAUD1CON equ 0FB8h ;# 
# 12253 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTR1CON equ 0FB9h ;# 
# 12258 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PSTRCON equ 0FB9h ;# 
# 12403 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T2CON equ 0FBAh ;# 
# 12474 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PR2 equ 0FBBh ;# 
# 12494 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR2 equ 0FBCh ;# 
# 12514 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCP1CON equ 0FBDh ;# 
# 12596 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR1 equ 0FBEh ;# 
# 12603 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR1L equ 0FBEh ;# 
# 12623 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
CCPR1H equ 0FBFh ;# 
# 12643 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADCON2 equ 0FC0h ;# 
# 12714 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADCON1 equ 0FC1h ;# 
# 12782 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADCON0 equ 0FC2h ;# 
# 12907 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADRES equ 0FC3h ;# 
# 12914 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADRESL equ 0FC3h ;# 
# 12934 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
ADRESH equ 0FC4h ;# 
# 12954 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1CON2 equ 0FC5h ;# 
# 12959 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPCON2 equ 0FC5h ;# 
# 13308 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1CON1 equ 0FC6h ;# 
# 13313 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPCON1 equ 0FC6h ;# 
# 13546 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1STAT equ 0FC7h ;# 
# 13551 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPSTAT equ 0FC7h ;# 
# 14176 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1ADD equ 0FC8h ;# 
# 14181 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPADD equ 0FC8h ;# 
# 14430 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1BUF equ 0FC9h ;# 
# 14435 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPBUF equ 0FC9h ;# 
# 14484 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1MSK equ 0FCAh ;# 
# 14489 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPMSK equ 0FCAh ;# 
# 14622 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSP1CON3 equ 0FCBh ;# 
# 14627 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
SSPCON3 equ 0FCBh ;# 
# 14744 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T1GCON equ 0FCCh ;# 
# 14839 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T1CON equ 0FCDh ;# 
# 14952 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR1 equ 0FCEh ;# 
# 14959 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR1L equ 0FCEh ;# 
# 14979 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR1H equ 0FCFh ;# 
# 14999 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
RCON equ 0FD0h ;# 
# 15132 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
WDTCON equ 0FD1h ;# 
# 15160 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
OSCCON2 equ 0FD2h ;# 
# 15217 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
OSCCON equ 0FD3h ;# 
# 15300 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
T0CON equ 0FD5h ;# 
# 15370 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR0 equ 0FD6h ;# 
# 15377 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR0L equ 0FD6h ;# 
# 15397 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TMR0H equ 0FD7h ;# 
# 15417 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
STATUS equ 0FD8h ;# 
# 15488 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR2 equ 0FD9h ;# 
# 15495 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR2L equ 0FD9h ;# 
# 15515 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR2H equ 0FDAh ;# 
# 15522 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PLUSW2 equ 0FDBh ;# 
# 15542 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PREINC2 equ 0FDCh ;# 
# 15562 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTDEC2 equ 0FDDh ;# 
# 15582 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTINC2 equ 0FDEh ;# 
# 15602 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INDF2 equ 0FDFh ;# 
# 15622 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
BSR equ 0FE0h ;# 
# 15629 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR1 equ 0FE1h ;# 
# 15636 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR1L equ 0FE1h ;# 
# 15656 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR1H equ 0FE2h ;# 
# 15663 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PLUSW1 equ 0FE3h ;# 
# 15683 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PREINC1 equ 0FE4h ;# 
# 15703 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTDEC1 equ 0FE5h ;# 
# 15723 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTINC1 equ 0FE6h ;# 
# 15743 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INDF1 equ 0FE7h ;# 
# 15763 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
WREG equ 0FE8h ;# 
# 15801 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR0 equ 0FE9h ;# 
# 15808 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR0L equ 0FE9h ;# 
# 15828 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
FSR0H equ 0FEAh ;# 
# 15835 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PLUSW0 equ 0FEBh ;# 
# 15855 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PREINC0 equ 0FECh ;# 
# 15875 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTDEC0 equ 0FEDh ;# 
# 15895 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
POSTINC0 equ 0FEEh ;# 
# 15915 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INDF0 equ 0FEFh ;# 
# 15935 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INTCON3 equ 0FF0h ;# 
# 16027 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INTCON2 equ 0FF1h ;# 
# 16097 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
INTCON equ 0FF2h ;# 
# 16214 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PROD equ 0FF3h ;# 
# 16221 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PRODL equ 0FF3h ;# 
# 16241 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PRODH equ 0FF4h ;# 
# 16261 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TABLAT equ 0FF5h ;# 
# 16283 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTR equ 0FF6h ;# 
# 16290 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTRL equ 0FF6h ;# 
# 16310 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTRH equ 0FF7h ;# 
# 16330 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TBLPTRU equ 0FF8h ;# 
# 16361 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCLAT equ 0FF9h ;# 
# 16368 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PC equ 0FF9h ;# 
# 16375 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCL equ 0FF9h ;# 
# 16395 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCLATH equ 0FFAh ;# 
# 16415 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
PCLATU equ 0FFBh ;# 
# 16422 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
STKPTR equ 0FFCh ;# 
# 16528 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOS equ 0FFDh ;# 
# 16535 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOSL equ 0FFDh ;# 
# 16555 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOSH equ 0FFEh ;# 
# 16575 "C:\Program Files\Microchip\xc8\v2.46\pic\include\proc\pic18f25k22.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_I2C2_Init
	FNCALL	_main,_UART_Init
	FNCALL	_UART_Init,___fttol
	FNROOT	_main
	FNCALL	_isr,_UART_TransmitChar
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_timeout
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"main.c"
	line	19

;initializer for _timeout
	dw	(03E8h)&0ffffh
	global	_RCREG1
_RCREG1	set	0xFAE
	global	_TRISC7
_TRISC7	set	0x7CA7
	global	_TRISC6
_TRISC6	set	0x7CA6
	global	_ANSELCbits
_ANSELCbits	set	0xF3A
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_OSCTUNE
_OSCTUNE	set	0xF9B
	global	_PIE1bits
_PIE1bits	set	0xF9D
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_SSP1CON2bits
_SSP1CON2bits	set	0xFC5
	global	_SSP1CON1
_SSP1CON1	set	0xFC6
	global	_SSP1STAT
_SSP1STAT	set	0xFC7
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_SSP1BUF
_SSP1BUF	set	0xFC9
	global	_SSP1ADD
_SSP1ADD	set	0xFC8
	global	_TXREG
_TXREG	set	0xFAD
	global	_SPBRG1
_SPBRG1	set	0xFAF
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "INTIO67"
	config PLLCFG = "ON"
	config PRICLKEN = "ON"
	config FCMEN = "OFF"
	config IESO = "OFF"
	config PWRTEN = "OFF"
	config BOREN = "SBORDIS"
	config BORV = "250"
	config WDTEN = "OFF"
	config WDTPS = "32768"
	config CCP2MX = "PORTC1"
	config PBADEN = "ON"
	config CCP3MX = "PORTB5"
	config HFOFST = "ON"
	config T3CMX = "PORTC0"
	config P2BMX = "PORTB5"
	config MCLRE = "EXTMCLR"
	config STVREN = "ON"
	config LVP = "ON"
	config XINST = "OFF"
	config CP0 = "OFF"
	config CP1 = "OFF"
	config CP2 = "OFF"
	config CP3 = "OFF"
	config CPB = "OFF"
	config CPD = "OFF"
	config WRT0 = "OFF"
	config WRT1 = "OFF"
	config WRT2 = "OFF"
	config WRT3 = "OFF"
	config WRTC = "OFF"
	config WRTB = "OFF"
	config WRTD = "OFF"
	config EBTR0 = "OFF"
	config EBTR1 = "OFF"
	config EBTR2 = "OFF"
	config EBTR3 = "OFF"
	config EBTRB = "OFF"
	file	"i2c.as"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pbssCOMRAM
__pbssCOMRAM:
	global	_user_command
	global	_user_command
_user_command:
       ds      52
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"main.c"
	line	19
	global	_timeout
_timeout:
       ds      2
	file	"i2c.as"
	line	#
psect	cinit
; Initialize objects allocated to COMRAM (2 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataCOMRAM+0		
	tblrd*+ ;fetch initializer
	movff	tablat, __pdataCOMRAM+1		
	line	#
; Clear objects allocated to COMRAM (52 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	52
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_I2C2_Init:	; 1 bytes @ 0x0
?_UART_Init:	; 1 bytes @ 0x0
?_UART_TransmitChar:	; 1 bytes @ 0x0
??_UART_TransmitChar:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	UART_TransmitChar@data
UART_TransmitChar@data:	; 1 bytes @ 0x0
	ds   1
??_isr:	; 1 bytes @ 0x1
	global	isr@receive_data
isr@receive_data:	; 1 bytes @ 0x1
	ds   1
??_I2C2_Init:	; 1 bytes @ 0x2
	global	?___fttol
?___fttol:	; 4 bytes @ 0x2
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x2
	ds   4
??___fttol:	; 1 bytes @ 0x6
	ds   5
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0xB
	ds   1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0xC
	ds   4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x10
	ds   1
??_UART_Init:	; 1 bytes @ 0x11
	global	UART_Init@temp
UART_Init@temp:	; 3 bytes @ 0x11
	ds   3
??_main:	; 1 bytes @ 0x14
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        2
;!    BSS         52
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     20      74
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_UART_Init
;!    _UART_Init->___fttol
;!
;!Critical Paths under _isr in COMRAM
;!
;!    _isr->_UART_TransmitChar
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _isr in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _isr in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _isr in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _isr in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _isr in BANK5
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0     351
;!                          _I2C2_Init
;!                          _UART_Init
;! ---------------------------------------------------------------------------------
;! (1) _UART_Init                                            3     3      0     351
;!                                             17 COMRAM     3     3      0
;!                            ___fttol
;! ---------------------------------------------------------------------------------
;! (2) ___fttol                                             15    11      4     328
;!                                              2 COMRAM    15    11      4
;! ---------------------------------------------------------------------------------
;! (1) _I2C2_Init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (3) _isr                                                  1     1      0      30
;!                                              1 COMRAM     1     1      0
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (4) _UART_TransmitChar                                    1     1      0      15
;!                                              0 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _I2C2_Init
;!   _UART_Init
;!     ___fttol
;!
;! _isr (ROOT)
;!   _UART_TransmitChar
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             5FF      0       0      25        0.0%
;!EEDATA             100      0       0       0        0.0%
;!BITBANK5           100      0       0      13        0.0%
;!BANK5              100      0       0      14        0.0%
;!BITBANK4           100      0       0      11        0.0%
;!BANK4              100      0       0      12        0.0%
;!BITBANK3           100      0       0       9        0.0%
;!BANK3              100      0       0      10        0.0%
;!BITBANK2           100      0       0       7        0.0%
;!BANK2              100      0       0       8        0.0%
;!BITBANK1           100      0       0       5        0.0%
;!BANK1              100      0       0       6        0.0%
;!BITBANK0            A0      0       0       3        0.0%
;!BANK0               A0      0       0       4        0.0%
;!BITCOMRAM           5E      0       0       0        0.0%
;!COMRAM              5E     14      4A       1       78.7%
;!BITBIGSFRlh         59      0       0      22        0.0%
;!BITBIGSFRhhlh       1E      0       0      16        0.0%
;!BITBIGSFRhlhh       15      0       0      18        0.0%
;!BITBIGSFRhlhll       E      0       0      19        0.0%
;!BITBIGSFRhhh         D      0       0      15        0.0%
;!BITBIGSFRhhll        9      0       0      17        0.0%
;!BITBIGSFRhlll        6      0       0      21        0.0%
;!BITBIGSFRll          2      0       0      23        0.0%
;!BITBIGSFRhllh        1      0       0      20        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR_1             0      0       0     200        0.0%
;!SFR_1                0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0      4A      24        0.0%
;!DATA                 0      0      4A      26        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 124 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_I2C2_Init
;;		_UART_Init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	124
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	124
	
_main:
;incstack = 0
	callstack 27
	line	126
	
l1009:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	127
	movlw	low(0C0h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	129
	
l1011:
	call	_UART_Init	;wreg free
	line	130
	
l1013:
	call	_I2C2_Init	;wreg free
	line	132
	
l114:
	line	133
	
l115:
	line	132
	goto	l114
	global	start
	goto	start
	callstack 0
	line	134
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_UART_Init

;; *************** function _UART_Init *****************
;; Defined at:
;;		line 34 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            3   17[COMRAM] float 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	34
global __ptext1
__ptext1:
psect	text1
	file	"main.c"
	line	34
	
_UART_Init:
;incstack = 0
	callstack 27
	line	37
	
l997:
	bcf	c:(31910/8),(31910)&7	;volatile
	line	38
	bsf	c:(31911/8),(31911)&7	;volatile
	line	39
	movlb	15	; () banked
	bcf	((3898))&0ffh,7	;volatile
	line	42
	
l999:; BSR set to: 15

	movlw	low(float24(103.16666666666667))
	movwf	((c:UART_Init@temp))^00h,c
	movlw	high(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+1))^00h,c
	movlw	low highword(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+2))^00h,c

	line	43
	
l1001:; BSR set to: 15

	movff	(c:UART_Init@temp),(c:___fttol@f1)
	movff	(c:UART_Init@temp+1),(c:___fttol@f1+1)
	movff	(c:UART_Init@temp+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movf	(0+?___fttol)^00h,c,w
	movwf	((c:4015))^0f00h,c	;volatile
	line	45
	
l1003:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	46
	
l1005:
	bsf	((c:4082))^0f00h,c,6	;volatile
	line	47
	
l1007:
	bsf	((c:3997))^0f00h,c,5	;volatile
	line	50
# 50 "main.c"
movlw 0x20 ; Load value for TXSTA1 register ;# 
	line	51
# 51 "main.c"
movwf TXSTA1 ; Enable Transmit(TX) ;# 
	line	53
# 53 "main.c"
movlw 0x90 ; Load value for RCSTA1 register ;# 
	line	54
# 54 "main.c"
movwf RCSTA1 ; Enable Receive(RX) & Serial ;# 
psect	text1
	line	61
	
l92:
	return	;funcret
	callstack 0
GLOBAL	__end_of_UART_Init
	__end_of_UART_Init:
	signat	_UART_Init,89
	global	___fttol

;; *************** function ___fttol *****************
;; Defined at:
;;		line 44 in file "C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    2[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   12[COMRAM] unsigned long 
;;  exp1            1   16[COMRAM] unsigned char 
;;  sign1           1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    2[COMRAM] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/F
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         4       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0
;;      Totals:        15       0       0       0       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UART_Init
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
global __ptext2
__ptext2:
psect	text2
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
	
___fttol:
;incstack = 0
	callstack 27
	line	49
	
l951:; BSR set to: 15

	movff	(c:___fttol@f1+2),??___fttol+0+0
	clrf	(??___fttol+0+0+1)^00h,c
	clrf	(??___fttol+0+0+2)^00h,c
	rlcf	((c:___fttol@f1+1))^00h,c,w
	rlcf	(??___fttol+0+0)^00h,c
	bnc	u131
	bsf	(??___fttol+0+0+1)^00h,c,0
u131:
	movf	(??___fttol+0+0)^00h,c,w
	movwf	((c:___fttol@exp1))^00h,c
	movf	((c:___fttol@exp1))^00h,c,w
	btfss	status,2
	goto	u141
	goto	u140
u141:
	goto	l957
u140:
	line	50
	
l953:
	movlw	low(0)
	movwf	((c:?___fttol))^00h,c
	movlw	high(0)
	movwf	((c:?___fttol+1))^00h,c
	movlw	low highword(0)
	movwf	((c:?___fttol+2))^00h,c
	movlw	high highword(0)
	movwf	((c:?___fttol+3))^00h,c
	goto	l494
	line	51
	
l957:; BSR set to: 15

	movlw	(017h)&0ffh
	movwf	(??___fttol+0+0)^00h,c
	movff	(c:___fttol@f1),??___fttol+1+0
	movff	(c:___fttol@f1+1),??___fttol+1+0+1
	movff	(c:___fttol@f1+2),??___fttol+1+0+2
	incf	((??___fttol+0+0))^00h,c,w
	movwf	(??___fttol+4+0)^00h,c
	goto	u150
u155:
	bcf	status,0
	rrcf	(??___fttol+1+2)^00h,c
	rrcf	(??___fttol+1+1)^00h,c
	rrcf	(??___fttol+1+0)^00h,c
u150:
	decfsz	(??___fttol+4+0)^00h,c
	goto	u155
	movf	(??___fttol+1+0)^00h,c,w
	movwf	((c:___fttol@sign1))^00h,c
	line	52
	
l959:
	bsf	(0+(15/8)+(c:___fttol@f1))^00h,c,(15)&7
	line	53
	
l961:
	movlw	low(0FFFFh)
	andwf	((c:___fttol@f1))^00h,c
	movlw	high(0FFFFh)
	andwf	((c:___fttol@f1+1))^00h,c
	movlw	low highword(0FFFFh)
	andwf	((c:___fttol@f1+2))^00h,c

	line	54
	
l963:
	movf	((c:___fttol@f1))^00h,c,w
	movwf	((c:___fttol@lval))^00h,c
	movf	((c:___fttol@f1+1))^00h,c,w
	movwf	1+((c:___fttol@lval))^00h,c
	
	movf	((c:___fttol@f1+2))^00h,c,w
	movwf	2+((c:___fttol@lval))^00h,c
	
	clrf	3+((c:___fttol@lval))^00h,c
	
	line	55
	
l965:
	movlw	(08Eh)&0ffh
	subwf	((c:___fttol@exp1))^00h,c
	line	56
	
l967:
	btfsc	((c:___fttol@exp1))^00h,c,7
	goto	u160
	goto	u161

u161:
	goto	l979
u160:
	line	57
	
l969:
		movf	((c:___fttol@exp1))^00h,c,w
	xorlw	80h
	addlw	-(80h^-15)
	btfsc	status,0
	goto	u171
	goto	u170

u171:
	goto	l975
u170:
	goto	l953
	line	60
	
l975:
	bcf	status,0
	rrcf	((c:___fttol@lval+3))^00h,c
	rrcf	((c:___fttol@lval+2))^00h,c
	rrcf	((c:___fttol@lval+1))^00h,c
	rrcf	((c:___fttol@lval))^00h,c
	line	61
	
l977:
	incfsz	((c:___fttol@exp1))^00h,c
	
	goto	l975
	goto	l989
	line	63
	
l979:
		movlw	018h-1
	cpfsgt	((c:___fttol@exp1))^00h,c
	goto	u181
	goto	u180

u181:
	goto	l987
u180:
	goto	l953
	line	66
	
l985:
	bcf	status,0
	rlcf	((c:___fttol@lval))^00h,c
	rlcf	((c:___fttol@lval+1))^00h,c
	rlcf	((c:___fttol@lval+2))^00h,c
	rlcf	((c:___fttol@lval+3))^00h,c
	line	67
	decf	((c:___fttol@exp1))^00h,c
	line	65
	
l987:
	movf	((c:___fttol@exp1))^00h,c,w
	btfss	status,2
	goto	u191
	goto	u190
u191:
	goto	l985
u190:
	line	70
	
l989:
	movf	((c:___fttol@sign1))^00h,c,w
	btfsc	status,2
	goto	u201
	goto	u200
u201:
	goto	l993
u200:
	line	71
	
l991:
	comf	((c:___fttol@lval+3))^00h,c
	comf	((c:___fttol@lval+2))^00h,c
	comf	((c:___fttol@lval+1))^00h,c
	negf	((c:___fttol@lval))^00h,c
	movlw	0
	addwfc	((c:___fttol@lval+1))^00h,c
	addwfc	((c:___fttol@lval+2))^00h,c
	addwfc	((c:___fttol@lval+3))^00h,c
	line	72
	
l993:
	movff	(c:___fttol@lval),(c:?___fttol)
	movff	(c:___fttol@lval+1),(c:?___fttol+1)
	movff	(c:___fttol@lval+2),(c:?___fttol+2)
	movff	(c:___fttol@lval+3),(c:?___fttol+3)
	line	73
	
l494:
	return	;funcret
	callstack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
	signat	___fttol,4220
	global	_I2C2_Init

;; *************** function _I2C2_Init *****************
;; Defined at:
;;		line 20 in file "i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/F
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	20
global __ptext3
__ptext3:
psect	text3
	file	"i2c.c"
	line	20
	
_I2C2_Init:
;incstack = 0
	callstack 28
	line	21
	
l911:
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	22
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	25
	movlb	15	; () banked
	bcf	((3898))&0ffh,3	;volatile
	line	26
	bcf	((3898))&0ffh,4	;volatile
	line	28
	
l913:; BSR set to: 15

	movlw	low(080h)
	movwf	((c:4039))^0f00h,c	;volatile
	line	37
	movlw	low(028h)
	movwf	((c:4038))^0f00h,c	;volatile
	line	38
	movlw	low(09Fh)
	movwf	((c:4040))^0f00h,c	;volatile
	line	39
	
l19:; BSR set to: 15

	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Init
	__end_of_I2C2_Init:
	signat	_I2C2_Init,89
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 81 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  receive_data    1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_UART_TransmitChar
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
	file	"i2c.as"
	line	#
global __pintcode
__pintcode:
psect	intcode
	file	"main.c"
	line	81
	
_isr:; BSR set to: 15

;incstack = 0
	callstack 27
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	line	83
	
i2l931:
	movlw	low(0)
	movwf	((c:isr@receive_data))^00h,c
	line	86
	
i2l933:
	btfss	((c:3998))^0f00h,c,5	;volatile
	goto	i2u10_41
	goto	i2u10_40
i2u10_41:
	goto	i2l939
i2u10_40:
	line	88
	
i2l935:
	movff	(c:4014),(c:isr@receive_data)	;volatile
	line	90
	bcf	((c:3998))^0f00h,c,5	;volatile
	goto	i2l939
	line	95
	
i2l937:
	decf	((c:_timeout))^00h,c
	btfss	status,0
	decf	((c:_timeout+1))^00h,c
	line	94
	
i2l939:
	btfsc	((c:3998))^0f00h,c,5	;volatile
	goto	i2u11_41
	goto	i2u11_40
i2u11_41:
	goto	i2l943
i2u11_40:
	
i2l941:
	movf	((c:_timeout))^00h,c,w
iorwf	((c:_timeout+1))^00h,c,w
	btfss	status,2
	goto	i2u12_41
	goto	i2u12_40

i2u12_41:
	goto	i2l937
i2u12_40:
	line	100
	
i2l943:
	movf	((c:isr@receive_data))^00h,c,w
	
	call	_UART_TransmitChar
	line	101
	
i2l109:
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	callstack 0
GLOBAL	__end_of_isr
	__end_of_isr:
	signat	_isr,89
	global	_UART_TransmitChar

;; *************** function _UART_TransmitChar *****************
;; Defined at:
;;		line 69 in file "main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	69
global __ptext5
__ptext5:
psect	text5
	file	"main.c"
	line	69
	
_UART_TransmitChar:
;incstack = 0
	callstack 27
	movwf	((c:UART_TransmitChar@data))^00h,c
	line	71
	
i2l927:
	
i2l95:
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	i2u9_41
	goto	i2u9_40
i2u9_41:
	goto	i2l95
i2u9_40:
	line	72
	
i2l929:
	movff	(c:UART_TransmitChar@data),(c:4013)	;volatile
	line	73
	
i2l98:
	return	;funcret
	callstack 0
GLOBAL	__end_of_UART_TransmitChar
	__end_of_UART_TransmitChar:
	signat	_UART_TransmitChar,4217
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	db 0	; dummy byte at the end
	global	__smallconst
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
       psect   temp,common,ovrld,class=COMRAM,space=1,lowdata
	global	btemp
btemp:
	ds	1
	global	int$flags
	int$flags	set btemp
	global	wtemp8
	wtemp8 set btemp+1
	global	ttemp5
	ttemp5 set btemp+1
	global	ttemp6
	ttemp6 set btemp+4
	global	ttemp7
	ttemp7 set btemp+8
	end
