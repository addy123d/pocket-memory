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
	FNCALL	_main,_ReadMasterPasswordFromEEPROM
	FNCALL	_main,_UART_Init
	FNCALL	_main,_createResponse
	FNCALL	_createResponse,_ReadCredentials
	FNCALL	_createResponse,_UART_TransmitChar
	FNCALL	_createResponse,_createPingResponse
	FNCALL	_createResponse,_isPasswordMatched
	FNCALL	_createResponse,_sendResponse
	FNCALL	_createResponse,_writeDataToEEPROM
	FNCALL	_createResponse,_writeMasterPasswordToEEPROM
	FNCALL	_writeMasterPasswordToEEPROM,_EEPROM_Read
	FNCALL	_writeMasterPasswordToEEPROM,_EEPROM_Write
	FNCALL	_writeMasterPasswordToEEPROM,_UART_TransmitChar
	FNCALL	_writeDataToEEPROM,_EEPROM_Read
	FNCALL	_writeDataToEEPROM,_EEPROM_Write
	FNCALL	_writeDataToEEPROM,_writeByteAT24_EEPROM
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Send
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Start
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Stop
	FNCALL	_sendResponse,_UART_TransmitChar
	FNCALL	_ReadCredentials,_UART_TransmitChar
	FNCALL	_ReadCredentials,_readByteAT24_EEPROM
	FNCALL	_readByteAT24_EEPROM,_I2C2_Read
	FNCALL	_readByteAT24_EEPROM,_I2C2_Send
	FNCALL	_readByteAT24_EEPROM,_I2C2_Start
	FNCALL	_readByteAT24_EEPROM,_I2C2_Stop
	FNCALL	_UART_Init,___fttol
	FNCALL	_ReadMasterPasswordFromEEPROM,_EEPROM_Read
	FNROOT	_main
	FNCALL	_isr,_processRequest
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_isPasswordSet
	global	_checkAck
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"main.c"
	line	99

;initializer for _digits
	db	low(0)
	db	low(01h)
	db	low(02h)
	db	low(03h)
	db	low(04h)
	db	low(05h)
	db	low(06h)
	db	low(07h)
	db	low(08h)
	db	low(09h)
	line	27

;initializer for _timeout
	dw	(03E8h)&0ffffh
	line	35

;initializer for _isPasswordSet
	db	low(01h)
	line	34

;initializer for _checkAck
	db	low(01h)
	global	_responseBuffer
	global	_master
	global	_at24_eeprom_address
	global	_exception_code
	global	_isExceptionRaised
	global	_end_sequence_flag
	global	_start_sequence_flag
	global	_interrupt_flag
	global	_receiveData
	global	_request_unit
	global	_requestBuffer
	global	_EECON2
_EECON2	set	0xFA7
	global	_RCREG
_RCREG	set	0xFAE
	global	_TXREG
_TXREG	set	0xFAD
	global	_SPBRG1
_SPBRG1	set	0xFAF
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_TRISC7
_TRISC7	set	0x7CA7
	global	_ANSELCbits
_ANSELCbits	set	0xF3A
	global	_TRISC6
_TRISC6	set	0x7CA6
	global	_OSCTUNE
_OSCTUNE	set	0xF9B
	global	_PIE1bits
_PIE1bits	set	0xF9D
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_PIR2bits
_PIR2bits	set	0xFA1
	global	_EECON1bits
_EECON1bits	set	0xFA6
	global	_EEDATA
_EEDATA	set	0xFA8
	global	_EEADR
_EEADR	set	0xFA9
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_RCSTA1
_RCSTA1	set	0xFAB
	global	_TXSTA1
_TXSTA1	set	0xFAC
	global	_SSP1CON2bits
_SSP1CON2bits	set	0xFC5
	global	_SSP1CON1
_SSP1CON1	set	0xFC6
	global	_SSP1STAT
_SSP1STAT	set	0xFC7
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_SSP1BUF
_SSP1BUF	set	0xFC9
	global	_SSP1ADD
_SSP1ADD	set	0xFC8
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
	file	"output.as"
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
	global	_responseBuffer
_responseBuffer:
       ds      30
	global	_master
_master:
       ds      9
	global	_at24_eeprom_address
_at24_eeprom_address:
       ds      2
	global	_exception_code
_exception_code:
       ds      1
	global	_isExceptionRaised
_isExceptionRaised:
       ds      1
	global	_end_sequence_flag
_end_sequence_flag:
       ds      1
	global	_start_sequence_flag
_start_sequence_flag:
       ds      1
	global	_interrupt_flag
_interrupt_flag:
       ds      1
psect	dataCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pdataCOMRAM
__pdataCOMRAM:
	file	"main.c"
	line	99
	global	_digits
	global	_digits
_digits:
       ds      10
psect	dataCOMRAM
	file	"main.c"
	line	27
	global	_timeout
	global	_timeout
_timeout:
       ds      2
psect	dataCOMRAM
	file	"main.c"
	line	35
	global	_isPasswordSet
_isPasswordSet:
       ds      1
psect	dataCOMRAM
	file	"main.c"
	line	34
	global	_checkAck
_checkAck:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_receiveData
_receiveData:
       ds      52
	global	_request_unit
_request_unit:
       ds      52
	global	_requestBuffer
_requestBuffer:
       ds      50
	file	"output.as"
	line	#
psect	cinit
; Initialize objects allocated to COMRAM (14 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,14
	copy_data0:
	tblrd	*+
	movff	tablat, postinc0
	movf	postdec1,w
	movf	fsr1l,w
	bnz	copy_data0
	line	#
; Clear objects allocated to BANK0 (154 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	154
clear_0:
clrf	postinc0,c
decf	wreg
bnz	clear_0
; Clear objects allocated to COMRAM (46 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	46
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
	bcf int$flags,0,c ;clear compiler interrupt flag (level 1)
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	GLOBAL	__Lmediumconst
	movlw	low highword(__Lmediumconst)
	movwf	tblptru
movlb 0
goto _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1,noexec,lowdata
global __pcstackBANK1
__pcstackBANK1:
	global	writeDataToEEPROM@at24_eep_addr_H
writeDataToEEPROM@at24_eep_addr_H:	; 1 bytes @ 0x0
	global	ReadCredentials@payload_length
ReadCredentials@payload_length:	; 1 bytes @ 0x0
	ds   1
	global	writeDataToEEPROM@at24_eep_addr_L
writeDataToEEPROM@at24_eep_addr_L:	; 1 bytes @ 0x1
	global	ReadCredentials@last_char_index
ReadCredentials@last_char_index:	; 1 bytes @ 0x1
	ds   1
	global	ReadCredentials@response_index
ReadCredentials@response_index:	; 1 bytes @ 0x2
	global	writeDataToEEPROM@payload_length
writeDataToEEPROM@payload_length:	; 2 bytes @ 0x2
	ds   1
	global	ReadCredentials@START_ADDR
ReadCredentials@START_ADDR:	; 2 bytes @ 0x3
	ds   1
	global	writeDataToEEPROM@at24_eeprom_addr_start
writeDataToEEPROM@at24_eeprom_addr_start:	; 2 bytes @ 0x4
	ds   1
	global	ReadCredentials@ADDR
ReadCredentials@ADDR:	; 2 bytes @ 0x5
	ds   1
	global	writeDataToEEPROM@i
writeDataToEEPROM@i:	; 2 bytes @ 0x6
	ds   1
	global	ReadCredentials@index
ReadCredentials@index:	; 1 bytes @ 0x7
	ds   1
	global	ReadCredentials@i
ReadCredentials@i:	; 2 bytes @ 0x8
	ds   2
	global	ReadCredentials@credential_length
ReadCredentials@credential_length:	; 2 bytes @ 0xA
	ds   2
psect	cstackBANK0,class=BANK0,space=1,noexec,lowdata
global __pcstackBANK0
__pcstackBANK0:
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x0
	ds   1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x1
	ds   4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x5
	ds   1
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_processRequest:	; 1 bytes @ 0x0
??_processRequest:	; 1 bytes @ 0x0
?_createPingResponse:	; 1 bytes @ 0x0
?_writeDataToEEPROM:	; 1 bytes @ 0x0
?_ReadCredentials:	; 1 bytes @ 0x0
?_writeMasterPasswordToEEPROM:	; 1 bytes @ 0x0
?_isPasswordMatched:	; 1 bytes @ 0x0
?_sendResponse:	; 1 bytes @ 0x0
?_EEPROM_Read:	; 1 bytes @ 0x0
?_I2C2_Start:	; 1 bytes @ 0x0
?_I2C2_Send:	; 1 bytes @ 0x0
?_I2C2_Stop:	; 1 bytes @ 0x0
?_I2C2_Read:	; 1 bytes @ 0x0
?_I2C2_Init:	; 1 bytes @ 0x0
?_UART_Init:	; 1 bytes @ 0x0
?_UART_TransmitChar:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_createResponse:	; 1 bytes @ 0x0
?_ReadMasterPasswordFromEEPROM:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	processRequest@i
processRequest@i:	; 2 bytes @ 0x0
	ds   2
	global	processRequest@length_index
processRequest@length_index:	; 2 bytes @ 0x2
	ds   2
	global	processRequest@buffer_index
processRequest@buffer_index:	; 2 bytes @ 0x4
	ds   2
??_isr:	; 1 bytes @ 0x6
	ds   4
	global	isr@receivedChar
isr@receivedChar:	; 1 bytes @ 0xA
	ds   1
??_createPingResponse:	; 1 bytes @ 0xB
??_isPasswordMatched:	; 1 bytes @ 0xB
??_EEPROM_Read:	; 1 bytes @ 0xB
?_EEPROM_Write:	; 1 bytes @ 0xB
??_I2C2_Start:	; 1 bytes @ 0xB
??_I2C2_Send:	; 1 bytes @ 0xB
??_I2C2_Stop:	; 1 bytes @ 0xB
??_I2C2_Read:	; 1 bytes @ 0xB
??_I2C2_Init:	; 1 bytes @ 0xB
??_UART_TransmitChar:	; 1 bytes @ 0xB
	global	?___fttol
?___fttol:	; 4 bytes @ 0xB
	global	UART_TransmitChar@data
UART_TransmitChar@data:	; 1 bytes @ 0xB
	global	EEPROM_Write@eep_data
EEPROM_Write@eep_data:	; 1 bytes @ 0xB
	global	EEPROM_Read@addr
EEPROM_Read@addr:	; 1 bytes @ 0xB
	global	I2C2_Send@BYTE
I2C2_Send@BYTE:	; 1 bytes @ 0xB
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0xB
	ds   1
??_sendResponse:	; 1 bytes @ 0xC
?_writeByteAT24_EEPROM:	; 1 bytes @ 0xC
??_EEPROM_Write:	; 1 bytes @ 0xC
?_readByteAT24_EEPROM:	; 1 bytes @ 0xC
??_ReadMasterPasswordFromEEPROM:	; 1 bytes @ 0xC
	global	writeByteAT24_EEPROM@address
writeByteAT24_EEPROM@address:	; 2 bytes @ 0xC
	global	readByteAT24_EEPROM@address
readByteAT24_EEPROM@address:	; 2 bytes @ 0xC
	ds   1
	global	sendResponse@isExceptionOccurred
sendResponse@isExceptionOccurred:	; 1 bytes @ 0xD
	global	isPasswordMatched@payload_length
isPasswordMatched@payload_length:	; 1 bytes @ 0xD
	ds   1
??_readByteAT24_EEPROM:	; 1 bytes @ 0xE
	global	writeByteAT24_EEPROM@data
writeByteAT24_EEPROM@data:	; 1 bytes @ 0xE
	global	readByteAT24_EEPROM@eeprom_data
readByteAT24_EEPROM@eeprom_data:	; 1 bytes @ 0xE
	global	EEPROM_Write@addr
EEPROM_Write@addr:	; 1 bytes @ 0xE
	global	ReadMasterPasswordFromEEPROM@password_addr
ReadMasterPasswordFromEEPROM@password_addr:	; 1 bytes @ 0xE
	global	isPasswordMatched@matchFlag
isPasswordMatched@matchFlag:	; 1 bytes @ 0xE
	global	sendResponse@index
sendResponse@index:	; 2 bytes @ 0xE
	ds   1
??_writeDataToEEPROM:	; 1 bytes @ 0xF
??_ReadCredentials:	; 1 bytes @ 0xF
??_writeMasterPasswordToEEPROM:	; 1 bytes @ 0xF
??_writeByteAT24_EEPROM:	; 1 bytes @ 0xF
??___fttol:	; 1 bytes @ 0xF
	global	ReadMasterPasswordFromEEPROM@password_length
ReadMasterPasswordFromEEPROM@password_length:	; 1 bytes @ 0xF
	global	isPasswordMatched@index
isPasswordMatched@index:	; 1 bytes @ 0xF
	ds   1
	global	ReadMasterPasswordFromEEPROM@index
ReadMasterPasswordFromEEPROM@index:	; 1 bytes @ 0x10
	ds   1
	global	writeMasterPasswordToEEPROM@last_byte_addr
writeMasterPasswordToEEPROM@last_byte_addr:	; 1 bytes @ 0x11
	ds   1
	global	writeMasterPasswordToEEPROM@last_byte_data
writeMasterPasswordToEEPROM@last_byte_data:	; 1 bytes @ 0x12
	ds   1
	global	writeMasterPasswordToEEPROM@payload_length
writeMasterPasswordToEEPROM@payload_length:	; 1 bytes @ 0x13
	ds   1
??_UART_Init:	; 1 bytes @ 0x14
	global	writeMasterPasswordToEEPROM@pic_eeprom_addr
writeMasterPasswordToEEPROM@pic_eeprom_addr:	; 1 bytes @ 0x14
	global	UART_Init@temp
UART_Init@temp:	; 3 bytes @ 0x14
	ds   1
	global	writeMasterPasswordToEEPROM@index
writeMasterPasswordToEEPROM@index:	; 1 bytes @ 0x15
	ds   1
??_createResponse:	; 1 bytes @ 0x16
	global	createResponse@CODE
createResponse@CODE:	; 1 bytes @ 0x16
	ds   1
??_main:	; 1 bytes @ 0x17
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        14
;!    BSS         200
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     23      83
;!    BANK0           160      6     160
;!    BANK1           256     12      12
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
;!    _main->_createResponse
;!    _createResponse->_writeMasterPasswordToEEPROM
;!    _writeMasterPasswordToEEPROM->_EEPROM_Write
;!    _writeDataToEEPROM->_EEPROM_Write
;!    _writeDataToEEPROM->_writeByteAT24_EEPROM
;!    _writeByteAT24_EEPROM->_I2C2_Send
;!    _sendResponse->_UART_TransmitChar
;!    _ReadCredentials->_readByteAT24_EEPROM
;!    _readByteAT24_EEPROM->_I2C2_Send
;!    _UART_Init->___fttol
;!    _ReadMasterPasswordFromEEPROM->_EEPROM_Read
;!
;!Critical Paths under _isr in COMRAM
;!
;!    _isr->_processRequest
;!
;!Critical Paths under _main in BANK0
;!
;!    _UART_Init->___fttol
;!
;!Critical Paths under _isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    _createResponse->_ReadCredentials
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
;! (0) _main                                                 0     0      0    4532
;!                          _I2C2_Init
;!       _ReadMasterPasswordFromEEPROM
;!                          _UART_Init
;!                     _createResponse
;! ---------------------------------------------------------------------------------
;! (1) _createResponse                                       1     1      0    3740
;!                                             22 COMRAM     1     1      0
;!                    _ReadCredentials
;!                  _UART_TransmitChar
;!                 _createPingResponse
;!                  _isPasswordMatched
;!                       _sendResponse
;!                  _writeDataToEEPROM
;!        _writeMasterPasswordToEEPROM
;! ---------------------------------------------------------------------------------
;! (2) _writeMasterPasswordToEEPROM                          7     7      0     889
;!                                             15 COMRAM     7     7      0
;!                        _EEPROM_Read
;!                       _EEPROM_Write
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (2) _writeDataToEEPROM                                   11    11      0    1252
;!                                             15 COMRAM     2     2      0
;!                                              0 BANK1      8     8      0
;!                        _EEPROM_Read
;!                       _EEPROM_Write
;!               _writeByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (3) _writeByteAT24_EEPROM                                 3     0      3     487
;!                                             12 COMRAM     3     0      3
;!                          _I2C2_Send
;!                         _I2C2_Start
;!                          _I2C2_Stop
;! ---------------------------------------------------------------------------------
;! (3) _EEPROM_Write                                         4     3      1     422
;!                                             11 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _sendResponse                                         4     4      0     300
;!                                             12 COMRAM     4     4      0
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (2) _isPasswordMatched                                    5     5      0     117
;!                                             11 COMRAM     5     5      0
;! ---------------------------------------------------------------------------------
;! (2) _createPingResponse                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _ReadCredentials                                     14    14      0    1086
;!                                             15 COMRAM     2     2      0
;!                                              0 BANK1     12    12      0
;!                  _UART_TransmitChar
;!                _readByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (3) _readByteAT24_EEPROM                                  3     1      2     313
;!                                             12 COMRAM     3     1      2
;!                          _I2C2_Read
;!                          _I2C2_Send
;!                         _I2C2_Start
;!                          _I2C2_Stop
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Stop                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Start                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Send                                            1     1      0      31
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Read                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _UART_TransmitChar                                    1     1      0      31
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _UART_Init                                            3     3      0     495
;!                                             20 COMRAM     3     3      0
;!                            ___fttol
;! ---------------------------------------------------------------------------------
;! (2) ___fttol                                             15    11      4     461
;!                                             11 COMRAM     9     5      4
;!                                              0 BANK0      6     6      0
;! ---------------------------------------------------------------------------------
;! (1) _ReadMasterPasswordFromEEPROM                         5     5      0     297
;!                                             12 COMRAM     5     5      0
;!                        _EEPROM_Read
;! ---------------------------------------------------------------------------------
;! (3) _EEPROM_Read                                          1     1      0      31
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _I2C2_Init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _isr                                                  5     5      0     227
;!                                              6 COMRAM     5     5      0
;!                     _processRequest
;! ---------------------------------------------------------------------------------
;! (6) _processRequest                                       6     6      0     116
;!                                              0 COMRAM     6     6      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _I2C2_Init
;!   _ReadMasterPasswordFromEEPROM
;!     _EEPROM_Read
;!   _UART_Init
;!     ___fttol
;!   _createResponse
;!     _ReadCredentials
;!       _UART_TransmitChar
;!       _readByteAT24_EEPROM
;!         _I2C2_Read
;!         _I2C2_Send
;!         _I2C2_Start
;!         _I2C2_Stop
;!     _UART_TransmitChar
;!     _createPingResponse
;!     _isPasswordMatched
;!     _sendResponse
;!       _UART_TransmitChar
;!     _writeDataToEEPROM
;!       _EEPROM_Read
;!       _EEPROM_Write
;!       _writeByteAT24_EEPROM
;!         _I2C2_Send
;!         _I2C2_Start
;!         _I2C2_Stop
;!     _writeMasterPasswordToEEPROM
;!       _EEPROM_Read
;!       _EEPROM_Write
;!       _UART_TransmitChar
;!
;! _isr (ROOT)
;!   _processRequest
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             5FF      0       0      27        0.0%
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
;!BANK1              100      C       C       6        4.7%
;!BITBANK0            A0      0       0       3        0.0%
;!BANK0               A0      6      A0       4      100.0%
;!BITCOMRAM           5E      0       0       0        0.0%
;!COMRAM              5E     17      53       1       88.3%
;!BITBIGSFRlh         59      0       0      24        0.0%
;!BITBIGSFRhlhhhh     1E      0       0      16        0.0%
;!BITBIGSFRhlhhhl     15      0       0      18        0.0%
;!BITBIGSFRhh          D      0       0      15        0.0%
;!BITBIGSFRhlhhhl      9      0       0      17        0.0%
;!BITBIGSFRhlll        6      0       0      23        0.0%
;!BITBIGSFRhlhlll      4      0       0      20        0.0%
;!BITBIGSFRhlhlll      2      0       0      21        0.0%
;!BITBIGSFRll          2      0       0      25        0.0%
;!BITBIGSFRhllh        1      0       0      22        0.0%
;!BITBIGSFRhlhlh       1      0       0      19        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR_1             0      0       0     200        0.0%
;!SFR_1                0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0      FF      26        0.0%
;!DATA                 0      0      FF      28        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 829 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, cstack
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
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_I2C2_Init
;;		_ReadMasterPasswordFromEEPROM
;;		_UART_Init
;;		_createResponse
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	829
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	829
	
_main:
;incstack = 0
	callstack 25
	line	832
	
l2508:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	833
	movlw	low(0C0h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	848
	
l2510:
	call	_UART_Init	;wreg free
	line	849
	
l2512:; BSR set to: 0

	call	_I2C2_Init	;wreg free
	line	850
	
l2514:; BSR set to: 15

	call	_ReadMasterPasswordFromEEPROM	;wreg free
	line	854
	
l2516:
	movf	((c:_interrupt_flag))^00h,c,w
	btfsc	status,2
	goto	u1361
	goto	u1360
u1361:
	goto	l2516
u1360:
	line	856
	
l2518:
	call	_createResponse	;wreg free
	line	857
	
l2520:
	movlw	low(0)
	movwf	((c:_interrupt_flag))^00h,c
	goto	l2516
	global	start
	goto	start
	callstack 0
	line	860
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_createResponse

;; *************** function _createResponse *****************
;; Defined at:
;;		line 336 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  CODE            1   22[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/F
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_ReadCredentials
;;		_UART_TransmitChar
;;		_createPingResponse
;;		_isPasswordMatched
;;		_sendResponse
;;		_writeDataToEEPROM
;;		_writeMasterPasswordToEEPROM
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	336
global __ptext1
__ptext1:
psect	text1
	file	"main.c"
	line	336
	
_createResponse:
;incstack = 0
	callstack 25
	line	338
	
l2446:
	movff	0+(_request_unit+01h),(c:createResponse@CODE)
	line	342
	
l2448:
	movf	((c:_isPasswordSet))^00h,c,w
	btfss	status,2
	goto	u1291
	goto	u1290
u1291:
	goto	l2452
u1290:
	line	344
	
l2450:
	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	345
	movlw	low(03h)
	movwf	((c:_exception_code))^00h,c
	line	349
	
l2452:
		movlw	33
	movlb	0	; () banked
	xorwf	((_request_unit))&0ffh,w
	btfss	status,2
	goto	u1301
	goto	u1300

u1301:
	goto	l153
u1300:
	line	351
	
l2454:; BSR set to: 0

	movf	((c:_isExceptionRaised))^00h,c,w
	btfsc	status,2
	goto	u1311
	goto	u1310
u1311:
	goto	l2474
u1310:
	
l2456:; BSR set to: 0

		movlw	241
	xorwf	((c:createResponse@CODE))^00h,c,w
	btfss	status,2
	goto	u1321
	goto	u1320

u1321:
	goto	l2476
u1320:
	goto	l2474
	line	357
	
l2458:; BSR set to: 0

	call	_createPingResponse	;wreg free
	line	358
	goto	l2476
	line	360
	
l2460:; BSR set to: 0

	call	_writeDataToEEPROM	;wreg free
	line	361
	goto	l2476
	line	363
	
l2462:; BSR set to: 0

	movlw	(0Fh)&0ffh
	
	call	_UART_TransmitChar
	line	364
	
l2464:
	call	_ReadCredentials	;wreg free
	line	365
	goto	l2476
	line	371
	
l2466:; BSR set to: 0

	call	_writeMasterPasswordToEEPROM	;wreg free
	line	372
	goto	l2476
	line	374
	
l2468:; BSR set to: 0

	call	_isPasswordMatched	;wreg free
	iorlw	0
	btfss	status,2
	goto	u1331
	goto	u1330
u1331:
	goto	l2476
u1330:
	line	376
	
l2470:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	377
	movlw	low(04h)
	movwf	((c:_exception_code))^00h,c
	goto	l2476
	line	354
	
l2474:; BSR set to: 0

	movf	((c:createResponse@CODE))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 7, Range of values is 1 to 242
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l2460
	xorlw	2^1	; case 2
	skipnz
	goto	l2462
	xorlw	3^2	; case 3
	skipnz
	goto	l2476
	xorlw	17^3	; case 17
	skipnz
	goto	l2458
	xorlw	240^17	; case 240
	skipnz
	goto	l2476
	xorlw	241^240	; case 241
	skipnz
	goto	l2466
	xorlw	242^241	; case 242
	skipnz
	goto	l2468
	goto	l2476

	line	386
	
l2476:
	movf	((c:_isExceptionRaised))^00h,c,w
	
	call	_sendResponse
	line	388
	
l153:
	return	;funcret
	callstack 0
GLOBAL	__end_of_createResponse
	__end_of_createResponse:
	signat	_createResponse,89
	global	_writeMasterPasswordToEEPROM

;; *************** function _writeMasterPasswordToEEPROM *****************
;; Defined at:
;;		line 476 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1   21[COMRAM] unsigned char 
;;  pic_eeprom_a    1   20[COMRAM] unsigned char 
;;  payload_leng    1   19[COMRAM] unsigned char 
;;  last_byte_da    1   18[COMRAM] unsigned char 
;;  last_byte_ad    1   17[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_EEPROM_Read
;;		_EEPROM_Write
;;		_UART_TransmitChar
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	476
global __ptext2
__ptext2:
psect	text2
	file	"main.c"
	line	476
	
_writeMasterPasswordToEEPROM:
;incstack = 0
	callstack 26
	line	478
	
l2282:
	line	479
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@index))^00h,c
	line	481
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_addr))^00h,c
	line	482
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_data))^00h,c
	line	484
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c
	line	486
	
l2284:
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeMasterPasswordToEEPROM@payload_length))^00h,c
	line	494
	
l2286:; BSR set to: 0

		movlw	09h-1
	cpfsgt	((c:writeMasterPasswordToEEPROM@payload_length))^00h,c
	goto	u1151
	goto	u1150

u1151:
	goto	l2292
u1150:
	line	496
	
l2288:; BSR set to: 0

	movlw	(0FFh)&0ffh
	
	call	_UART_TransmitChar
	goto	l167
	line	502
	
l2292:; BSR set to: 0

	asmopt push
asmopt off
movlw  82
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	0
u1377:
decfsz	wreg,f
	bra	u1377
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1377
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1377
	nop2
asmopt pop

	line	503
	
l2294:
	movff	(c:writeMasterPasswordToEEPROM@payload_length),(c:EEPROM_Write@eep_data)
	movlw	(0)&0ffh
	
	call	_EEPROM_Write
	line	504
	
l2296:
	asmopt push
asmopt off
movlw  82
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	0
u1387:
decfsz	wreg,f
	bra	u1387
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1387
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1387
	nop2
asmopt pop

	line	507
	
l2298:
	incf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c
	line	510
	
l2300:
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@index))^00h,c
	goto	l2312
	line	512
	
l2302:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	127
u1397:
decfsz	wreg,f
	bra	u1397
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1397
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1397
	nop
asmopt pop

	line	513
	
l2304:
	movf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:EEPROM_Write@eep_data))^00h,c
	movf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c,w
	addwf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	
	call	_EEPROM_Write
	line	514
	
l2306:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	127
u1407:
decfsz	wreg,f
	bra	u1407
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1407
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1407
	nop
asmopt pop

	line	516
	
l2308:
	movf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c,w
	addwf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_addr))^00h,c
	line	510
	
l2310:
	incf	((c:writeMasterPasswordToEEPROM@index))^00h,c
	
l2312:
		movf	((c:writeMasterPasswordToEEPROM@payload_length))^00h,c,w
	subwf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	btfss	status,0
	goto	u1161
	goto	u1160

u1161:
	goto	l2302
u1160:
	line	519
	
l2314:
	asmopt push
asmopt off
movlw  9
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	30
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	228
u1417:
decfsz	wreg,f
	bra	u1417
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1417
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1417
	nop2
asmopt pop

	line	520
	
l2316:
	movf	((c:writeMasterPasswordToEEPROM@last_byte_addr))^00h,c,w
	
	call	_EEPROM_Read
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_data))^00h,c
	line	521
	
l2318:
	asmopt push
asmopt off
movlw  9
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	30
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	228
u1427:
decfsz	wreg,f
	bra	u1427
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1427
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1427
	nop2
asmopt pop

	line	523
	
l2320:
	movlw	low(0)
	movwf	((c:_isExceptionRaised))^00h,c
	line	527
	
l2322:
	movff	(_request_unit),(c:_responseBuffer)
	line	528
	
l2324:
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	529
	
l2326:
	movff	(c:writeMasterPasswordToEEPROM@last_byte_data),0+((c:_responseBuffer)+02h)
	line	530
	
l2328:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+03h))^00h,c
	line	531
	
l2330:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+04h))^00h,c
	line	532
	
l167:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeMasterPasswordToEEPROM
	__end_of_writeMasterPasswordToEEPROM:
	signat	_writeMasterPasswordToEEPROM,89
	global	_writeDataToEEPROM

;; *************** function _writeDataToEEPROM *****************
;; Defined at:
;;		line 409 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    6[BANK1 ] unsigned short 
;;  at24_eeprom_    2    4[BANK1 ] unsigned short 
;;  payload_leng    2    2[BANK1 ] unsigned short 
;;  at24_eep_add    1    1[BANK1 ] unsigned char 
;;  at24_eep_add    1    0[BANK1 ] unsigned char 
;;  eeprom_data     1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0       8       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         2       0       8       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_EEPROM_Read
;;		_EEPROM_Write
;;		_writeByteAT24_EEPROM
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	409
global __ptext3
__ptext3:
psect	text3
	file	"main.c"
	line	409
	
_writeDataToEEPROM:
;incstack = 0
	callstack 25
	line	412
	
l2180:
	line	413
	movlw	low(0)
	movlb	1	; () banked
	movwf	((writeDataToEEPROM@at24_eep_addr_H))&0ffh
	line	414
	movlw	low(0)
	movwf	((writeDataToEEPROM@at24_eep_addr_L))&0ffh
	line	415
	movlw	high(0)
	movwf	((writeDataToEEPROM@at24_eeprom_addr_start+1))&0ffh
	movlw	low(0)
	movwf	((writeDataToEEPROM@at24_eeprom_addr_start))&0ffh
	line	420
	
l2182:; BSR set to: 1

	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Read
	movlb	1	; () banked
	movwf	((writeDataToEEPROM@at24_eep_addr_H))&0ffh
	line	421
	
l2184:; BSR set to: 1

	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1437:
decfsz	wreg,f
	bra	u1437
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1437
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1437
	nop
asmopt pop

	line	422
	
l2186:
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Read
	movlb	1	; () banked
	movwf	((writeDataToEEPROM@at24_eep_addr_L))&0ffh
	line	425
	
l2188:; BSR set to: 1

	movf	((writeDataToEEPROM@at24_eep_addr_L))&0ffh,w
	movff	(writeDataToEEPROM@at24_eep_addr_H),??_writeDataToEEPROM+0+0
	clrf	(??_writeDataToEEPROM+0+0+1)^00h,c
	movff	??_writeDataToEEPROM+0+0,??_writeDataToEEPROM+0+1
	clrf	(??_writeDataToEEPROM+0+0)^00h,c
	iorwf	(??_writeDataToEEPROM+0+0)^00h,c,w
	movwf	((c:_at24_eeprom_address))^00h,c
	movf	(??_writeDataToEEPROM+0+1)^00h,c,w
	movwf	1+((c:_at24_eeprom_address))^00h,c
	line	428
	
l2190:; BSR set to: 1

		incf	((c:_at24_eeprom_address))^00h,c,w
	bnz	u1101
	incf	((c:_at24_eeprom_address+1))^00h,c,w
	btfss	status,2
	goto	u1101
	goto	u1100

u1101:
	goto	l2194
u1100:
	line	429
	
l2192:; BSR set to: 1

	movlw	high(0)
	movwf	((c:_at24_eeprom_address+1))^00h,c
	movlw	low(0)
	movwf	((c:_at24_eeprom_address))^00h,c
	line	432
	
l2194:; BSR set to: 1

	movff	(c:_at24_eeprom_address),(writeDataToEEPROM@at24_eeprom_addr_start)
	movff	(c:_at24_eeprom_address+1),(writeDataToEEPROM@at24_eeprom_addr_start+1)
	line	435
	
l2196:; BSR set to: 1

	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movf	((??_writeDataToEEPROM+0+0))^00h,c,w
	movlb	1	; () banked
	movwf	((writeDataToEEPROM@payload_length))&0ffh
	clrf	((writeDataToEEPROM@payload_length+1))&0ffh
	line	438
	
l2198:; BSR set to: 1

	movff	(c:_at24_eeprom_address),(c:writeByteAT24_EEPROM@address)
	movff	(c:_at24_eeprom_address+1),(c:writeByteAT24_EEPROM@address+1)
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeByteAT24_EEPROM@data))^00h,c
	call	_writeByteAT24_EEPROM	;wreg free
	line	439
	
l2200:
	infsnz	((c:_at24_eeprom_address))^00h,c
	incf	((c:_at24_eeprom_address+1))^00h,c
	line	441
	
l2202:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u1447:
decfsz	wreg,f
	bra	u1447
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1447
asmopt pop

	line	444
	
l2204:
	movlw	high(0)
	movlb	1	; () banked
	movwf	((writeDataToEEPROM@i+1))&0ffh
	movlw	low(0)
	movwf	((writeDataToEEPROM@i))&0ffh
	goto	l2212
	line	446
	
l2206:; BSR set to: 1

	movf	((writeDataToEEPROM@i))&0ffh,w
	addwf	((c:_at24_eeprom_address))^00h,c,w
	movwf	((c:writeByteAT24_EEPROM@address))^00h,c
	movf	((writeDataToEEPROM@i+1))&0ffh,w
	addwfc	((c:_at24_eeprom_address+1))^00h,c,w
	movwf	1+((c:writeByteAT24_EEPROM@address))^00h,c
	movf	((writeDataToEEPROM@i))&0ffh,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeByteAT24_EEPROM@data))^00h,c
	call	_writeByteAT24_EEPROM	;wreg free
	line	447
	
l2208:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u1457:
decfsz	wreg,f
	bra	u1457
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1457
asmopt pop

	line	444
	
l2210:
	movlb	1	; () banked
	infsnz	((writeDataToEEPROM@i))&0ffh
	incf	((writeDataToEEPROM@i+1))&0ffh
	
l2212:; BSR set to: 1

		movf	((writeDataToEEPROM@payload_length))&0ffh,w
	subwf	((writeDataToEEPROM@i))&0ffh,w
	movf	((writeDataToEEPROM@payload_length+1))&0ffh,w
	subwfb	((writeDataToEEPROM@i+1))&0ffh,w
	btfss	status,0
	goto	u1111
	goto	u1110

u1111:
	goto	l2206
u1110:
	line	451
	
l2214:; BSR set to: 1

	movf	((writeDataToEEPROM@payload_length))&0ffh,w
	addwf	((c:_at24_eeprom_address))^00h,c
	movf	((writeDataToEEPROM@payload_length+1))&0ffh,w
	addwfc	((c:_at24_eeprom_address+1))^00h,c

	line	456
	
l2216:; BSR set to: 1

	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1467:
decfsz	wreg,f
	bra	u1467
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1467
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1467
	nop
asmopt pop

	line	458
	
l2218:
	movff	0+((c:_at24_eeprom_address)+01h),(c:EEPROM_Write@eep_data)
	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Write
	line	459
	
l2220:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1477:
decfsz	wreg,f
	bra	u1477
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1477
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1477
	nop
asmopt pop

	line	460
	
l2222:
	movff	(c:_at24_eeprom_address),(c:EEPROM_Write@eep_data)
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Write
	line	461
	
l2224:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1487:
decfsz	wreg,f
	bra	u1487
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1487
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1487
	nop
asmopt pop

	line	464
	
l2226:
	movff	(_request_unit),(c:_responseBuffer)
	line	465
	
l2228:
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	466
	
l2230:
	movff	0+(writeDataToEEPROM@at24_eeprom_addr_start+01h),0+((c:_responseBuffer)+02h)
	line	467
	
l2232:
	movff	(writeDataToEEPROM@at24_eeprom_addr_start),0+((c:_responseBuffer)+03h)
	line	468
	
l2234:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+04h))^00h,c
	line	469
	
l163:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeDataToEEPROM
	__end_of_writeDataToEEPROM:
	signat	_writeDataToEEPROM,89
	global	_writeByteAT24_EEPROM

;; *************** function _writeByteAT24_EEPROM *****************
;; Defined at:
;;		line 539 in file "main.c"
;; Parameters:    Size  Location     Type
;;  address         2   12[COMRAM] unsigned int 
;;  data            1   14[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 3E/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         3       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_I2C2_Send
;;		_I2C2_Start
;;		_I2C2_Stop
;; This function is called by:
;;		_writeDataToEEPROM
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	539
global __ptext4
__ptext4:
psect	text4
	file	"main.c"
	line	539
	
_writeByteAT24_EEPROM:
;incstack = 0
	callstack 25
	line	541
	
l2128:
	call	_I2C2_Start	;wreg free
	line	542
	
l2130:
	movlw	(0A0h)&0ffh
	
	call	_I2C2_Send
	movwf	((c:_checkAck))^00h,c
	line	543
	
l2132:
	movf	(0+((c:writeByteAT24_EEPROM@address)+01h))^00h,c,w
	
	call	_I2C2_Send
	line	544
	
l2134:
	movf	((c:writeByteAT24_EEPROM@address))^00h,c,w
	
	call	_I2C2_Send
	line	545
	
l2136:
	movf	((c:writeByteAT24_EEPROM@data))^00h,c,w
	
	call	_I2C2_Send
	line	546
	call	_I2C2_Stop	;wreg free
	line	547
	
l173:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeByteAT24_EEPROM
	__end_of_writeByteAT24_EEPROM:
	signat	_writeByteAT24_EEPROM,8313
	global	_EEPROM_Write

;; *************** function _EEPROM_Write *****************
;; Defined at:
;;		line 634 in file "main.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  eep_data        1   11[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         1       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writeDataToEEPROM
;;		_writeMasterPasswordToEEPROM
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	634
global __ptext5
__ptext5:
psect	text5
	file	"main.c"
	line	634
	
_EEPROM_Write:
;incstack = 0
	callstack 26
	movwf	((c:EEPROM_Write@addr))^00h,c
	line	636
	
l2138:
	asmopt push
asmopt off
movlw  41
movwf	(??_EEPROM_Write+0+0+1)^00h,c
movlw	150
movwf	(??_EEPROM_Write+0+0)^00h,c
	movlw	127
u1497:
decfsz	wreg,f
	bra	u1497
	decfsz	(??_EEPROM_Write+0+0)^00h,c,f
	bra	u1497
	decfsz	(??_EEPROM_Write+0+0+1)^00h,c,f
	bra	u1497
	nop
asmopt pop

	line	638
	
l2140:
	movff	(c:EEPROM_Write@addr),(c:4009)	;volatile
	line	639
	
l2142:
	movff	(c:EEPROM_Write@eep_data),(c:4008)	;volatile
	line	641
	
l2144:
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	642
	
l2146:
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	643
	
l2148:
	bsf	((c:4006))^0f00h,c,2	;volsfr
	line	645
	
l2150:
	bcf	((c:4082))^0f00h,c,7	;volatile
	line	648
	
l2152:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	649
	
l2154:
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	650
	
l2156:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	652
	
l2158:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	656
	
l192:
	line	655
	btfss	((c:4001))^0f00h,c,4	;volatile
	goto	u1091
	goto	u1090
u1091:
	goto	l192
u1090:
	
l194:
	line	658
	bcf	((c:4001))^0f00h,c,4	;volatile
	line	659
	
l195:
	return	;funcret
	callstack 0
GLOBAL	__end_of_EEPROM_Write
	__end_of_EEPROM_Write:
	signat	_EEPROM_Write,8313
	global	_sendResponse

;; *************** function _sendResponse *****************
;; Defined at:
;;		line 576 in file "main.c"
;; Parameters:    Size  Location     Type
;;  isExceptionO    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  isExceptionO    1   13[COMRAM] unsigned char 
;;  index           2   14[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_UART_TransmitChar
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	576
global __ptext6
__ptext6:
psect	text6
	file	"main.c"
	line	576
	
_sendResponse:
;incstack = 0
	callstack 26
	movwf	((c:sendResponse@isExceptionOccurred))^00h,c
	line	578
	
l2332:
	line	581
	
l2334:
	movlw	(03Ah)&0ffh
	
	call	_UART_TransmitChar
	line	582
	
l2336:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1507:
decfsz	wreg,f
	bra	u1507
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1507
asmopt pop

	line	583
	
l2338:
	movlw	(023h)&0ffh
	
	call	_UART_TransmitChar
	line	584
	
l2340:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1517:
decfsz	wreg,f
	bra	u1517
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1517
asmopt pop

	line	586
	
l2342:
	movf	((c:sendResponse@isExceptionOccurred))^00h,c,w
	btfss	status,2
	goto	u1171
	goto	u1170
u1171:
	goto	l2358
u1170:
	line	588
	
l2344:
	movlw	high(0)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(0)
	movwf	((c:sendResponse@index))^00h,c
	line	590
	
l2350:
	movf	((c:sendResponse@index))^00h,c,w
	addlw	low(_responseBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	591
	
l2352:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1527:
decfsz	wreg,f
	bra	u1527
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1527
asmopt pop

	line	588
	
l2354:
	infsnz	((c:sendResponse@index))^00h,c
	incf	((c:sendResponse@index+1))^00h,c
	
l2356:
		movf	((c:sendResponse@index+1))^00h,c,w
	bnz	u1180
	movlw	30
	subwf	 ((c:sendResponse@index))^00h,c,w
	btfss	status,0
	goto	u1181
	goto	u1180

u1181:
	goto	l2350
u1180:
	goto	l2372
	line	597
	
l2358:
	movlw	(021h)&0ffh
	
	call	_UART_TransmitChar
	line	598
	
l2360:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1537:
decfsz	wreg,f
	bra	u1537
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1537
asmopt pop

	line	599
	
l2362:
	movlw	(0FFh)&0ffh
	
	call	_UART_TransmitChar
	line	600
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1547:
decfsz	wreg,f
	bra	u1547
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1547
asmopt pop

	line	601
	
l2364:
	movf	((c:_exception_code))^00h,c,w
	
	call	_UART_TransmitChar
	line	602
	
l2366:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1557:
decfsz	wreg,f
	bra	u1557
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1557
asmopt pop

	line	604
	
l2368:
	movlw	low(0)
	movwf	((c:_isExceptionRaised))^00h,c
	line	605
	
l2370:
	movlw	low(0)
	movwf	((c:_exception_code))^00h,c
	line	609
	
l2372:
	movlw	(0Dh)&0ffh
	
	call	_UART_TransmitChar
	line	610
	
l2374:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1567:
decfsz	wreg,f
	bra	u1567
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1567
asmopt pop

	line	611
	
l2376:
	movlw	(0Ah)&0ffh
	
	call	_UART_TransmitChar
	line	614
	
l2378:
	movlw	high(032h)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(032h)
	movwf	((c:sendResponse@index))^00h,c
	line	615
	goto	l2384
	line	617
	
l2380:
	movf	((c:sendResponse@index))^00h,c,w
	sublw	low(_requestBuffer+032h)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0FFh)
	movwf	indf2
	line	618
	
l2382:
	decf	((c:sendResponse@index))^00h,c
	btfss	status,0
	decf	((c:sendResponse@index+1))^00h,c
	line	615
	
l2384:
	movf	((c:sendResponse@index))^00h,c,w
iorwf	((c:sendResponse@index+1))^00h,c,w
	btfss	status,2
	goto	u1191
	goto	u1190

u1191:
	goto	l2380
u1190:
	line	622
	
l2386:
	movlw	high(0)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(0)
	movwf	((c:sendResponse@index))^00h,c
	line	623
	goto	l2392
	line	624
	
l2388:
	movf	((c:sendResponse@index))^00h,c,w
	addlw	low(_responseBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0FFh)
	movwf	indf2
	line	625
	
l2390:
	infsnz	((c:sendResponse@index))^00h,c
	incf	((c:sendResponse@index+1))^00h,c
	line	623
	
l2392:
		movf	((c:sendResponse@index+1))^00h,c,w
	bnz	u1200
	movlw	30
	subwf	 ((c:sendResponse@index))^00h,c,w
	btfss	status,0
	goto	u1201
	goto	u1200

u1201:
	goto	l2388
u1200:
	line	627
	
l189:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sendResponse
	__end_of_sendResponse:
	signat	_sendResponse,4217
	global	_isPasswordMatched

;; *************** function _isPasswordMatched *****************
;; Defined at:
;;		line 800 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1   15[COMRAM] unsigned char 
;;  matchFlag       1   14[COMRAM] unsigned char 
;;  payload_leng    1   13[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	800
global __ptext7
__ptext7:
psect	text7
	file	"main.c"
	line	800
	
_isPasswordMatched:
;incstack = 0
	callstack 27
	line	802
	
l1808:
	line	803
	movlw	low(0)
	movwf	((c:isPasswordMatched@index))^00h,c
	line	804
	movlw	low(01h)
	movwf	((c:isPasswordMatched@matchFlag))^00h,c
	line	807
	
l1810:
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:isPasswordMatched@payload_length))^00h,c
	line	810
	
l1812:; BSR set to: 0

	movf	((c:isPasswordMatched@payload_length))^00h,c,w
xorwf	(0+((c:_master)+08h))^00h,c,w
	btfsc	status,2
	goto	u661
	goto	u660

u661:
	goto	l1818
u660:
	line	813
	
l1814:; BSR set to: 0

	movlw	(0)&0ffh
	goto	l220
	line	817
	
l1818:; BSR set to: 0

	movlw	low(0)
	movwf	((c:isPasswordMatched@index))^00h,c
	goto	l1826
	line	819
	
l1820:; BSR set to: 0

	movf	((c:isPasswordMatched@index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:isPasswordMatched@index))^00h,c,w
	addlw	low(_master)
	movwf	fsr1l
	clrf	fsr1h
	movf	postinc2,w
xorwf	postinc1,w
	btfsc	status,2
	goto	u671
	goto	u670

u671:
	goto	l1824
u670:
	line	821
	
l1822:; BSR set to: 0

	movlw	low(0)
	movwf	((c:isPasswordMatched@matchFlag))^00h,c
	line	822
	goto	l1828
	line	817
	
l1824:; BSR set to: 0

	incf	((c:isPasswordMatched@index))^00h,c
	
l1826:; BSR set to: 0

		movf	(0+((c:_master)+08h))^00h,c,w
	subwf	((c:isPasswordMatched@index))^00h,c,w
	btfss	status,0
	goto	u681
	goto	u680

u681:
	goto	l1820
u680:
	line	826
	
l1828:; BSR set to: 0

	movf	((c:isPasswordMatched@matchFlag))^00h,c,w
	line	827
	
l220:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_isPasswordMatched
	__end_of_isPasswordMatched:
	signat	_isPasswordMatched,89
	global	_createPingResponse

;; *************** function _createPingResponse *****************
;; Defined at:
;;		line 396 in file "main.c"
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
;;		On exit  : 0/0
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
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	396
global __ptext8
__ptext8:
psect	text8
	file	"main.c"
	line	396
	
_createPingResponse:; BSR set to: 0

;incstack = 0
	callstack 27
	line	398
	
l1652:
	movff	(_request_unit),(c:_responseBuffer)
	line	399
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	400
	
l1654:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+02h))^00h,c
	line	401
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+03h))^00h,c
	line	402
	
l156:
	return	;funcret
	callstack 0
GLOBAL	__end_of_createPingResponse
	__end_of_createPingResponse:
	signat	_createPingResponse,89
	global	_ReadCredentials

;; *************** function _ReadCredentials *****************
;; Defined at:
;;		line 737 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    8[BANK1 ] unsigned short 
;;  ADDR            2    5[BANK1 ] unsigned char [2]
;;  credential_l    2   10[BANK1 ] unsigned short 
;;  START_ADDR      2    3[BANK1 ] unsigned short 
;;  index           1    7[BANK1 ] unsigned char 
;;  response_ind    1    2[BANK1 ] unsigned char 
;;  last_char_in    1    1[BANK1 ] unsigned char 
;;  payload_leng    1    0[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         0       0      12       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         2       0      12       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_UART_TransmitChar
;;		_readByteAT24_EEPROM
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	737
global __ptext9
__ptext9:
psect	text9
	file	"main.c"
	line	737
	
_ReadCredentials:
;incstack = 0
	callstack 25
	line	741
	
l2236:
	movlw	low(0)
	movlb	1	; () banked
	movwf	((ReadCredentials@index))&0ffh
	line	742
	movlw	low(0)
	movwf	((ReadCredentials@last_char_index))&0ffh
	line	743
	movlw	low(0)
	movwf	((ReadCredentials@response_index))&0ffh
	line	744
	movlw	low(02h)
	movwf	((ReadCredentials@payload_length))&0ffh
	line	747
	movlw	high(0)
	movwf	((ReadCredentials@START_ADDR+1))&0ffh
	movlw	low(0)
	movwf	((ReadCredentials@START_ADDR))&0ffh
	line	749
	movlw	low(0)
	movwf	((ReadCredentials@index))&0ffh
	goto	l2242
	line	750
	
l2238:; BSR set to: 1

	movf	((ReadCredentials@index))&0ffh,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(ReadCredentials@ADDR)
	addwf	((ReadCredentials@index))&0ffh,w
	movwf	c:fsr1l
	clrf	1+c:fsr1l
	movlw	high(ReadCredentials@ADDR)
	addwfc	1+c:fsr1l
	movff	indf2,indf1
	line	749
	
l2240:; BSR set to: 1

	incf	((ReadCredentials@index))&0ffh
	
l2242:; BSR set to: 1

		movf	((ReadCredentials@payload_length))&0ffh,w
	subwf	((ReadCredentials@index))&0ffh,w
	btfss	status,0
	goto	u1121
	goto	u1120

u1121:
	goto	l2238
u1120:
	line	756
	
l2244:; BSR set to: 1

	movf	((ReadCredentials@ADDR))&0ffh,w
	movff	0+(ReadCredentials@ADDR+01h),??_ReadCredentials+0+0
	clrf	(??_ReadCredentials+0+0+1)^00h,c
	movff	??_ReadCredentials+0+0,??_ReadCredentials+0+1
	clrf	(??_ReadCredentials+0+0)^00h,c
	iorwf	(??_ReadCredentials+0+0)^00h,c,w
	movwf	((ReadCredentials@START_ADDR))&0ffh
	movf	(??_ReadCredentials+0+1)^00h,c,w
	movwf	1+((ReadCredentials@START_ADDR))&0ffh
	line	759
	
l2246:; BSR set to: 1

	movf	(0+(ReadCredentials@ADDR+01h))&0ffh,w
	
	call	_UART_TransmitChar
	line	760
	
l2248:
	movlb	1	; () banked
	movf	((ReadCredentials@ADDR))&0ffh,w
	
	call	_UART_TransmitChar
	line	762
	
l2250:
	asmopt push
asmopt off
movlw  5
movwf	(??_ReadCredentials+0+0+1)^00h,c
movlw	15
movwf	(??_ReadCredentials+0+0)^00h,c
	movlw	241
u1577:
decfsz	wreg,f
	bra	u1577
	decfsz	(??_ReadCredentials+0+0)^00h,c,f
	bra	u1577
	decfsz	(??_ReadCredentials+0+0+1)^00h,c,f
	bra	u1577
	nop
asmopt pop

	line	764
	
l2252:
	movff	(ReadCredentials@START_ADDR),(c:readByteAT24_EEPROM@address)
	movff	(ReadCredentials@START_ADDR+1),(c:readByteAT24_EEPROM@address+1)
	call	_readByteAT24_EEPROM	;wreg free
	movwf	(??_ReadCredentials+0+0)^00h,c
	movf	((??_ReadCredentials+0+0))^00h,c,w
	movlb	1	; () banked
	movwf	((ReadCredentials@credential_length))&0ffh
	clrf	((ReadCredentials@credential_length+1))&0ffh
	line	765
	
l2254:; BSR set to: 1

	asmopt push
asmopt off
movlw  5
movwf	(??_ReadCredentials+0+0+1)^00h,c
movlw	15
movwf	(??_ReadCredentials+0+0)^00h,c
	movlw	241
u1587:
decfsz	wreg,f
	bra	u1587
	decfsz	(??_ReadCredentials+0+0)^00h,c,f
	bra	u1587
	decfsz	(??_ReadCredentials+0+0+1)^00h,c,f
	bra	u1587
	nop
asmopt pop

	line	767
	
l2256:
	movlb	1	; () banked
	movf	(0+(ReadCredentials@credential_length+01h))&0ffh,w
	
	call	_UART_TransmitChar
	line	768
	
l2258:
	movlb	1	; () banked
	movf	((ReadCredentials@credential_length))&0ffh,w
	
	call	_UART_TransmitChar
	line	770
	
l2260:
	movlb	1	; () banked
	infsnz	((ReadCredentials@START_ADDR))&0ffh
	incf	((ReadCredentials@START_ADDR+1))&0ffh
	line	772
	
l2262:; BSR set to: 1

		incf	((ReadCredentials@credential_length))&0ffh,w
iorwf	((ReadCredentials@credential_length+1))&0ffh,w
	btfss	status,2
	goto	u1131
	goto	u1130

u1131:
	goto	l212
u1130:
	line	774
	
l2264:; BSR set to: 1

	movlw	(0FFh)&0ffh
	
	call	_UART_TransmitChar
	goto	l213
	line	776
	
l212:; BSR set to: 1

	line	779
	movff	(_request_unit),(c:_responseBuffer)
	line	780
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	782
	
l2268:; BSR set to: 1

	movlw	(02h)&0ffh
	addwf	((ReadCredentials@response_index))&0ffh
	line	785
	
l2270:; BSR set to: 1

	movlw	high(0)
	movwf	((ReadCredentials@i+1))&0ffh
	movlw	low(0)
	movwf	((ReadCredentials@i))&0ffh
	goto	l2278
	line	786
	
l2272:; BSR set to: 1

	movf	((ReadCredentials@response_index))&0ffh,w
	addlw	low(_responseBuffer)
	addwf	((ReadCredentials@i))&0ffh,w
	movwf	fsr2l
	clrf	fsr2h
	movf	((ReadCredentials@i))&0ffh,w
	addwf	((ReadCredentials@START_ADDR))&0ffh,w
	movwf	((c:readByteAT24_EEPROM@address))^00h,c
	movf	((ReadCredentials@i+1))&0ffh,w
	addwfc	((ReadCredentials@START_ADDR+1))&0ffh,w
	movwf	1+((c:readByteAT24_EEPROM@address))^00h,c
	call	_readByteAT24_EEPROM	;wreg free
	movwf	indf2,c

	line	787
	
l2274:
	movlb	1	; () banked
	movf	((ReadCredentials@response_index))&0ffh,w
	addwf	((ReadCredentials@i))&0ffh,w
	movwf	((ReadCredentials@last_char_index))&0ffh
	line	785
	
l2276:; BSR set to: 1

	infsnz	((ReadCredentials@i))&0ffh
	incf	((ReadCredentials@i+1))&0ffh
	
l2278:; BSR set to: 1

		movf	((ReadCredentials@credential_length))&0ffh,w
	subwf	((ReadCredentials@i))&0ffh,w
	movf	((ReadCredentials@credential_length+1))&0ffh,w
	subwfb	((ReadCredentials@i+1))&0ffh,w
	btfss	status,0
	goto	u1141
	goto	u1140

u1141:
	goto	l2272
u1140:
	line	791
	
l2280:; BSR set to: 1

	movf	((ReadCredentials@last_char_index))&0ffh,w
	addlw	low(_responseBuffer+01h)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	792
	
l213:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ReadCredentials
	__end_of_ReadCredentials:
	signat	_ReadCredentials,89
	global	_readByteAT24_EEPROM

;; *************** function _readByteAT24_EEPROM *****************
;; Defined at:
;;		line 554 in file "main.c"
;; Parameters:    Size  Location     Type
;;  address         2   12[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  eeprom_data     1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         2       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_I2C2_Read
;;		_I2C2_Send
;;		_I2C2_Start
;;		_I2C2_Stop
;; This function is called by:
;;		_ReadCredentials
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	554
global __ptext10
__ptext10:
psect	text10
	file	"main.c"
	line	554
	
_readByteAT24_EEPROM:
;incstack = 0
	callstack 25
	line	555
	
l2160:
	line	557
	
l2162:
	call	_I2C2_Start	;wreg free
	line	558
	
l2164:
	movlw	(0A0h)&0ffh
	
	call	_I2C2_Send
	line	559
	
l2166:
	movf	(0+((c:readByteAT24_EEPROM@address)+01h))^00h,c,w
	
	call	_I2C2_Send
	line	560
	
l2168:
	movf	((c:readByteAT24_EEPROM@address))^00h,c,w
	
	call	_I2C2_Send
	line	562
	
l2170:
	call	_I2C2_Start	;wreg free
	line	563
	
l2172:
	movlw	(0A1h)&0ffh
	
	call	_I2C2_Send
	line	564
	
l2174:
	call	_I2C2_Read	;wreg free
	movwf	((c:readByteAT24_EEPROM@eeprom_data))^00h,c
	line	565
	call	_I2C2_Stop	;wreg free
	line	567
	
l2176:
	movf	((c:readByteAT24_EEPROM@eeprom_data))^00h,c,w
	line	568
	
l176:
	return	;funcret
	callstack 0
GLOBAL	__end_of_readByteAT24_EEPROM
	__end_of_readByteAT24_EEPROM:
	signat	_readByteAT24_EEPROM,4217
	global	_I2C2_Stop

;; *************** function _I2C2_Stop *****************
;; Defined at:
;;		line 82 in file "i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
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
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writeByteAT24_EEPROM
;;		_readByteAT24_EEPROM
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	82
global __ptext11
__ptext11:
psect	text11
	file	"i2c.c"
	line	82
	
_I2C2_Stop:
;incstack = 0
	callstack 25
	line	83
	
l2106:
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	84
	
l267:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u1061
	goto	u1060
u1061:
	goto	l267
u1060:
	
l269:
	line	85
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	86
	
l270:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Stop
	__end_of_I2C2_Stop:
	signat	_I2C2_Stop,89
	global	_I2C2_Start

;; *************** function _I2C2_Start *****************
;; Defined at:
;;		line 51 in file "i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
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
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writeByteAT24_EEPROM
;;		_readByteAT24_EEPROM
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	51
global __ptext12
__ptext12:
psect	text12
	file	"i2c.c"
	line	51
	
_I2C2_Start:
;incstack = 0
	callstack 25
	line	52
	
l2102:
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	53
	
l255:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u1031
	goto	u1030
u1031:
	goto	l255
u1030:
	
l257:
	line	54
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	55
	
l258:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Start
	__end_of_I2C2_Start:
	signat	_I2C2_Start,89
	global	_I2C2_Send

;; *************** function _I2C2_Send *****************
;; Defined at:
;;		line 131 in file "i2c.c"
;; Parameters:    Size  Location     Type
;;  BYTE            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  BYTE            1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writeByteAT24_EEPROM
;;		_readByteAT24_EEPROM
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	131
global __ptext13
__ptext13:
psect	text13
	file	"i2c.c"
	line	131
	
_I2C2_Send:
;incstack = 0
	callstack 25
	movwf	((c:I2C2_Send@BYTE))^00h,c
	line	132
	
l2104:
	movff	(c:I2C2_Send@BYTE),(c:4041)	;volatile
	line	133
	
l285:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u1041
	goto	u1040
u1041:
	goto	l285
u1040:
	
l287:
	line	134
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	135
	btfsc	((c:4037))^0f00h,c,6	;volatile
	goto	u1051
	goto	u1050
u1051:
	movlw	1
	goto	u1056
u1050:
	movlw	0
u1056:
	line	136
	
l288:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Send
	__end_of_I2C2_Send:
	signat	_I2C2_Send,4217
	global	_I2C2_Read

;; *************** function _I2C2_Read *****************
;; Defined at:
;;		line 147 in file "i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/1
;;		On exit  : 0/0
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
;;		_readByteAT24_EEPROM
;; This function uses a non-reentrant model
;;
psect	text14,class=CODE,space=0,reloc=2,group=0
	line	147
global __ptext14
__ptext14:
psect	text14
	file	"i2c.c"
	line	147
	
_I2C2_Read:
;incstack = 0
	callstack 25
	line	148
	
l2108:
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	149
	
l291:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u1071
	goto	u1070
u1071:
	goto	l291
u1070:
	
l293:
	line	150
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	151
	
l2110:
	movf	((c:4041))^0f00h,c,w	;volatile
	line	152
	
l294:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Read
	__end_of_I2C2_Read:
	signat	_I2C2_Read,89
	global	_UART_TransmitChar

;; *************** function _UART_TransmitChar *****************
;; Defined at:
;;		line 188 in file "main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   11[COMRAM] unsigned char 
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_createResponse
;;		_writeMasterPasswordToEEPROM
;;		_sendResponse
;;		_ReadCredentials
;; This function uses a non-reentrant model
;;
psect	text15,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	188
global __ptext15
__ptext15:
psect	text15
	file	"main.c"
	line	188
	
_UART_TransmitChar:
;incstack = 0
	callstack 26
	movwf	((c:UART_TransmitChar@data))^00h,c
	line	190
	
l2114:
	line	191
	
l104:
	line	190
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	u1081
	goto	u1080
u1081:
	goto	l104
u1080:
	line	192
	
l2116:
	movff	(c:UART_TransmitChar@data),(c:4013)	;volatile
	line	193
	
l107:
	return	;funcret
	callstack 0
GLOBAL	__end_of_UART_TransmitChar
	__end_of_UART_TransmitChar:
	signat	_UART_TransmitChar,4217
	global	_UART_Init

;; *************** function _UART_Init *****************
;; Defined at:
;;		line 121 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            3   20[COMRAM] float 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/0
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
psect	text16,class=CODE,space=0,reloc=2,group=0
	line	121
global __ptext16
__ptext16:
psect	text16
	file	"main.c"
	line	121
	
_UART_Init:
;incstack = 0
	callstack 27
	line	125
	
l2440:
	bcf	c:(31910/8),(31910)&7	;volatile
	line	126
	bsf	c:(31911/8),(31911)&7	;volatile
	line	127
	movlb	15	; () banked
	bcf	((3898))&0ffh,7	;volatile
	line	129
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	130
	bsf	((c:4082))^0f00h,c,6	;volatile
	line	131
	bsf	((c:3997))^0f00h,c,5	;volatile
	line	133
	
l2442:; BSR set to: 15

	movlw	low(020h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	134
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	137
	movlw	low(float24(103.16666666666667))
	movwf	((c:UART_Init@temp))^00h,c
	movlw	high(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+1))^00h,c
	movlw	low highword(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+2))^00h,c

	line	138
	
l2444:; BSR set to: 15

	movff	(c:UART_Init@temp),(c:___fttol@f1)
	movff	(c:UART_Init@temp+1),(c:___fttol@f1+1)
	movff	(c:UART_Init@temp+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movf	(0+?___fttol)^00h,c,w
	movwf	((c:4015))^0f00h,c	;volatile
	line	181
	
l101:; BSR set to: 0

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
;;  f1              3   11[COMRAM] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    1[BANK0 ] unsigned long 
;;  exp1            1    5[BANK0 ] unsigned char 
;;  sign1           1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   11[COMRAM] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/F
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         4       0       0       0       0       0       0
;;      Locals:         0       6       0       0       0       0       0
;;      Temps:          5       0       0       0       0       0       0
;;      Totals:         9       6       0       0       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UART_Init
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
global __ptext17
__ptext17:
psect	text17
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
	
___fttol:; BSR set to: 0

;incstack = 0
	callstack 27
	line	49
	
l2394:; BSR set to: 15

	movff	(c:___fttol@f1+2),??___fttol+0+0
	clrf	(??___fttol+0+0+1)^00h,c
	clrf	(??___fttol+0+0+2)^00h,c
	rlcf	((c:___fttol@f1+1))^00h,c,w
	rlcf	(??___fttol+0+0)^00h,c
	bnc	u1211
	bsf	(??___fttol+0+0+1)^00h,c,0
u1211:
	movf	(??___fttol+0+0)^00h,c,w
	movlb	0	; () banked
	movwf	((___fttol@exp1))&0ffh
	movf	((___fttol@exp1))&0ffh,w
	btfss	status,2
	goto	u1221
	goto	u1220
u1221:
	goto	l2400
u1220:
	line	50
	
l2396:; BSR set to: 0

	movlw	low(0)
	movwf	((c:?___fttol))^00h,c
	movlw	high(0)
	movwf	((c:?___fttol+1))^00h,c
	movlw	low highword(0)
	movwf	((c:?___fttol+2))^00h,c
	movlw	high highword(0)
	movwf	((c:?___fttol+3))^00h,c
	goto	l671
	line	51
	
l2400:; BSR set to: 0

	movlw	(017h)&0ffh
	movwf	(??___fttol+0+0)^00h,c
	movff	(c:___fttol@f1),??___fttol+1+0
	movff	(c:___fttol@f1+1),??___fttol+1+0+1
	movff	(c:___fttol@f1+2),??___fttol+1+0+2
	incf	((??___fttol+0+0))^00h,c,w
	movwf	(??___fttol+4+0)^00h,c
	goto	u1230
u1235:
	bcf	status,0
	rrcf	(??___fttol+1+2)^00h,c
	rrcf	(??___fttol+1+1)^00h,c
	rrcf	(??___fttol+1+0)^00h,c
u1230:
	decfsz	(??___fttol+4+0)^00h,c
	goto	u1235
	movf	(??___fttol+1+0)^00h,c,w
	movlb	0	; () banked
	movwf	((___fttol@sign1))&0ffh
	line	52
	
l2402:; BSR set to: 0

	bsf	(0+(15/8)+(c:___fttol@f1))^00h,c,(15)&7
	line	53
	
l2404:; BSR set to: 0

	movlw	low(0FFFFh)
	andwf	((c:___fttol@f1))^00h,c
	movlw	high(0FFFFh)
	andwf	((c:___fttol@f1+1))^00h,c
	movlw	low highword(0FFFFh)
	andwf	((c:___fttol@f1+2))^00h,c

	line	54
	
l2406:; BSR set to: 0

	movf	((c:___fttol@f1))^00h,c,w
	movwf	((___fttol@lval))&0ffh
	movf	((c:___fttol@f1+1))^00h,c,w
	movwf	1+((___fttol@lval))&0ffh
	
	movf	((c:___fttol@f1+2))^00h,c,w
	movwf	2+((___fttol@lval))&0ffh
	
	clrf	3+((___fttol@lval))&0ffh
	
	line	55
	
l2408:; BSR set to: 0

	movlw	(08Eh)&0ffh
	subwf	((___fttol@exp1))&0ffh
	line	56
	
l2410:; BSR set to: 0

	btfsc	((___fttol@exp1))&0ffh,7
	goto	u1240
	goto	u1241

u1241:
	goto	l2422
u1240:
	line	57
	
l2412:; BSR set to: 0

		movf	((___fttol@exp1))&0ffh,w
	xorlw	80h
	addlw	-(80h^-15)
	btfsc	status,0
	goto	u1251
	goto	u1250

u1251:
	goto	l2418
u1250:
	goto	l2396
	line	60
	
l2418:; BSR set to: 0

	bcf	status,0
	rrcf	((___fttol@lval+3))&0ffh
	rrcf	((___fttol@lval+2))&0ffh
	rrcf	((___fttol@lval+1))&0ffh
	rrcf	((___fttol@lval))&0ffh
	line	61
	
l2420:; BSR set to: 0

	incfsz	((___fttol@exp1))&0ffh
	
	goto	l2418
	goto	l2432
	line	63
	
l2422:; BSR set to: 0

		movlw	018h-1
	cpfsgt	((___fttol@exp1))&0ffh
	goto	u1261
	goto	u1260

u1261:
	goto	l2430
u1260:
	goto	l2396
	line	66
	
l2428:; BSR set to: 0

	bcf	status,0
	rlcf	((___fttol@lval))&0ffh
	rlcf	((___fttol@lval+1))&0ffh
	rlcf	((___fttol@lval+2))&0ffh
	rlcf	((___fttol@lval+3))&0ffh
	line	67
	decf	((___fttol@exp1))&0ffh
	line	65
	
l2430:; BSR set to: 0

	movf	((___fttol@exp1))&0ffh,w
	btfss	status,2
	goto	u1271
	goto	u1270
u1271:
	goto	l2428
u1270:
	line	70
	
l2432:; BSR set to: 0

	movf	((___fttol@sign1))&0ffh,w
	btfsc	status,2
	goto	u1281
	goto	u1280
u1281:
	goto	l2436
u1280:
	line	71
	
l2434:; BSR set to: 0

	comf	((___fttol@lval+3))&0ffh
	comf	((___fttol@lval+2))&0ffh
	comf	((___fttol@lval+1))&0ffh
	negf	((___fttol@lval))&0ffh
	movlw	0
	addwfc	((___fttol@lval+1))&0ffh
	addwfc	((___fttol@lval+2))&0ffh
	addwfc	((___fttol@lval+3))&0ffh
	line	72
	
l2436:; BSR set to: 0

	movff	(___fttol@lval),(c:?___fttol)
	movff	(___fttol@lval+1),(c:?___fttol+1)
	movff	(___fttol@lval+2),(c:?___fttol+2)
	movff	(___fttol@lval+3),(c:?___fttol+3)
	line	73
	
l671:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
	signat	___fttol,4220
	global	_ReadMasterPasswordFromEEPROM

;; *************** function _ReadMasterPasswordFromEEPROM *****************
;; Defined at:
;;		line 699 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1   16[COMRAM] unsigned char 
;;  password_len    1   15[COMRAM] unsigned char 
;;  password_add    1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 3F/F
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_EEPROM_Read
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	699
global __ptext18
__ptext18:
psect	text18
	file	"main.c"
	line	699
	
_ReadMasterPasswordFromEEPROM:; BSR set to: 0

;incstack = 0
	callstack 27
	line	701
	
l2478:; BSR set to: 15

	line	702
	movlw	low(0)
	movwf	((c:ReadMasterPasswordFromEEPROM@password_addr))^00h,c
	line	705
	
l2480:; BSR set to: 15

	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1597:
decfsz	wreg,f
	bra	u1597
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1597
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1597
	nop
asmopt pop

	line	706
	
l2482:
	movlw	(0)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:ReadMasterPasswordFromEEPROM@password_length))^00h,c
	line	707
	
l2484:
	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1607:
decfsz	wreg,f
	bra	u1607
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1607
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1607
	nop
asmopt pop

	line	708
	
l2486:
	incf	((c:ReadMasterPasswordFromEEPROM@password_addr))^00h,c
	line	710
	
l2488:
		incf	((c:ReadMasterPasswordFromEEPROM@password_length))^00h,c,w
	btfsc	status,2
	goto	u1341
	goto	u1340

u1341:
	goto	l2504
u1340:
	line	713
	
l2490:
	movlw	low(0)
	movwf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c
	goto	l2500
	line	715
	
l2492:
	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1617:
decfsz	wreg,f
	bra	u1617
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1617
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1617
	nop
asmopt pop

	line	716
	
l2494:
	movf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c,w
	addlw	low(_master)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:ReadMasterPasswordFromEEPROM@password_addr))^00h,c,w
	addwf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c,w
	
	call	_EEPROM_Read
	movwf	indf2,c

	line	717
	
l2496:
	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1627:
decfsz	wreg,f
	bra	u1627
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1627
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1627
	nop
asmopt pop

	line	713
	
l2498:
	incf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c
	
l2500:
		movf	((c:ReadMasterPasswordFromEEPROM@password_length))^00h,c,w
	subwf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c,w
	btfss	status,0
	goto	u1351
	goto	u1350

u1351:
	goto	l2492
u1350:
	line	720
	
l2502:
	movlw	low(0)
	movwf	((c:_isExceptionRaised))^00h,c
	line	721
	movlw	low(0)
	movwf	((c:_exception_code))^00h,c
	line	722
	goto	l2506
	line	725
	
l2504:
	movlw	low(0)
	movwf	((c:_isPasswordSet))^00h,c
	line	729
	
l2506:
	movff	(c:ReadMasterPasswordFromEEPROM@password_length),0+((c:_master)+08h)
	line	730
	
l206:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ReadMasterPasswordFromEEPROM
	__end_of_ReadMasterPasswordFromEEPROM:
	signat	_ReadMasterPasswordFromEEPROM,89
	global	_EEPROM_Read

;; *************** function _EEPROM_Read *****************
;; Defined at:
;;		line 666 in file "main.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1   11[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writeDataToEEPROM
;;		_writeMasterPasswordToEEPROM
;;		_ReadMasterPasswordFromEEPROM
;; This function uses a non-reentrant model
;;
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	666
global __ptext19
__ptext19:
psect	text19
	file	"main.c"
	line	666
	
_EEPROM_Read:
;incstack = 0
	callstack 26
	movwf	((c:EEPROM_Read@addr))^00h,c
	line	668
	
l2118:
	movff	(c:EEPROM_Read@addr),(c:4009)	;volatile
	line	669
	
l2120:
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	670
	
l2122:
	bsf	((c:4006))^0f00h,c,0	;volsfr
	line	672
	
l2124:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	673
	
l198:
	return	;funcret
	callstack 0
GLOBAL	__end_of_EEPROM_Read
	__end_of_EEPROM_Read:
	signat	_EEPROM_Read,4217
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
;;		On entry : 3F/0
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
psect	text20,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	20
global __ptext20
__ptext20:
psect	text20
	file	"i2c.c"
	line	20
	
_I2C2_Init:
;incstack = 0
	callstack 28
	line	21
	
l1494:; BSR set to: 0

	bsf	((c:3988))^0f00h,c,4	;volatile
	line	22
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	25
	movlb	15	; () banked
	bcf	((3898))&0ffh,3	;volatile
	line	26
	bcf	((3898))&0ffh,4	;volatile
	line	28
	
l1496:; BSR set to: 15

	movlw	low(080h)
	movwf	((c:4039))^0f00h,c	;volatile
	line	37
	movlw	low(028h)
	movwf	((c:4038))^0f00h,c	;volatile
	line	38
	movlw	low(09Fh)
	movwf	((c:4040))^0f00h,c	;volatile
	line	39
	
l252:; BSR set to: 15

	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Init
	__end_of_I2C2_Init:
	signat	_I2C2_Init,89
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 200 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  receivedChar    1   10[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_processRequest
;; This function is called by:
;;		Interrupt level 2
;; This function uses a non-reentrant model
;;
psect	intcode,class=CODE,space=0,reloc=2
	file	"output.as"
	line	#
global __pintcode
__pintcode:
psect	intcode
	file	"main.c"
	line	200
	
_isr:; BSR set to: 15

;incstack = 0
	callstack 25
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	movff	fsr1l+0,??_isr+0
	movff	fsr1h+0,??_isr+1
	movff	fsr2l+0,??_isr+2
	movff	fsr2h+0,??_isr+3
	line	203
	
i2l2026:
	btfss	((c:3998))^0f00h,c,5	;volatile
	goto	i2u90_41
	goto	i2u90_40
i2u90_41:
	goto	i2l126
i2u90_40:
	line	205
	
i2l2028:
	movff	(c:4014),(c:isr@receivedChar)	;volatile
	line	206
	bcf	((c:3997))^0f00h,c,5	;volatile
	line	211
	
i2l2030:
	movlb	0	; () banked
	movf	(0+(_receiveData+033h))&0ffh,w
	btfss	status,2
	goto	i2u91_41
	goto	i2u91_40
i2u91_41:
	goto	i2l2046
i2u91_40:
	line	215
	
i2l2032:; BSR set to: 0

		movlw	58
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u92_41
	goto	i2u92_40

i2u92_41:
	goto	i2l2038
i2u92_40:
	
i2l2034:; BSR set to: 0

	movf	((c:_start_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u93_41
	goto	i2u93_40
i2u93_41:
	goto	i2l2038
i2u93_40:
	line	218
	
i2l2036:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_start_sequence_flag))^00h,c
	line	219
	goto	i2l2086
	line	220
	
i2l2038:; BSR set to: 0

		movlw	35
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u94_41
	goto	i2u94_40

i2u94_41:
	goto	i2l2044
i2u94_40:
	
i2l2040:; BSR set to: 0

		decf	((c:_start_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u95_41
	goto	i2u95_40

i2u95_41:
	goto	i2l2044
i2u95_40:
	line	223
	
i2l2042:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_receiveData+033h))&0ffh
	line	224
	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	227
	movlw	low(0)
	movwf	((c:_start_sequence_flag))^00h,c
	line	228
	goto	i2l2086
	line	231
	
i2l2044:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_start_sequence_flag))^00h,c
	goto	i2l2086
	line	238
	
i2l2046:; BSR set to: 0

		movlw	13
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u96_41
	goto	i2u96_40

i2u96_41:
	goto	i2l2052
i2u96_40:
	
i2l2048:; BSR set to: 0

	movf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u97_41
	goto	i2u97_40
i2u97_41:
	goto	i2l2052
i2u97_40:
	line	240
	
i2l2050:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_end_sequence_flag))^00h,c
	line	241
	goto	i2l2086
	line	242
	
i2l2052:; BSR set to: 0

		movlw	10
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u98_41
	goto	i2u98_40

i2u98_41:
	goto	i2l2070
i2u98_40:
	
i2l2054:; BSR set to: 0

		decf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u99_41
	goto	i2u99_40

i2u99_41:
	goto	i2l2070
i2u99_40:
	line	246
	
i2l2056:; BSR set to: 0

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	
i2l2058:; BSR set to: 0

	incf	(0+(_receiveData+032h))&0ffh
	line	249
	
i2l2060:; BSR set to: 0

	call	_processRequest	;wreg free
	line	252
	
i2l2062:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	253
	
i2l2064:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_receiveData+033h))&0ffh
	line	254
	
i2l2066:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_interrupt_flag))^00h,c
	line	257
	
i2l2068:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_end_sequence_flag))^00h,c
	line	258
	goto	i2l2086
	line	264
	
i2l2070:; BSR set to: 0

		movlw	032h-0
	cpfslt	(0+(_receiveData+032h))&0ffh
	goto	i2u100_41
	goto	i2u100_40

i2u100_41:
	goto	i2l2084
i2u100_40:
	line	266
	
i2l2072:; BSR set to: 0

		decf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u101_41
	goto	i2u101_40

i2u101_41:
	goto	i2l2080
i2u101_40:
	line	269
	
i2l2074:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_end_sequence_flag))^00h,c
	line	272
	
i2l2076:; BSR set to: 0

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0Dh)
	movwf	indf2
	
i2l2078:; BSR set to: 0

	incf	(0+(_receiveData+032h))&0ffh
	line	275
	
i2l2080:; BSR set to: 0

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:isr@receivedChar),indf2

	
i2l2082:; BSR set to: 0

	incf	(0+(_receiveData+032h))&0ffh
	line	276
	goto	i2l2086
	line	280
	
i2l2084:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	289
	
i2l2086:; BSR set to: 0

	bsf	((c:3997))^0f00h,c,5	;volatile
	line	291
	
i2l126:
	movff	??_isr+3,fsr2h+0
	movff	??_isr+2,fsr2l+0
	movff	??_isr+1,fsr1h+0
	movff	??_isr+0,fsr1l+0
	bcf int$flags,1,c ;clear compiler interrupt flag (level 2)
	retfie f
	callstack 0
GLOBAL	__end_of_isr
	__end_of_isr:
	signat	_isr,89
	global	_processRequest

;; *************** function _processRequest *****************
;; Defined at:
;;		line 298 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buffer_index    2    4[COMRAM] unsigned int 
;;  length_index    2    2[COMRAM] unsigned int 
;;  i               2    0[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 3F/0
;;		On exit  : 3F/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         6       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         6       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	298
global __ptext22
__ptext22:
psect	text22
	file	"main.c"
	line	298
	
_processRequest:
;incstack = 0
	callstack 25
	line	300
	
i2l1946:; BSR set to: 0

	line	301
	movlw	high(0)
	movwf	((c:processRequest@length_index+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@length_index))^00h,c
	line	302
	movlw	high(0)
	movwf	((c:processRequest@i+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@i))^00h,c
	line	304
	
i2l1948:; BSR set to: 0

	movff	(_requestBuffer),(_request_unit)
	line	305
	
i2l1950:; BSR set to: 0

	movff	0+(_requestBuffer+01h),0+(_request_unit+01h)
	line	307
	
i2l1952:; BSR set to: 0

		movlw	2
	xorwf	(0+(_request_unit+01h))&0ffh,w
	btfsc	status,2
	goto	i2u81_41
	goto	i2u81_40

i2u81_41:
	goto	i2l129
i2u81_40:
	line	309
	
i2l1954:; BSR set to: 0

	movlw	high(0)
	movwf	((c:processRequest@buffer_index+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@buffer_index))^00h,c
	goto	i2l1962
	line	311
	
i2l1956:; BSR set to: 0

	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_requestBuffer+02h)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	line	314
	
i2l1958:; BSR set to: 0

	movlw	low(02h)
	addwf	((c:processRequest@buffer_index))^00h,c,w
	movwf	((c:processRequest@length_index))^00h,c
	movlw	high(02h)
	addwfc	((c:processRequest@buffer_index+1))^00h,c,w
	movwf	1+((c:processRequest@length_index))^00h,c
	line	309
	
i2l1960:; BSR set to: 0

	infsnz	((c:processRequest@buffer_index))^00h,c
	incf	((c:processRequest@buffer_index+1))^00h,c
	
i2l1962:; BSR set to: 0

	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_requestBuffer+02h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	i2u82_41
	goto	i2u82_40
i2u82_41:
	goto	i2l1956
i2u82_40:
	
i2l132:; BSR set to: 0

	line	318
	movff	(c:processRequest@length_index),0+(_request_unit+02h)
	movff	(c:processRequest@length_index+1),1+(_request_unit+02h)
	line	319
	goto	i2l134
	
i2l129:; BSR set to: 0

	line	322
	movff	0+(_requestBuffer+02h),0+(_request_unit+04h)
	line	323
	movff	0+(_requestBuffer+03h),0+(_request_unit+05h)
	line	329
	
i2l134:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_processRequest
	__end_of_processRequest:
	signat	_processRequest,89
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	db 0	; dummy byte at the end
	global	__smallconst
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	2
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
