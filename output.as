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
	FNCALL	_main,_storeLookUpEntries
	FNCALL	_storeLookUpEntries,_readByteAT24_EEPROM
	FNCALL	_createResponse,_FormatDrive
	FNCALL	_createResponse,_ReadCredentials
	FNCALL	_createResponse,_ReadLookupEntries
	FNCALL	_createResponse,_createPingResponse
	FNCALL	_createResponse,_isPasswordMatched
	FNCALL	_createResponse,_sendResponse
	FNCALL	_createResponse,_writeDataToEEPROM
	FNCALL	_createResponse,_writeMasterPasswordToEEPROM
	FNCALL	_writeMasterPasswordToEEPROM,_EEPROM_Read
	FNCALL	_writeMasterPasswordToEEPROM,_EEPROM_Write
	FNCALL	_writeDataToEEPROM,_EEPROM_Read
	FNCALL	_writeDataToEEPROM,_EEPROM_Write
	FNCALL	_writeDataToEEPROM,_writeByteAT24_EEPROM
	FNCALL	_sendResponse,_UART_TransmitChar
	FNCALL	_isPasswordMatched,_UART_TransmitChar
	FNCALL	_ReadLookupEntries,_UART_TransmitChar
	FNCALL	_ReadCredentials,_UART_TransmitChar
	FNCALL	_ReadCredentials,_readByteAT24_EEPROM
	FNCALL	_readByteAT24_EEPROM,_I2C2_Read
	FNCALL	_readByteAT24_EEPROM,_I2C2_Send
	FNCALL	_readByteAT24_EEPROM,_I2C2_Start
	FNCALL	_readByteAT24_EEPROM,_I2C2_Stop
	FNCALL	_FormatDrive,_EEPROM_Write
	FNCALL	_FormatDrive,_UART_TransmitChar
	FNCALL	_FormatDrive,_writeByteAT24_EEPROM
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Send
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Start
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Stop
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
	line	117

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
	line	39

;initializer for _timeout
	dw	(03E8h)&0ffffh
	line	47

;initializer for _isPasswordSet
	db	low(01h)
	line	46

;initializer for _checkAck
	db	low(01h)
	global	_master
	global	_at24_eeprom_address
	global	_exception_code
	global	_isExceptionRaised
	global	_end_sequence_flag
	global	_start_sequence_flag
	global	_interrupt_flag
	global	_LOOKUP_SECTION_CACHE
	global	_request_unit
	global	_responseBuffer
	global	_requestBuffer
	global	_receiveData
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
	line	117
	global	_digits
	global	_digits
_digits:
       ds      10
psect	dataCOMRAM
	file	"main.c"
	line	39
	global	_timeout
	global	_timeout
_timeout:
       ds      2
psect	dataCOMRAM
	file	"main.c"
	line	47
	global	_isPasswordSet
_isPasswordSet:
       ds      1
psect	dataCOMRAM
	file	"main.c"
	line	46
	global	_checkAck
_checkAck:
       ds      1
psect	bssBANK0,class=BANK0,space=1,noexec,lowdata
global __pbssBANK0
__pbssBANK0:
	global	_request_unit
_request_unit:
       ds      52
	global	_responseBuffer
_responseBuffer:
       ds      50
	global	_requestBuffer
_requestBuffer:
       ds      50
psect	bssBANK1,class=BANK1,space=1,noexec,lowdata
global __pbssBANK1
__pbssBANK1:
	global	_receiveData
_receiveData:
       ds      52
psect	bssBIGRAM,class=BIGRAM,space=1,noexec
global __pbssBIGRAM
__pbssBIGRAM:
	global	_LOOKUP_SECTION_CACHE
_LOOKUP_SECTION_CACHE:
       ds      400
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
; Clear objects allocated to BIGRAM (400 bytes)
	global __pbssBIGRAM
lfsr	0,__pbssBIGRAM
lfsr	1,400
clear_0:
clrf	postinc0,c
movf	postdec1,w
movf	fsr1l,w
bnz	clear_0
movf	fsr1h,w
bnz	clear_0
; Clear objects allocated to BANK1 (52 bytes)
	global __pbssBANK1
lfsr	0,__pbssBANK1
movlw	52
clear_1:
clrf	postinc0,c
decf	wreg
bnz	clear_1
; Clear objects allocated to BANK0 (152 bytes)
	global __pbssBANK0
lfsr	0,__pbssBANK0
movlw	152
clear_2:
clrf	postinc0,c
decf	wreg
bnz	clear_2
; Clear objects allocated to COMRAM (16 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	16
clear_3:
clrf	postinc0,c
decf	wreg
bnz	clear_3
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
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_processRequest:	; 1 bytes @ 0x0
??_processRequest:	; 1 bytes @ 0x0
?_createPingResponse:	; 1 bytes @ 0x0
?_writeDataToEEPROM:	; 1 bytes @ 0x0
?_ReadCredentials:	; 1 bytes @ 0x0
?_ReadLookupEntries:	; 1 bytes @ 0x0
?_FormatDrive:	; 1 bytes @ 0x0
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
?_storeLookUpEntries:	; 1 bytes @ 0x0
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
??_ReadLookupEntries:	; 1 bytes @ 0xC
??_isPasswordMatched:	; 1 bytes @ 0xC
??_sendResponse:	; 1 bytes @ 0xC
?_writeByteAT24_EEPROM:	; 1 bytes @ 0xC
??_EEPROM_Write:	; 1 bytes @ 0xC
?_readByteAT24_EEPROM:	; 1 bytes @ 0xC
??_ReadMasterPasswordFromEEPROM:	; 1 bytes @ 0xC
	global	writeByteAT24_EEPROM@address
writeByteAT24_EEPROM@address:	; 2 bytes @ 0xC
	global	readByteAT24_EEPROM@address
readByteAT24_EEPROM@address:	; 2 bytes @ 0xC
	global	ReadLookupEntries@index
ReadLookupEntries@index:	; 2 bytes @ 0xC
	ds   1
	global	sendResponse@isExceptionOccurred
sendResponse@isExceptionOccurred:	; 1 bytes @ 0xD
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
	global	isPasswordMatched@payload_length
isPasswordMatched@payload_length:	; 1 bytes @ 0xE
	global	sendResponse@index
sendResponse@index:	; 2 bytes @ 0xE
	ds   1
??_writeDataToEEPROM:	; 1 bytes @ 0xF
??_ReadCredentials:	; 1 bytes @ 0xF
??_FormatDrive:	; 1 bytes @ 0xF
??_writeMasterPasswordToEEPROM:	; 1 bytes @ 0xF
??_writeByteAT24_EEPROM:	; 1 bytes @ 0xF
??_storeLookUpEntries:	; 1 bytes @ 0xF
??___fttol:	; 1 bytes @ 0xF
	global	ReadMasterPasswordFromEEPROM@password_length
ReadMasterPasswordFromEEPROM@password_length:	; 1 bytes @ 0xF
	global	isPasswordMatched@matchFlag
isPasswordMatched@matchFlag:	; 1 bytes @ 0xF
	global	storeLookUpEntries@section_start
storeLookUpEntries@section_start:	; 2 bytes @ 0xF
	ds   1
	global	ReadMasterPasswordFromEEPROM@index
ReadMasterPasswordFromEEPROM@index:	; 1 bytes @ 0x10
	global	isPasswordMatched@index
isPasswordMatched@index:	; 1 bytes @ 0x10
	ds   1
	global	writeDataToEEPROM@at24_eep_addr_H
writeDataToEEPROM@at24_eep_addr_H:	; 1 bytes @ 0x11
	global	writeMasterPasswordToEEPROM@last_byte_addr
writeMasterPasswordToEEPROM@last_byte_addr:	; 1 bytes @ 0x11
	global	ReadCredentials@payload_length
ReadCredentials@payload_length:	; 1 bytes @ 0x11
	global	FormatDrive@mask_data
FormatDrive@mask_data:	; 1 bytes @ 0x11
	global	storeLookUpEntries@i
storeLookUpEntries@i:	; 2 bytes @ 0x11
	ds   1
	global	writeDataToEEPROM@at24_eep_addr_L
writeDataToEEPROM@at24_eep_addr_L:	; 1 bytes @ 0x12
	global	writeMasterPasswordToEEPROM@last_byte_data
writeMasterPasswordToEEPROM@last_byte_data:	; 1 bytes @ 0x12
	global	ReadCredentials@last_char_index
ReadCredentials@last_char_index:	; 1 bytes @ 0x12
	global	FormatDrive@index
FormatDrive@index:	; 2 bytes @ 0x12
	ds   1
	global	writeDataToEEPROM@at24_eep_lookup_addr_H
writeDataToEEPROM@at24_eep_lookup_addr_H:	; 1 bytes @ 0x13
	global	writeMasterPasswordToEEPROM@payload_length
writeMasterPasswordToEEPROM@payload_length:	; 1 bytes @ 0x13
	global	ReadCredentials@START_ADDR
ReadCredentials@START_ADDR:	; 2 bytes @ 0x13
	ds   1
	global	writeDataToEEPROM@at24_eep_lookup_addr_L
writeDataToEEPROM@at24_eep_lookup_addr_L:	; 1 bytes @ 0x14
	global	writeMasterPasswordToEEPROM@pic_eeprom_addr
writeMasterPasswordToEEPROM@pic_eeprom_addr:	; 1 bytes @ 0x14
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x14
	ds   1
	global	writeMasterPasswordToEEPROM@index
writeMasterPasswordToEEPROM@index:	; 1 bytes @ 0x15
	global	writeDataToEEPROM@payload_length
writeDataToEEPROM@payload_length:	; 2 bytes @ 0x15
	global	ReadCredentials@ADDR
ReadCredentials@ADDR:	; 2 bytes @ 0x15
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x15
	ds   2
	global	ReadCredentials@response_index
ReadCredentials@response_index:	; 1 bytes @ 0x17
	global	writeDataToEEPROM@i
writeDataToEEPROM@i:	; 2 bytes @ 0x17
	ds   1
	global	ReadCredentials@index
ReadCredentials@index:	; 1 bytes @ 0x18
	ds   1
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x19
	global	writeDataToEEPROM@at24_eeprom_addr_start
writeDataToEEPROM@at24_eeprom_addr_start:	; 2 bytes @ 0x19
	global	ReadCredentials@credential_length
ReadCredentials@credential_length:	; 2 bytes @ 0x19
	ds   1
??_UART_Init:	; 1 bytes @ 0x1A
	global	UART_Init@temp
UART_Init@temp:	; 3 bytes @ 0x1A
	ds   1
	global	writeDataToEEPROM@at24_eep_lookup_addr
writeDataToEEPROM@at24_eep_lookup_addr:	; 2 bytes @ 0x1B
	global	ReadCredentials@i
ReadCredentials@i:	; 2 bytes @ 0x1B
	ds   2
??_createResponse:	; 1 bytes @ 0x1D
	global	createResponse@CODE
createResponse@CODE:	; 1 bytes @ 0x1D
	ds   1
??_main:	; 1 bytes @ 0x1E
	ds   2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        14
;!    BSS         620
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     32      62
;!    BANK0           160      0     152
;!    BANK1           256      0      52
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
;!    _main->_createResponse
;!    _storeLookUpEntries->_readByteAT24_EEPROM
;!    _createResponse->_ReadCredentials
;!    _createResponse->_writeDataToEEPROM
;!    _writeMasterPasswordToEEPROM->_EEPROM_Write
;!    _writeDataToEEPROM->_EEPROM_Write
;!    _writeDataToEEPROM->_writeByteAT24_EEPROM
;!    _sendResponse->_UART_TransmitChar
;!    _isPasswordMatched->_UART_TransmitChar
;!    _ReadLookupEntries->_UART_TransmitChar
;!    _ReadCredentials->_readByteAT24_EEPROM
;!    _readByteAT24_EEPROM->_I2C2_Send
;!    _FormatDrive->_EEPROM_Write
;!    _FormatDrive->_writeByteAT24_EEPROM
;!    _writeByteAT24_EEPROM->_I2C2_Send
;!    _UART_Init->___fttol
;!    _ReadMasterPasswordFromEEPROM->_EEPROM_Read
;!
;!Critical Paths under _isr in COMRAM
;!
;!    _isr->_processRequest
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0    6992
;!                                             30 COMRAM     2     2      0
;!                          _I2C2_Init
;!       _ReadMasterPasswordFromEEPROM
;!                          _UART_Init
;!                     _createResponse
;!                 _storeLookUpEntries
;! ---------------------------------------------------------------------------------
;! (1) _storeLookUpEntries                                   4     4      0     432
;!                                             15 COMRAM     4     4      0
;!                _readByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (1) _createResponse                                       1     1      0    6005
;!                                             29 COMRAM     1     1      0
;!                        _FormatDrive
;!                    _ReadCredentials
;!                  _ReadLookupEntries
;!                 _createPingResponse
;!                  _isPasswordMatched
;!                       _sendResponse
;!                  _writeDataToEEPROM
;!        _writeMasterPasswordToEEPROM
;! ---------------------------------------------------------------------------------
;! (2) _writeMasterPasswordToEEPROM                          7     7      0     949
;!                                             15 COMRAM     7     7      0
;!                        _EEPROM_Read
;!                       _EEPROM_Write
;! ---------------------------------------------------------------------------------
;! (2) _writeDataToEEPROM                                   15    15      0    1984
;!                                             15 COMRAM    14    14      0
;!                        _EEPROM_Read
;!                       _EEPROM_Write
;!               _writeByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (2) _sendResponse                                         4     4      0     205
;!                                             12 COMRAM     4     4      0
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (2) _isPasswordMatched                                    5     5      0     183
;!                                             12 COMRAM     5     5      0
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (2) _createPingResponse                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _ReadLookupEntries                                    2     2      0      90
;!                                             12 COMRAM     2     2      0
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (2) _ReadCredentials                                     14    14      0     889
;!                                             15 COMRAM    14    14      0
;!                  _UART_TransmitChar
;!                _readByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (2) _readByteAT24_EEPROM                                  3     1      2     319
;!                                             12 COMRAM     3     1      2
;!                          _I2C2_Read
;!                          _I2C2_Send
;!                         _I2C2_Start
;!                          _I2C2_Stop
;! ---------------------------------------------------------------------------------
;! (3) _I2C2_Read                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _FormatDrive                                          5     5      0    1660
;!                                             15 COMRAM     5     5      0
;!                       _EEPROM_Write
;!                  _UART_TransmitChar
;!               _writeByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (3) _writeByteAT24_EEPROM                                 3     0      3     849
;!                                             12 COMRAM     3     0      3
;!                          _I2C2_Send
;!                         _I2C2_Start
;!                          _I2C2_Stop
;! ---------------------------------------------------------------------------------
;! (3) _I2C2_Stop                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _I2C2_Start                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _I2C2_Send                                            1     1      0      22
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (3) _UART_TransmitChar                                    1     1      0      22
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (3) _EEPROM_Write                                         4     3      1     652
;!                                             11 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (1) _UART_Init                                            3     3      0     351
;!                                             26 COMRAM     3     3      0
;!                            ___fttol
;! ---------------------------------------------------------------------------------
;! (2) ___fttol                                             15    11      4     328
;!                                             11 COMRAM    15    11      4
;! ---------------------------------------------------------------------------------
;! (1) _ReadMasterPasswordFromEEPROM                         5     5      0     204
;!                                             12 COMRAM     5     5      0
;!                        _EEPROM_Read
;! ---------------------------------------------------------------------------------
;! (3) _EEPROM_Read                                          1     1      0      22
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (1) _I2C2_Init                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
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
;!     _FormatDrive
;!       _EEPROM_Write
;!       _UART_TransmitChar
;!       _writeByteAT24_EEPROM
;!         _I2C2_Send
;!         _I2C2_Start
;!         _I2C2_Stop
;!     _ReadCredentials
;!       _UART_TransmitChar
;!       _readByteAT24_EEPROM
;!         _I2C2_Read
;!         _I2C2_Send
;!         _I2C2_Start
;!         _I2C2_Stop
;!     _ReadLookupEntries
;!       _UART_TransmitChar
;!     _createPingResponse
;!     _isPasswordMatched
;!       _UART_TransmitChar
;!     _sendResponse
;!       _UART_TransmitChar
;!     _writeDataToEEPROM
;!       _EEPROM_Read
;!       _EEPROM_Write
;!       _writeByteAT24_EEPROM
;!     _writeMasterPasswordToEEPROM
;!       _EEPROM_Read
;!       _EEPROM_Write
;!   _storeLookUpEntries
;!     _readByteAT24_EEPROM
;!
;! _isr (ROOT)
;!   _processRequest
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             5FF      0     190      27       26.1%
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
;!BANK1              100      0      34       6       20.3%
;!BITBANK0            A0      0       0       3        0.0%
;!BANK0               A0      0      98       4       95.0%
;!BITCOMRAM           5E      0       0       0        0.0%
;!COMRAM              5E     20      3E       1       66.0%
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
;!ABS                  0      0     10A      26        0.0%
;!DATA                 0      0     29A      28        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 967 in file "main.c"
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
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_I2C2_Init
;;		_ReadMasterPasswordFromEEPROM
;;		_UART_Init
;;		_createResponse
;;		_storeLookUpEntries
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	967
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	967
	
_main:
;incstack = 0
	callstack 25
	line	970
	
l2307:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	971
	movlw	low(0C0h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	986
	
l2309:
	call	_UART_Init	;wreg free
	line	987
	
l2311:
	call	_I2C2_Init	;wreg free
	line	988
	
l2313:; BSR set to: 15

	call	_ReadMasterPasswordFromEEPROM	;wreg free
	line	989
	
l2315:
	asmopt push
asmopt off
movlw  9
movwf	(??_main+0+0+1)^00h,c
movlw	30
movwf	(??_main+0+0)^00h,c
	movlw	228
u1157:
decfsz	wreg,f
	bra	u1157
	decfsz	(??_main+0+0)^00h,c,f
	bra	u1157
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u1157
	nop2
asmopt pop

	line	990
	
l2317:
	call	_storeLookUpEntries	;wreg free
	line	991
	
l2319:
	asmopt push
asmopt off
movlw  9
movwf	(??_main+0+0+1)^00h,c
movlw	30
movwf	(??_main+0+0)^00h,c
	movlw	228
u1167:
decfsz	wreg,f
	bra	u1167
	decfsz	(??_main+0+0)^00h,c,f
	bra	u1167
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u1167
	nop2
asmopt pop

	line	995
	
l2321:
	movf	((c:_interrupt_flag))^00h,c,w
	btfsc	status,2
	goto	u1141
	goto	u1140
u1141:
	goto	l2321
u1140:
	line	997
	
l2323:
	call	_createResponse	;wreg free
	line	998
	
l2325:
	movlw	low(0)
	movwf	((c:_interrupt_flag))^00h,c
	goto	l2321
	global	start
	goto	start
	callstack 0
	line	1001
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_storeLookUpEntries

;; *************** function _storeLookUpEntries *****************
;; Defined at:
;;		line 878 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   17[COMRAM] unsigned int 
;;  section_star    2   15[COMRAM] unsigned short 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/F
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5
;;      Params:         0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_readByteAT24_EEPROM
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	878
global __ptext1
__ptext1:
psect	text1
	file	"main.c"
	line	878
	
_storeLookUpEntries:
;incstack = 0
	callstack 26
	line	879
	
l2233:
	movlw	high(07800h)
	movwf	((c:storeLookUpEntries@section_start+1))^00h,c
	movlw	low(07800h)
	movwf	((c:storeLookUpEntries@section_start))^00h,c
	line	881
	movlw	high(0)
	movwf	((c:storeLookUpEntries@i+1))^00h,c
	movlw	low(0)
	movwf	((c:storeLookUpEntries@i))^00h,c
	line	882
	
l2239:
	movlw	low(_LOOKUP_SECTION_CACHE)
	addwf	((c:storeLookUpEntries@i))^00h,c,w
	movwf	c:fsr2l
	movlw	high(_LOOKUP_SECTION_CACHE)
	addwfc	((c:storeLookUpEntries@i+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	((c:storeLookUpEntries@i))^00h,c,w
	addwf	((c:storeLookUpEntries@section_start))^00h,c,w
	movwf	((c:readByteAT24_EEPROM@address))^00h,c
	movf	((c:storeLookUpEntries@i+1))^00h,c,w
	addwfc	((c:storeLookUpEntries@section_start+1))^00h,c,w
	movwf	1+((c:readByteAT24_EEPROM@address))^00h,c
	call	_readByteAT24_EEPROM	;wreg free
	movwf	indf2,c

	line	881
	
l2241:
	infsnz	((c:storeLookUpEntries@i))^00h,c
	incf	((c:storeLookUpEntries@i+1))^00h,c
	
l2243:
		movlw	144
	subwf	 ((c:storeLookUpEntries@i))^00h,c,w
	movlw	1
	subwfb	((c:storeLookUpEntries@i+1))^00h,c,w
	btfss	status,0
	goto	u1011
	goto	u1010

u1011:
	goto	l2239
u1010:
	line	883
	
l231:
	return	;funcret
	callstack 0
GLOBAL	__end_of_storeLookUpEntries
	__end_of_storeLookUpEntries:
	signat	_storeLookUpEntries,89
	global	_createResponse

;; *************** function _createResponse *****************
;; Defined at:
;;		line 358 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  CODE            1   29[COMRAM] unsigned char 
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
;;		_FormatDrive
;;		_ReadCredentials
;;		_ReadLookupEntries
;;		_createPingResponse
;;		_isPasswordMatched
;;		_sendResponse
;;		_writeDataToEEPROM
;;		_writeMasterPasswordToEEPROM
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	line	358
global __ptext2
__ptext2:
psect	text2
	file	"main.c"
	line	358
	
_createResponse:
;incstack = 0
	callstack 25
	line	360
	
l2167:
	movff	0+(_request_unit+01h),(c:createResponse@CODE)
	line	364
	
l2169:
	movf	((c:_isPasswordSet))^00h,c,w
	btfss	status,2
	goto	u941
	goto	u940
u941:
	goto	l2173
u940:
	line	366
	
l2171:
	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	367
	movlw	low(03h)
	movwf	((c:_exception_code))^00h,c
	line	371
	
l2173:
		movlw	33
	movlb	0	; () banked
	xorwf	((_request_unit))&0ffh,w
	btfss	status,2
	goto	u951
	goto	u950

u951:
	goto	l2199
u950:
	line	373
	
l2175:; BSR set to: 0

	movf	((c:_isExceptionRaised))^00h,c,w
	btfsc	status,2
	goto	u961
	goto	u960
u961:
	goto	l2197
u960:
	
l2177:; BSR set to: 0

		movlw	18
	xorwf	((c:createResponse@CODE))^00h,c,w
	btfss	status,2
	goto	u971
	goto	u970

u971:
	goto	l2201
u970:
	goto	l2197
	line	379
	
l2179:; BSR set to: 0

	call	_createPingResponse	;wreg free
	line	380
	goto	l2201
	line	382
	
l2181:; BSR set to: 0

	call	_writeDataToEEPROM	;wreg free
	line	383
	goto	l2201
	line	385
	
l2183:; BSR set to: 0

	call	_ReadCredentials	;wreg free
	line	386
	goto	l2201
	line	388
	
l2185:; BSR set to: 0

	call	_ReadLookupEntries	;wreg free
	line	389
	goto	l2201
	line	391
	
l2187:; BSR set to: 0

	call	_FormatDrive	;wreg free
	line	392
	goto	l2201
	line	394
	
l2189:; BSR set to: 0

	call	_writeMasterPasswordToEEPROM	;wreg free
	line	395
	goto	l2201
	line	397
	
l2191:; BSR set to: 0

	call	_isPasswordMatched	;wreg free
	iorlw	0
	btfss	status,2
	goto	u981
	goto	u980
u981:
	goto	l145
u980:
	line	399
	
l2193:
	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	400
	movlw	low(04h)
	movwf	((c:_exception_code))^00h,c
	goto	l2201
	line	376
	
l2197:; BSR set to: 0

	movf	((c:createResponse@CODE))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 7, Range of values is 1 to 19
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l2181
	xorlw	2^1	; case 2
	skipnz
	goto	l2183
	xorlw	3^2	; case 3
	skipnz
	goto	l2185
	xorlw	16^3	; case 16
	skipnz
	goto	l2187
	xorlw	17^16	; case 17
	skipnz
	goto	l2179
	xorlw	18^17	; case 18
	skipnz
	goto	l2189
	xorlw	19^18	; case 19
	skipnz
	goto	l2191
	goto	l145

	line	406
	
l145:
	line	407
	goto	l2201
	line	409
	
l2199:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	410
	movlw	low(06h)
	movwf	((c:_exception_code))^00h,c
	line	414
	
l2201:
	movf	((c:_isExceptionRaised))^00h,c,w
	
	call	_sendResponse
	line	415
	
l160:
	return	;funcret
	callstack 0
GLOBAL	__end_of_createResponse
	__end_of_createResponse:
	signat	_createResponse,89
	global	_writeMasterPasswordToEEPROM

;; *************** function _writeMasterPasswordToEEPROM *****************
;; Defined at:
;;		line 556 in file "main.c"
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
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	line	556
global __ptext3
__ptext3:
psect	text3
	file	"main.c"
	line	556
	
_writeMasterPasswordToEEPROM:
;incstack = 0
	callstack 26
	line	558
	
l1963:
	line	559
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@index))^00h,c
	line	561
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_addr))^00h,c
	line	562
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_data))^00h,c
	line	564
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c
	line	566
	
l1965:
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeMasterPasswordToEEPROM@payload_length))^00h,c
	line	574
	
l1967:; BSR set to: 0

		movlw	09h-1
	cpfsgt	((c:writeMasterPasswordToEEPROM@payload_length))^00h,c
	goto	u751
	goto	u750

u751:
	goto	l1973
u750:
	line	576
	
l1969:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	577
	movlw	low(05h)
	movwf	((c:_exception_code))^00h,c
	goto	l177
	line	584
	
l1973:; BSR set to: 0

	asmopt push
asmopt off
movlw  82
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	0
u1177:
decfsz	wreg,f
	bra	u1177
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1177
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1177
	nop2
asmopt pop

	line	585
	
l1975:
	movff	(c:writeMasterPasswordToEEPROM@payload_length),(c:EEPROM_Write@eep_data)
	movlw	(0)&0ffh
	
	call	_EEPROM_Write
	line	586
	
l1977:
	asmopt push
asmopt off
movlw  82
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	0
u1187:
decfsz	wreg,f
	bra	u1187
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1187
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1187
	nop2
asmopt pop

	line	589
	
l1979:
	incf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c
	line	592
	
l1981:
	movlw	low(0)
	movwf	((c:writeMasterPasswordToEEPROM@index))^00h,c
	goto	l1993
	line	594
	
l1983:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	127
u1197:
decfsz	wreg,f
	bra	u1197
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1197
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1197
	nop
asmopt pop

	line	595
	
l1985:
	movf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:EEPROM_Write@eep_data))^00h,c
	movf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c,w
	addwf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	
	call	_EEPROM_Write
	line	596
	
l1987:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	127
u1207:
decfsz	wreg,f
	bra	u1207
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1207
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1207
	nop
asmopt pop

	line	598
	
l1989:
	movf	((c:writeMasterPasswordToEEPROM@pic_eeprom_addr))^00h,c,w
	addwf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_addr))^00h,c
	line	592
	
l1991:
	incf	((c:writeMasterPasswordToEEPROM@index))^00h,c
	
l1993:
		movf	((c:writeMasterPasswordToEEPROM@payload_length))^00h,c,w
	subwf	((c:writeMasterPasswordToEEPROM@index))^00h,c,w
	btfss	status,0
	goto	u761
	goto	u760

u761:
	goto	l1983
u760:
	line	601
	
l1995:
	asmopt push
asmopt off
movlw  9
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	30
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	228
u1217:
decfsz	wreg,f
	bra	u1217
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1217
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1217
	nop2
asmopt pop

	line	602
	
l1997:
	movf	((c:writeMasterPasswordToEEPROM@last_byte_addr))^00h,c,w
	
	call	_EEPROM_Read
	movwf	((c:writeMasterPasswordToEEPROM@last_byte_data))^00h,c
	line	603
	
l1999:
	asmopt push
asmopt off
movlw  9
movwf	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c
movlw	30
movwf	(??_writeMasterPasswordToEEPROM+0+0)^00h,c
	movlw	228
u1227:
decfsz	wreg,f
	bra	u1227
	decfsz	(??_writeMasterPasswordToEEPROM+0+0)^00h,c,f
	bra	u1227
	decfsz	(??_writeMasterPasswordToEEPROM+0+0+1)^00h,c,f
	bra	u1227
	nop2
asmopt pop

	line	605
	
l2001:
	movlw	low(0)
	movwf	((c:_isExceptionRaised))^00h,c
	line	609
	
l2003:
	movff	(_request_unit),(_responseBuffer)
	line	610
	
l2005:
	movff	0+(_request_unit+01h),0+(_responseBuffer+01h)
	line	611
	
l2007:
	movff	(c:writeMasterPasswordToEEPROM@last_byte_data),0+(_responseBuffer+02h)
	line	612
	
l177:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeMasterPasswordToEEPROM
	__end_of_writeMasterPasswordToEEPROM:
	signat	_writeMasterPasswordToEEPROM,89
	global	_writeDataToEEPROM

;; *************** function _writeDataToEEPROM *****************
;; Defined at:
;;		line 436 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   23[COMRAM] unsigned short 
;;  at24_eep_loo    2   27[COMRAM] unsigned short 
;;  at24_eeprom_    2   25[COMRAM] unsigned short 
;;  payload_leng    2   21[COMRAM] unsigned short 
;;  at24_eep_loo    1   20[COMRAM] unsigned char 
;;  at24_eep_loo    1   19[COMRAM] unsigned char 
;;  at24_eep_add    1   18[COMRAM] unsigned char 
;;  at24_eep_add    1   17[COMRAM] unsigned char 
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
;;      Locals:        12       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:        14       0       0       0       0       0       0
;;Total ram usage:       14 bytes
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
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	436
global __ptext4
__ptext4:
psect	text4
	file	"main.c"
	line	436
	
_writeDataToEEPROM:
;incstack = 0
	callstack 25
	line	439
	
l1781:
	line	440
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_addr_H))^00h,c
	line	441
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_addr_L))^00h,c
	line	443
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr_H))^00h,c
	line	444
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr_L))^00h,c
	line	446
	movlw	high(0)
	movwf	((c:writeDataToEEPROM@at24_eeprom_addr_start+1))^00h,c
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eeprom_addr_start))^00h,c
	line	447
	movlw	high(0)
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr+1))^00h,c
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c
	line	451
	
l1783:
	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:writeDataToEEPROM@at24_eep_addr_H))^00h,c
	line	452
	
l1785:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1237:
decfsz	wreg,f
	bra	u1237
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1237
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1237
	nop
asmopt pop

	line	453
	
l1787:
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:writeDataToEEPROM@at24_eep_addr_L))^00h,c
	line	457
	
l1789:
	movlw	(0Ch)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr_H))^00h,c
	line	458
	
l1791:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1247:
decfsz	wreg,f
	bra	u1247
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1247
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1247
	nop
asmopt pop

	line	459
	
l1793:
	movlw	(0Dh)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr_L))^00h,c
	line	462
	
l1795:
	movf	((c:writeDataToEEPROM@at24_eep_addr_L))^00h,c,w
	movff	(c:writeDataToEEPROM@at24_eep_addr_H),??_writeDataToEEPROM+0+0
	clrf	(??_writeDataToEEPROM+0+0+1)^00h,c
	movff	??_writeDataToEEPROM+0+0,??_writeDataToEEPROM+0+1
	clrf	(??_writeDataToEEPROM+0+0)^00h,c
	iorwf	(??_writeDataToEEPROM+0+0)^00h,c,w
	movwf	((c:_at24_eeprom_address))^00h,c
	movf	(??_writeDataToEEPROM+0+1)^00h,c,w
	movwf	1+((c:_at24_eeprom_address))^00h,c
	line	464
	
l1797:
	movf	((c:writeDataToEEPROM@at24_eep_lookup_addr_L))^00h,c,w
	movff	(c:writeDataToEEPROM@at24_eep_lookup_addr_H),??_writeDataToEEPROM+0+0
	clrf	(??_writeDataToEEPROM+0+0+1)^00h,c
	movff	??_writeDataToEEPROM+0+0,??_writeDataToEEPROM+0+1
	clrf	(??_writeDataToEEPROM+0+0)^00h,c
	iorwf	(??_writeDataToEEPROM+0+0)^00h,c,w
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c
	movf	(??_writeDataToEEPROM+0+1)^00h,c,w
	movwf	1+((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c
	line	467
	
l1799:
		incf	((c:_at24_eeprom_address))^00h,c,w
	bnz	u651
	incf	((c:_at24_eeprom_address+1))^00h,c,w
	btfss	status,2
	goto	u651
	goto	u650

u651:
	goto	l1803
u650:
	line	468
	
l1801:
	movlw	high(0)
	movwf	((c:_at24_eeprom_address+1))^00h,c
	movlw	low(0)
	movwf	((c:_at24_eeprom_address))^00h,c
	line	471
	
l1803:
		incf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c,w
	bnz	u661
	incf	((c:writeDataToEEPROM@at24_eep_lookup_addr+1))^00h,c,w
	btfss	status,2
	goto	u661
	goto	u660

u661:
	goto	l1807
u660:
	line	472
	
l1805:
	movlw	high(07800h)
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr+1))^00h,c
	movlw	low(07800h)
	movwf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c
	line	476
	
l1807:
	movff	(c:_at24_eeprom_address),(c:writeDataToEEPROM@at24_eeprom_addr_start)
	movff	(c:_at24_eeprom_address+1),(c:writeDataToEEPROM@at24_eeprom_addr_start+1)
	line	479
	
l1809:
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movf	((??_writeDataToEEPROM+0+0))^00h,c,w
	movwf	((c:writeDataToEEPROM@payload_length))^00h,c
	clrf	((c:writeDataToEEPROM@payload_length+1))^00h,c
	line	482
	
l1811:; BSR set to: 0

	movlw	low(077FFh)
	movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	high(077FFh)
	movwf	1+(??_writeDataToEEPROM+0+0)^00h,c
	movf	((c:_at24_eeprom_address))^00h,c,w
	subwf	(??_writeDataToEEPROM+0+0)^00h,c
	movf	((c:_at24_eeprom_address+1))^00h,c,w
	subwfb	(??_writeDataToEEPROM+0+1)^00h,c
		movf	(??_writeDataToEEPROM+0+0)^00h,c,w
	subwf	((c:writeDataToEEPROM@payload_length))^00h,c,w
	movf	(??_writeDataToEEPROM+0+1)^00h,c,w
	subwfb	((c:writeDataToEEPROM@payload_length+1))^00h,c,w
	btfss	status,0
	goto	u671
	goto	u670

u671:
	goto	l1817
u670:
	line	484
	
l1813:
	movlw	low(01h)
	movwf	((c:_isExceptionRaised))^00h,c
	line	485
	movlw	low(07h)
	movwf	((c:_exception_code))^00h,c
	goto	l169
	line	491
	
l1817:; BSR set to: 0

	movff	(c:_at24_eeprom_address),(c:writeByteAT24_EEPROM@address)
	movff	(c:_at24_eeprom_address+1),(c:writeByteAT24_EEPROM@address+1)
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeByteAT24_EEPROM@data))^00h,c
	call	_writeByteAT24_EEPROM	;wreg free
	line	492
	
l1819:
	infsnz	((c:_at24_eeprom_address))^00h,c
	incf	((c:_at24_eeprom_address+1))^00h,c
	line	494
	
l1821:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u1257:
decfsz	wreg,f
	bra	u1257
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1257
asmopt pop

	line	497
	
l1823:
	movlw	high(0)
	movwf	((c:writeDataToEEPROM@i+1))^00h,c
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@i))^00h,c
	goto	l1831
	line	499
	
l1825:
	movf	((c:writeDataToEEPROM@i))^00h,c,w
	addwf	((c:_at24_eeprom_address))^00h,c,w
	movwf	((c:writeByteAT24_EEPROM@address))^00h,c
	movf	((c:writeDataToEEPROM@i+1))^00h,c,w
	addwfc	((c:_at24_eeprom_address+1))^00h,c,w
	movwf	1+((c:writeByteAT24_EEPROM@address))^00h,c
	movf	((c:writeDataToEEPROM@i))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeByteAT24_EEPROM@data))^00h,c
	call	_writeByteAT24_EEPROM	;wreg free
	line	500
	
l1827:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u1267:
decfsz	wreg,f
	bra	u1267
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1267
asmopt pop

	line	497
	
l1829:
	infsnz	((c:writeDataToEEPROM@i))^00h,c
	incf	((c:writeDataToEEPROM@i+1))^00h,c
	
l1831:
		movf	((c:writeDataToEEPROM@payload_length))^00h,c,w
	subwf	((c:writeDataToEEPROM@i))^00h,c,w
	movf	((c:writeDataToEEPROM@payload_length+1))^00h,c,w
	subwfb	((c:writeDataToEEPROM@i+1))^00h,c,w
	btfss	status,0
	goto	u681
	goto	u680

u681:
	goto	l1825
u680:
	line	504
	
l1833:
	movf	((c:writeDataToEEPROM@payload_length))^00h,c,w
	addwf	((c:_at24_eeprom_address))^00h,c
	movf	((c:writeDataToEEPROM@payload_length+1))^00h,c,w
	addwfc	((c:_at24_eeprom_address+1))^00h,c

	line	509
	
l1835:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1277:
decfsz	wreg,f
	bra	u1277
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1277
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1277
	nop
asmopt pop

	line	511
	
l1837:
	movff	0+((c:_at24_eeprom_address)+01h),(c:EEPROM_Write@eep_data)
	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Write
	line	512
	
l1839:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1287:
decfsz	wreg,f
	bra	u1287
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1287
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1287
	nop
asmopt pop

	line	513
	
l1841:
	movff	(c:_at24_eeprom_address),(c:EEPROM_Write@eep_data)
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Write
	line	514
	
l1843:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1297:
decfsz	wreg,f
	bra	u1297
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1297
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1297
	nop
asmopt pop

	line	517
	
l1845:
		incf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c,w
	movlw	127
	subwfb	((c:writeDataToEEPROM@at24_eep_lookup_addr+1))^00h,c,w
	btfss	status,0
	goto	u691
	goto	u690

u691:
	goto	l1851
u690:
	goto	l1813
	line	525
	
l1851:
	movff	(c:writeDataToEEPROM@at24_eep_lookup_addr),(c:writeByteAT24_EEPROM@address)
	movff	(c:writeDataToEEPROM@at24_eep_lookup_addr+1),(c:writeByteAT24_EEPROM@address+1)
	movff	0+((c:writeDataToEEPROM@at24_eeprom_addr_start)+01h),(c:writeByteAT24_EEPROM@data)
	call	_writeByteAT24_EEPROM	;wreg free
	line	526
	
l1853:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u1307:
decfsz	wreg,f
	bra	u1307
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1307
asmopt pop

	line	527
	
l1855:
	movlw	low(01h)
	addwf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c,w
	movwf	((c:writeByteAT24_EEPROM@address))^00h,c
	movlw	high(01h)
	addwfc	((c:writeDataToEEPROM@at24_eep_lookup_addr+1))^00h,c,w
	movwf	1+((c:writeByteAT24_EEPROM@address))^00h,c
	movff	(c:writeDataToEEPROM@at24_eeprom_addr_start),(c:writeByteAT24_EEPROM@data)
	call	_writeByteAT24_EEPROM	;wreg free
	line	529
	
l1857:
	movlw	02h
	addwf	((c:writeDataToEEPROM@at24_eep_lookup_addr))^00h,c
	movlw	0
	addwfc	((c:writeDataToEEPROM@at24_eep_lookup_addr+1))^00h,c
	line	532
	
l1859:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1317:
decfsz	wreg,f
	bra	u1317
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1317
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1317
	nop
asmopt pop

	line	533
	
l1861:
	movff	0+((c:writeDataToEEPROM@at24_eep_lookup_addr)+01h),(c:EEPROM_Write@eep_data)
	movlw	(0Ch)&0ffh
	
	call	_EEPROM_Write
	line	534
	
l1863:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1327:
decfsz	wreg,f
	bra	u1327
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1327
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1327
	nop
asmopt pop

	line	535
	
l1865:
	movff	(c:writeDataToEEPROM@at24_eep_lookup_addr),(c:EEPROM_Write@eep_data)
	movlw	(0Dh)&0ffh
	
	call	_EEPROM_Write
	line	536
	
l1867:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u1337:
decfsz	wreg,f
	bra	u1337
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u1337
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u1337
	nop
asmopt pop

	line	539
	
l1869:
	movff	(_request_unit),(_responseBuffer)
	line	540
	
l1871:
	movff	0+(_request_unit+01h),0+(_responseBuffer+01h)
	line	541
	
l1873:
	movff	0+((c:writeDataToEEPROM@at24_eeprom_addr_start)+01h),0+(_responseBuffer+02h)
	line	542
	
l1875:
	movff	(c:writeDataToEEPROM@at24_eeprom_addr_start),0+(_responseBuffer+03h)
	line	543
	
l1877:
	movlb	0	; () banked
	setf	(0+(_responseBuffer+04h))&0ffh
	line	549
	
l169:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeDataToEEPROM
	__end_of_writeDataToEEPROM:
	signat	_writeDataToEEPROM,89
	global	_sendResponse

;; *************** function _sendResponse *****************
;; Defined at:
;;		line 656 in file "main.c"
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
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	656
global __ptext5
__ptext5:
psect	text5
	file	"main.c"
	line	656
	
_sendResponse:
;incstack = 0
	callstack 26
	movwf	((c:sendResponse@isExceptionOccurred))^00h,c
	line	658
	
l2035:
	line	661
	
l2037:
	movlw	(03Ah)&0ffh
	
	call	_UART_TransmitChar
	line	662
	
l2039:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1347:
decfsz	wreg,f
	bra	u1347
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1347
asmopt pop

	line	663
	
l2041:
	movlw	(023h)&0ffh
	
	call	_UART_TransmitChar
	line	664
	
l2043:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1357:
decfsz	wreg,f
	bra	u1357
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1357
asmopt pop

	line	666
	
l2045:
	movf	((c:sendResponse@isExceptionOccurred))^00h,c,w
	btfss	status,2
	goto	u801
	goto	u800
u801:
	goto	l2061
u800:
	line	668
	
l2047:
	movlw	high(0)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(0)
	movwf	((c:sendResponse@index))^00h,c
	line	670
	
l2053:
	movf	((c:sendResponse@index))^00h,c,w
	addlw	low(_responseBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	671
	
l2055:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1367:
decfsz	wreg,f
	bra	u1367
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1367
asmopt pop

	line	668
	
l2057:
	infsnz	((c:sendResponse@index))^00h,c
	incf	((c:sendResponse@index+1))^00h,c
	
l2059:
		movf	((c:sendResponse@index+1))^00h,c,w
	bnz	u810
	movlw	50
	subwf	 ((c:sendResponse@index))^00h,c,w
	btfss	status,0
	goto	u811
	goto	u810

u811:
	goto	l2053
u810:
	goto	l2075
	line	677
	
l2061:
	movlw	(021h)&0ffh
	
	call	_UART_TransmitChar
	line	678
	
l2063:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1377:
decfsz	wreg,f
	bra	u1377
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1377
asmopt pop

	line	679
	
l2065:
	movlw	(0FEh)&0ffh
	
	call	_UART_TransmitChar
	line	680
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1387:
decfsz	wreg,f
	bra	u1387
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1387
asmopt pop

	line	681
	
l2067:
	movf	((c:_exception_code))^00h,c,w
	
	call	_UART_TransmitChar
	line	682
	
l2069:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1397:
decfsz	wreg,f
	bra	u1397
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1397
asmopt pop

	line	684
	
l2071:
	movlw	low(0)
	movwf	((c:_isExceptionRaised))^00h,c
	line	685
	
l2073:
	movlw	low(0)
	movwf	((c:_exception_code))^00h,c
	line	689
	
l2075:
	movlw	(0Dh)&0ffh
	
	call	_UART_TransmitChar
	line	690
	
l2077:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u1407:
decfsz	wreg,f
	bra	u1407
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u1407
asmopt pop

	line	691
	
l2079:
	movlw	(0Ah)&0ffh
	
	call	_UART_TransmitChar
	line	694
	
l2081:
	movlw	high(032h)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(032h)
	movwf	((c:sendResponse@index))^00h,c
	line	695
	goto	l2087
	line	697
	
l2083:
	movf	((c:sendResponse@index))^00h,c,w
	sublw	low(_requestBuffer+032h)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0FFh)
	movwf	indf2
	line	698
	
l2085:
	decf	((c:sendResponse@index))^00h,c
	btfss	status,0
	decf	((c:sendResponse@index+1))^00h,c
	line	695
	
l2087:
	movf	((c:sendResponse@index))^00h,c,w
iorwf	((c:sendResponse@index+1))^00h,c,w
	btfss	status,2
	goto	u821
	goto	u820

u821:
	goto	l2083
u820:
	line	702
	
l2089:
	movlw	high(0)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(0)
	movwf	((c:sendResponse@index))^00h,c
	line	703
	goto	l2095
	line	704
	
l2091:
	movf	((c:sendResponse@index))^00h,c,w
	addlw	low(_responseBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0FFh)
	movwf	indf2
	line	705
	
l2093:
	infsnz	((c:sendResponse@index))^00h,c
	incf	((c:sendResponse@index+1))^00h,c
	line	703
	
l2095:
		movf	((c:sendResponse@index+1))^00h,c,w
	bnz	u830
	movlw	50
	subwf	 ((c:sendResponse@index))^00h,c,w
	btfss	status,0
	goto	u831
	goto	u830

u831:
	goto	l2091
u830:
	line	707
	
l199:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sendResponse
	__end_of_sendResponse:
	signat	_sendResponse,4217
	global	_isPasswordMatched

;; *************** function _isPasswordMatched *****************
;; Defined at:
;;		line 890 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1   16[COMRAM] unsigned char 
;;  matchFlag       1   15[COMRAM] unsigned char 
;;  payload_leng    1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr1l, fsr1h, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
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
;;		_UART_TransmitChar
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	890
global __ptext6
__ptext6:
psect	text6
	file	"main.c"
	line	890
	
_isPasswordMatched:
;incstack = 0
	callstack 26
	line	892
	
l2009:
	line	893
	movlw	low(0)
	movwf	((c:isPasswordMatched@index))^00h,c
	line	894
	movlw	low(01h)
	movwf	((c:isPasswordMatched@matchFlag))^00h,c
	line	897
	
l2011:
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:isPasswordMatched@payload_length))^00h,c
	line	900
	
l2013:; BSR set to: 0

	movf	((c:isPasswordMatched@payload_length))^00h,c,w
xorwf	(0+((c:_master)+08h))^00h,c,w
	btfsc	status,2
	goto	u771
	goto	u770

u771:
	goto	l2019
u770:
	line	903
	
l2015:; BSR set to: 0

	movlw	(0)&0ffh
	goto	l235
	line	907
	
l2019:; BSR set to: 0

	movlw	low(0)
	movwf	((c:isPasswordMatched@index))^00h,c
	goto	l2029
	line	910
	
l2021:
	movf	((c:isPasswordMatched@index))^00h,c,w
	addlw	low(_master)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	911
	movf	((c:isPasswordMatched@index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	913
	
l2023:
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
	goto	u781
	goto	u780

u781:
	goto	l2027
u780:
	line	915
	
l2025:
	movlw	low(0)
	movwf	((c:isPasswordMatched@matchFlag))^00h,c
	line	916
	goto	l2031
	line	907
	
l2027:
	incf	((c:isPasswordMatched@index))^00h,c
	
l2029:
		movf	(0+((c:_master)+08h))^00h,c,w
	subwf	((c:isPasswordMatched@index))^00h,c,w
	btfss	status,0
	goto	u791
	goto	u790

u791:
	goto	l2021
u790:
	line	920
	
l2031:
	movf	((c:isPasswordMatched@matchFlag))^00h,c,w
	line	921
	
l235:
	return	;funcret
	callstack 0
GLOBAL	__end_of_isPasswordMatched
	__end_of_isPasswordMatched:
	signat	_isPasswordMatched,89
	global	_createPingResponse

;; *************** function _createPingResponse *****************
;; Defined at:
;;		line 423 in file "main.c"
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
;;		On exit  : 3F/0
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
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	423
global __ptext7
__ptext7:
psect	text7
	file	"main.c"
	line	423
	
_createPingResponse:
;incstack = 0
	callstack 27
	line	425
	
l1777:
	movff	(_request_unit),(_responseBuffer)
	line	426
	movff	0+(_request_unit+01h),0+(_responseBuffer+01h)
	line	427
	
l1779:
	movlw	low(0)
	movlb	0	; () banked
	movwf	(0+(_responseBuffer+02h))&0ffh
	line	428
	movlw	low(0)
	movwf	(0+(_responseBuffer+03h))&0ffh
	line	429
	
l163:; BSR set to: 0

	return	;funcret
	callstack 0
GLOBAL	__end_of_createPingResponse
	__end_of_createPingResponse:
	signat	_createPingResponse,89
	global	_ReadLookupEntries

;; *************** function _ReadLookupEntries *****************
;; Defined at:
;;		line 928 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           2   12[COMRAM] unsigned int 
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
;;      Locals:         2       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_UART_TransmitChar
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	line	928
global __ptext8
__ptext8:
psect	text8
	file	"main.c"
	line	928
	
_ReadLookupEntries:; BSR set to: 0

;incstack = 0
	callstack 26
	line	929
	
l1923:
	movlw	high(0)
	movwf	((c:ReadLookupEntries@index+1))^00h,c
	movlw	low(0)
	movwf	((c:ReadLookupEntries@index))^00h,c
	line	930
	
l1929:
	movlw	low(_LOOKUP_SECTION_CACHE)
	addwf	((c:ReadLookupEntries@index))^00h,c,w
	movwf	c:fsr2l
	movlw	high(_LOOKUP_SECTION_CACHE)
	addwfc	((c:ReadLookupEntries@index+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	929
	
l1931:
	infsnz	((c:ReadLookupEntries@index))^00h,c
	incf	((c:ReadLookupEntries@index+1))^00h,c
	
l1933:
		movlw	144
	subwf	 ((c:ReadLookupEntries@index))^00h,c,w
	movlw	1
	subwfb	((c:ReadLookupEntries@index+1))^00h,c,w
	btfss	status,0
	goto	u731
	goto	u730

u731:
	goto	l1929
u730:
	line	932
	
l244:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ReadLookupEntries
	__end_of_ReadLookupEntries:
	signat	_ReadLookupEntries,89
	global	_ReadCredentials

;; *************** function _ReadCredentials *****************
;; Defined at:
;;		line 817 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   27[COMRAM] unsigned short 
;;  ADDR            2   21[COMRAM] unsigned char [2]
;;  credential_l    2   25[COMRAM] unsigned short 
;;  START_ADDR      2   19[COMRAM] unsigned short 
;;  index           1   24[COMRAM] unsigned char 
;;  response_ind    1   23[COMRAM] unsigned char 
;;  last_char_in    1   18[COMRAM] unsigned char 
;;  payload_leng    1   17[COMRAM] unsigned char 
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
;;      Locals:        12       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:        14       0       0       0       0       0       0
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
	line	817
global __ptext9
__ptext9:
psect	text9
	file	"main.c"
	line	817
	
_ReadCredentials:
;incstack = 0
	callstack 25
	line	821
	
l1879:
	movlw	low(0)
	movwf	((c:ReadCredentials@index))^00h,c
	line	822
	movlw	low(0)
	movwf	((c:ReadCredentials@last_char_index))^00h,c
	line	823
	movlw	low(0)
	movwf	((c:ReadCredentials@response_index))^00h,c
	line	824
	movlw	low(02h)
	movwf	((c:ReadCredentials@payload_length))^00h,c
	line	827
	movlw	high(0)
	movwf	((c:ReadCredentials@START_ADDR+1))^00h,c
	movlw	low(0)
	movwf	((c:ReadCredentials@START_ADDR))^00h,c
	line	829
	movlw	low(0)
	movwf	((c:ReadCredentials@index))^00h,c
	goto	l1885
	line	830
	
l1881:
	movf	((c:ReadCredentials@index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:ReadCredentials@index))^00h,c,w
	addlw	low(ReadCredentials@ADDR)
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	line	829
	
l1883:
	incf	((c:ReadCredentials@index))^00h,c
	
l1885:
		movf	((c:ReadCredentials@payload_length))^00h,c,w
	subwf	((c:ReadCredentials@index))^00h,c,w
	btfss	status,0
	goto	u701
	goto	u700

u701:
	goto	l1881
u700:
	line	832
	
l1887:
	movf	((c:ReadCredentials@ADDR))^00h,c,w
	
	call	_UART_TransmitChar
	line	833
	movf	(0+((c:ReadCredentials@ADDR)+01h))^00h,c,w
	
	call	_UART_TransmitChar
	line	838
	
l1889:
	movf	(0+((c:ReadCredentials@ADDR)+01h))^00h,c,w
	movff	(c:ReadCredentials@ADDR),??_ReadCredentials+0+0
	clrf	(??_ReadCredentials+0+0+1)^00h,c
	movff	??_ReadCredentials+0+0,??_ReadCredentials+0+1
	clrf	(??_ReadCredentials+0+0)^00h,c
	iorwf	(??_ReadCredentials+0+0)^00h,c,w
	movwf	((c:ReadCredentials@START_ADDR))^00h,c
	movf	(??_ReadCredentials+0+1)^00h,c,w
	movwf	1+((c:ReadCredentials@START_ADDR))^00h,c
	line	840
	
l1891:
	asmopt push
asmopt off
movlw  5
movwf	(??_ReadCredentials+0+0+1)^00h,c
movlw	15
movwf	(??_ReadCredentials+0+0)^00h,c
	movlw	241
u1417:
decfsz	wreg,f
	bra	u1417
	decfsz	(??_ReadCredentials+0+0)^00h,c,f
	bra	u1417
	decfsz	(??_ReadCredentials+0+0+1)^00h,c,f
	bra	u1417
	nop
asmopt pop

	line	842
	
l1893:
	movff	(c:ReadCredentials@START_ADDR),(c:readByteAT24_EEPROM@address)
	movff	(c:ReadCredentials@START_ADDR+1),(c:readByteAT24_EEPROM@address+1)
	call	_readByteAT24_EEPROM	;wreg free
	movwf	(??_ReadCredentials+0+0)^00h,c
	movf	((??_ReadCredentials+0+0))^00h,c,w
	movwf	((c:ReadCredentials@credential_length))^00h,c
	clrf	((c:ReadCredentials@credential_length+1))^00h,c
	line	843
	
l1895:
	asmopt push
asmopt off
movlw  5
movwf	(??_ReadCredentials+0+0+1)^00h,c
movlw	15
movwf	(??_ReadCredentials+0+0)^00h,c
	movlw	241
u1427:
decfsz	wreg,f
	bra	u1427
	decfsz	(??_ReadCredentials+0+0)^00h,c,f
	bra	u1427
	decfsz	(??_ReadCredentials+0+0+1)^00h,c,f
	bra	u1427
	nop
asmopt pop

	line	845
	
l1897:
	movf	(0+((c:ReadCredentials@credential_length)+01h))^00h,c,w
	
	call	_UART_TransmitChar
	line	846
	
l1899:
	movf	((c:ReadCredentials@credential_length))^00h,c,w
	
	call	_UART_TransmitChar
	line	848
	
l1901:
	infsnz	((c:ReadCredentials@START_ADDR))^00h,c
	incf	((c:ReadCredentials@START_ADDR+1))^00h,c
	line	850
	
l1903:
		incf	((c:ReadCredentials@credential_length))^00h,c,w
iorwf	((c:ReadCredentials@credential_length+1))^00h,c,w
	btfss	status,2
	goto	u711
	goto	u710

u711:
	goto	l222
u710:
	line	852
	
l1905:
	movlw	(0FFh)&0ffh
	
	call	_UART_TransmitChar
	goto	l223
	line	854
	
l222:
	line	857
	movff	(_request_unit),(_responseBuffer)
	line	858
	movff	0+(_request_unit+01h),0+(_responseBuffer+01h)
	line	860
	
l1909:
	movlw	(02h)&0ffh
	addwf	((c:ReadCredentials@response_index))^00h,c
	line	863
	
l1911:
	movlw	high(0)
	movwf	((c:ReadCredentials@i+1))^00h,c
	movlw	low(0)
	movwf	((c:ReadCredentials@i))^00h,c
	goto	l1919
	line	864
	
l1913:
	movf	((c:ReadCredentials@response_index))^00h,c,w
	addlw	low(_responseBuffer)
	addwf	((c:ReadCredentials@i))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:ReadCredentials@i))^00h,c,w
	addwf	((c:ReadCredentials@START_ADDR))^00h,c,w
	movwf	((c:readByteAT24_EEPROM@address))^00h,c
	movf	((c:ReadCredentials@i+1))^00h,c,w
	addwfc	((c:ReadCredentials@START_ADDR+1))^00h,c,w
	movwf	1+((c:readByteAT24_EEPROM@address))^00h,c
	call	_readByteAT24_EEPROM	;wreg free
	movwf	indf2,c

	line	865
	movf	((c:ReadCredentials@response_index))^00h,c,w
	addlw	low(_responseBuffer)
	addwf	((c:ReadCredentials@i))^00h,c,w
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	866
	
l1915:
	movf	((c:ReadCredentials@response_index))^00h,c,w
	addwf	((c:ReadCredentials@i))^00h,c,w
	movwf	((c:ReadCredentials@last_char_index))^00h,c
	line	863
	
l1917:
	infsnz	((c:ReadCredentials@i))^00h,c
	incf	((c:ReadCredentials@i+1))^00h,c
	
l1919:
		movf	((c:ReadCredentials@credential_length))^00h,c,w
	subwf	((c:ReadCredentials@i))^00h,c,w
	movf	((c:ReadCredentials@credential_length+1))^00h,c,w
	subwfb	((c:ReadCredentials@i+1))^00h,c,w
	btfss	status,0
	goto	u721
	goto	u720

u721:
	goto	l1913
u720:
	line	870
	
l1921:
	movf	((c:ReadCredentials@last_char_index))^00h,c,w
	addlw	low(_responseBuffer+01h)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	line	871
	
l223:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ReadCredentials
	__end_of_ReadCredentials:
	signat	_ReadCredentials,89
	global	_readByteAT24_EEPROM

;; *************** function _readByteAT24_EEPROM *****************
;; Defined at:
;;		line 634 in file "main.c"
;; Parameters:    Size  Location     Type
;;  address         2   12[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;  eeprom_data     1   14[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/F
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
;;		_storeLookUpEntries
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	634
global __ptext10
__ptext10:
psect	text10
	file	"main.c"
	line	634
	
_readByteAT24_EEPROM:
;incstack = 0
	callstack 26
	line	635
	
l1757:
	line	637
	
l1759:
	call	_I2C2_Start	;wreg free
	line	638
	
l1761:
	movlw	(0A0h)&0ffh
	
	call	_I2C2_Send
	line	639
	
l1763:
	movf	(0+((c:readByteAT24_EEPROM@address)+01h))^00h,c,w
	
	call	_I2C2_Send
	line	640
	
l1765:
	movf	((c:readByteAT24_EEPROM@address))^00h,c,w
	
	call	_I2C2_Send
	line	642
	
l1767:
	call	_I2C2_Start	;wreg free
	line	643
	
l1769:
	movlw	(0A1h)&0ffh
	
	call	_I2C2_Send
	line	644
	
l1771:
	call	_I2C2_Read	;wreg free
	movwf	((c:readByteAT24_EEPROM@eeprom_data))^00h,c
	line	645
	call	_I2C2_Stop	;wreg free
	line	647
	
l1773:
	movf	((c:readByteAT24_EEPROM@eeprom_data))^00h,c,w
	line	648
	
l186:
	return	;funcret
	callstack 0
GLOBAL	__end_of_readByteAT24_EEPROM
	__end_of_readByteAT24_EEPROM:
	signat	_readByteAT24_EEPROM,4217
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
;;		On entry : 0/F
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
psect	text11,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	147
global __ptext11
__ptext11:
psect	text11
	file	"i2c.c"
	line	147
	
_I2C2_Read:
;incstack = 0
	callstack 26
	line	148
	
l1705:
	bsf	((c:4037))^0f00h,c,3	;volatile
	line	149
	
l316:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u621
	goto	u620
u621:
	goto	l316
u620:
	
l318:
	line	150
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	151
	
l1707:
	movf	((c:4041))^0f00h,c,w	;volatile
	line	152
	
l319:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Read
	__end_of_I2C2_Read:
	signat	_I2C2_Read,89
	global	_FormatDrive

;; *************** function _FormatDrive *****************
;; Defined at:
;;		line 939 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           2   18[COMRAM] unsigned short 
;;  mask_data       1   17[COMRAM] unsigned char 
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
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		_EEPROM_Write
;;		_UART_TransmitChar
;;		_writeByteAT24_EEPROM
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	939
global __ptext12
__ptext12:
psect	text12
	file	"main.c"
	line	939
	
_FormatDrive:
;incstack = 0
	callstack 25
	line	940
	
l1935:
	line	941
	
l1937:
	setf	((c:FormatDrive@mask_data))^00h,c
	line	944
	movlw	high(0)
	movwf	((c:FormatDrive@index+1))^00h,c
	movlw	low(0)
	movwf	((c:FormatDrive@index))^00h,c
	line	947
	
l1943:
	movf	(0+((c:FormatDrive@index)+01h))^00h,c,w
	
	call	_UART_TransmitChar
	line	948
	movf	((c:FormatDrive@index))^00h,c,w
	
	call	_UART_TransmitChar
	line	950
	
l1945:
	asmopt push
asmopt off
movlw	208
movwf	(??_FormatDrive+0+0)^00h,c
	movlw	202
u1437:
decfsz	wreg,f
	bra	u1437
	decfsz	(??_FormatDrive+0+0)^00h,c,f
	bra	u1437
asmopt pop

	line	951
	
l1947:
	movff	(c:FormatDrive@index),(c:writeByteAT24_EEPROM@address)
	movff	(c:FormatDrive@index+1),(c:writeByteAT24_EEPROM@address+1)
	movff	(c:FormatDrive@mask_data),(c:writeByteAT24_EEPROM@data)
	call	_writeByteAT24_EEPROM	;wreg free
	line	944
	
l1949:
	infsnz	((c:FormatDrive@index))^00h,c
	incf	((c:FormatDrive@index+1))^00h,c
		movlw	128
	subwf	 ((c:FormatDrive@index+1))^00h,c,w
	btfss	status,0
	goto	u741
	goto	u740

u741:
	goto	l1943
u740:
	line	955
	
l1951:
	asmopt push
asmopt off
movlw  41
movwf	(??_FormatDrive+0+0+1)^00h,c
movlw	150
movwf	(??_FormatDrive+0+0)^00h,c
	movlw	127
u1447:
decfsz	wreg,f
	bra	u1447
	decfsz	(??_FormatDrive+0+0)^00h,c,f
	bra	u1447
	decfsz	(??_FormatDrive+0+0+1)^00h,c,f
	bra	u1447
	nop
asmopt pop

	line	956
	
l1953:
	movlw	low(0FFh)
	movwf	((c:EEPROM_Write@eep_data))^00h,c
	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Write
	line	957
	
l1955:
	asmopt push
asmopt off
movlw  41
movwf	(??_FormatDrive+0+0+1)^00h,c
movlw	150
movwf	(??_FormatDrive+0+0)^00h,c
	movlw	127
u1457:
decfsz	wreg,f
	bra	u1457
	decfsz	(??_FormatDrive+0+0)^00h,c,f
	bra	u1457
	decfsz	(??_FormatDrive+0+0+1)^00h,c,f
	bra	u1457
	nop
asmopt pop

	line	958
	movlw	low(0FFh)
	movwf	((c:EEPROM_Write@eep_data))^00h,c
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Write
	line	959
	
l1957:
	asmopt push
asmopt off
movlw  41
movwf	(??_FormatDrive+0+0+1)^00h,c
movlw	150
movwf	(??_FormatDrive+0+0)^00h,c
	movlw	127
u1467:
decfsz	wreg,f
	bra	u1467
	decfsz	(??_FormatDrive+0+0)^00h,c,f
	bra	u1467
	decfsz	(??_FormatDrive+0+0+1)^00h,c,f
	bra	u1467
	nop
asmopt pop

	line	962
	
l1959:
	movff	(_request_unit),(_responseBuffer)
	line	963
	
l1961:
	movff	0+(_request_unit+01h),0+(_responseBuffer+01h)
	line	964
	
l249:
	return	;funcret
	callstack 0
GLOBAL	__end_of_FormatDrive
	__end_of_FormatDrive:
	signat	_FormatDrive,89
	global	_writeByteAT24_EEPROM

;; *************** function _writeByteAT24_EEPROM *****************
;; Defined at:
;;		line 619 in file "main.c"
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
;;		On entry : 0/0
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
;;		_FormatDrive
;; This function uses a non-reentrant model
;;
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	619
global __ptext13
__ptext13:
psect	text13
	file	"main.c"
	line	619
	
_writeByteAT24_EEPROM:
;incstack = 0
	callstack 25
	line	621
	
l1725:
	call	_I2C2_Start	;wreg free
	line	622
	
l1727:
	movlw	(0A0h)&0ffh
	
	call	_I2C2_Send
	movwf	((c:_checkAck))^00h,c
	line	623
	
l1729:
	movf	(0+((c:writeByteAT24_EEPROM@address)+01h))^00h,c,w
	
	call	_I2C2_Send
	line	624
	
l1731:
	movf	((c:writeByteAT24_EEPROM@address))^00h,c,w
	
	call	_I2C2_Send
	line	625
	
l1733:
	movf	((c:writeByteAT24_EEPROM@data))^00h,c,w
	
	call	_I2C2_Send
	line	626
	call	_I2C2_Stop	;wreg free
	line	627
	
l183:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeByteAT24_EEPROM
	__end_of_writeByteAT24_EEPROM:
	signat	_writeByteAT24_EEPROM,8313
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
;;		On entry : 0/F
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
psect	text14,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	82
global __ptext14
__ptext14:
psect	text14
	file	"i2c.c"
	line	82
	
_I2C2_Stop:
;incstack = 0
	callstack 26
	line	83
	
l1703:
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	84
	
l292:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u611
	goto	u610
u611:
	goto	l292
u610:
	
l294:
	line	85
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	86
	
l295:
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
;;		On entry : 0/F
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
psect	text15,class=CODE,space=0,reloc=2,group=0
	line	51
global __ptext15
__ptext15:
psect	text15
	file	"i2c.c"
	line	51
	
_I2C2_Start:
;incstack = 0
	callstack 26
	line	52
	
l1699:
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	53
	
l280:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u581
	goto	u580
u581:
	goto	l280
u580:
	
l282:
	line	54
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	55
	
l283:
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
;; Hardware stack levels required when called: 2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writeByteAT24_EEPROM
;;		_readByteAT24_EEPROM
;; This function uses a non-reentrant model
;;
psect	text16,class=CODE,space=0,reloc=2,group=0
	line	131
global __ptext16
__ptext16:
psect	text16
	file	"i2c.c"
	line	131
	
_I2C2_Send:
;incstack = 0
	callstack 26
	movwf	((c:I2C2_Send@BYTE))^00h,c
	line	132
	
l1701:
	movff	(c:I2C2_Send@BYTE),(c:4041)	;volatile
	line	133
	
l310:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u591
	goto	u590
u591:
	goto	l310
u590:
	
l312:
	line	134
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	135
	btfsc	((c:4037))^0f00h,c,6	;volatile
	goto	u601
	goto	u600
u601:
	movlw	1
	goto	u606
u600:
	movlw	0
u606:
	line	136
	
l313:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Send
	__end_of_I2C2_Send:
	signat	_I2C2_Send,4217
	global	_UART_TransmitChar

;; *************** function _UART_TransmitChar *****************
;; Defined at:
;;		line 208 in file "main.c"
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
;;		_sendResponse
;;		_ReadCredentials
;;		_isPasswordMatched
;;		_ReadLookupEntries
;;		_FormatDrive
;; This function uses a non-reentrant model
;;
psect	text17,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	208
global __ptext17
__ptext17:
psect	text17
	file	"main.c"
	line	208
	
_UART_TransmitChar:
;incstack = 0
	callstack 26
	movwf	((c:UART_TransmitChar@data))^00h,c
	line	210
	
l1711:
	
l110:
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	u631
	goto	u630
u631:
	goto	l110
u630:
	line	211
	
l1713:
	movff	(c:UART_TransmitChar@data),(c:4013)	;volatile
	line	212
	
l113:
	return	;funcret
	callstack 0
GLOBAL	__end_of_UART_TransmitChar
	__end_of_UART_TransmitChar:
	signat	_UART_TransmitChar,4217
	global	_EEPROM_Write

;; *************** function _EEPROM_Write *****************
;; Defined at:
;;		line 714 in file "main.c"
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
;;		_FormatDrive
;; This function uses a non-reentrant model
;;
psect	text18,class=CODE,space=0,reloc=2,group=0
	line	714
global __ptext18
__ptext18:
psect	text18
	file	"main.c"
	line	714
	
_EEPROM_Write:
;incstack = 0
	callstack 26
	movwf	((c:EEPROM_Write@addr))^00h,c
	line	716
	
l1735:
	asmopt push
asmopt off
movlw  41
movwf	(??_EEPROM_Write+0+0+1)^00h,c
movlw	150
movwf	(??_EEPROM_Write+0+0)^00h,c
	movlw	127
u1477:
decfsz	wreg,f
	bra	u1477
	decfsz	(??_EEPROM_Write+0+0)^00h,c,f
	bra	u1477
	decfsz	(??_EEPROM_Write+0+0+1)^00h,c,f
	bra	u1477
	nop
asmopt pop

	line	718
	
l1737:
	movff	(c:EEPROM_Write@addr),(c:4009)	;volatile
	line	719
	
l1739:
	movff	(c:EEPROM_Write@eep_data),(c:4008)	;volatile
	line	721
	
l1741:
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	722
	
l1743:
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	723
	
l1745:
	bsf	((c:4006))^0f00h,c,2	;volsfr
	line	725
	
l1747:
	bcf	((c:4082))^0f00h,c,7	;volatile
	line	728
	
l1749:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	729
	
l1751:
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	730
	
l1753:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	732
	
l1755:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	736
	
l202:
	line	735
	btfss	((c:4001))^0f00h,c,4	;volatile
	goto	u641
	goto	u640
u641:
	goto	l202
u640:
	
l204:
	line	738
	bcf	((c:4001))^0f00h,c,4	;volatile
	line	739
	
l205:
	return	;funcret
	callstack 0
GLOBAL	__end_of_EEPROM_Write
	__end_of_EEPROM_Write:
	signat	_EEPROM_Write,8313
	global	_UART_Init

;; *************** function _UART_Init *****************
;; Defined at:
;;		line 141 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            3   26[COMRAM] float 
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
psect	text19,class=CODE,space=0,reloc=2,group=0
	line	141
global __ptext19
__ptext19:
psect	text19
	file	"main.c"
	line	141
	
_UART_Init:
;incstack = 0
	callstack 27
	line	145
	
l2143:
	bcf	c:(31910/8),(31910)&7	;volatile
	line	146
	bsf	c:(31911/8),(31911)&7	;volatile
	line	147
	movlb	15	; () banked
	bcf	((3898))&0ffh,7	;volatile
	line	149
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	150
	bsf	((c:4082))^0f00h,c,6	;volatile
	line	151
	bsf	((c:3997))^0f00h,c,5	;volatile
	line	153
	
l2145:; BSR set to: 15

	movlw	low(020h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	154
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	157
	movlw	low(float24(103.16666666666667))
	movwf	((c:UART_Init@temp))^00h,c
	movlw	high(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+1))^00h,c
	movlw	low highword(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+2))^00h,c

	line	158
	
l2147:; BSR set to: 15

	movff	(c:UART_Init@temp),(c:___fttol@f1)
	movff	(c:UART_Init@temp+1),(c:___fttol@f1+1)
	movff	(c:UART_Init@temp+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movf	(0+?___fttol)^00h,c,w
	movwf	((c:4015))^0f00h,c	;volatile
	line	201
	
l107:
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
;;  lval            4   21[COMRAM] unsigned long 
;;  exp1            1   25[COMRAM] unsigned char 
;;  sign1           1   20[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   11[COMRAM] long 
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
psect	text20,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
global __ptext20
__ptext20:
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
	
___fttol:
;incstack = 0
	callstack 27
	line	49
	
l2097:; BSR set to: 15

	movff	(c:___fttol@f1+2),??___fttol+0+0
	clrf	(??___fttol+0+0+1)^00h,c
	clrf	(??___fttol+0+0+2)^00h,c
	rlcf	((c:___fttol@f1+1))^00h,c,w
	rlcf	(??___fttol+0+0)^00h,c
	bnc	u841
	bsf	(??___fttol+0+0+1)^00h,c,0
u841:
	movf	(??___fttol+0+0)^00h,c,w
	movwf	((c:___fttol@exp1))^00h,c
	movf	((c:___fttol@exp1))^00h,c,w
	btfss	status,2
	goto	u851
	goto	u850
u851:
	goto	l2103
u850:
	line	50
	
l2099:
	movlw	low(0)
	movwf	((c:?___fttol))^00h,c
	movlw	high(0)
	movwf	((c:?___fttol+1))^00h,c
	movlw	low highword(0)
	movwf	((c:?___fttol+2))^00h,c
	movlw	high highword(0)
	movwf	((c:?___fttol+3))^00h,c
	goto	l696
	line	51
	
l2103:; BSR set to: 15

	movlw	(017h)&0ffh
	movwf	(??___fttol+0+0)^00h,c
	movff	(c:___fttol@f1),??___fttol+1+0
	movff	(c:___fttol@f1+1),??___fttol+1+0+1
	movff	(c:___fttol@f1+2),??___fttol+1+0+2
	incf	((??___fttol+0+0))^00h,c,w
	movwf	(??___fttol+4+0)^00h,c
	goto	u860
u865:
	bcf	status,0
	rrcf	(??___fttol+1+2)^00h,c
	rrcf	(??___fttol+1+1)^00h,c
	rrcf	(??___fttol+1+0)^00h,c
u860:
	decfsz	(??___fttol+4+0)^00h,c
	goto	u865
	movf	(??___fttol+1+0)^00h,c,w
	movwf	((c:___fttol@sign1))^00h,c
	line	52
	
l2105:
	bsf	(0+(15/8)+(c:___fttol@f1))^00h,c,(15)&7
	line	53
	
l2107:
	movlw	low(0FFFFh)
	andwf	((c:___fttol@f1))^00h,c
	movlw	high(0FFFFh)
	andwf	((c:___fttol@f1+1))^00h,c
	movlw	low highword(0FFFFh)
	andwf	((c:___fttol@f1+2))^00h,c

	line	54
	
l2109:
	movf	((c:___fttol@f1))^00h,c,w
	movwf	((c:___fttol@lval))^00h,c
	movf	((c:___fttol@f1+1))^00h,c,w
	movwf	1+((c:___fttol@lval))^00h,c
	
	movf	((c:___fttol@f1+2))^00h,c,w
	movwf	2+((c:___fttol@lval))^00h,c
	
	clrf	3+((c:___fttol@lval))^00h,c
	
	line	55
	
l2111:
	movlw	(08Eh)&0ffh
	subwf	((c:___fttol@exp1))^00h,c
	line	56
	
l2113:
	btfsc	((c:___fttol@exp1))^00h,c,7
	goto	u870
	goto	u871

u871:
	goto	l2125
u870:
	line	57
	
l2115:
		movf	((c:___fttol@exp1))^00h,c,w
	xorlw	80h
	addlw	-(80h^-15)
	btfsc	status,0
	goto	u881
	goto	u880

u881:
	goto	l2121
u880:
	goto	l2099
	line	60
	
l2121:
	bcf	status,0
	rrcf	((c:___fttol@lval+3))^00h,c
	rrcf	((c:___fttol@lval+2))^00h,c
	rrcf	((c:___fttol@lval+1))^00h,c
	rrcf	((c:___fttol@lval))^00h,c
	line	61
	
l2123:
	incfsz	((c:___fttol@exp1))^00h,c
	
	goto	l2121
	goto	l2135
	line	63
	
l2125:
		movlw	018h-1
	cpfsgt	((c:___fttol@exp1))^00h,c
	goto	u891
	goto	u890

u891:
	goto	l2133
u890:
	goto	l2099
	line	66
	
l2131:
	bcf	status,0
	rlcf	((c:___fttol@lval))^00h,c
	rlcf	((c:___fttol@lval+1))^00h,c
	rlcf	((c:___fttol@lval+2))^00h,c
	rlcf	((c:___fttol@lval+3))^00h,c
	line	67
	decf	((c:___fttol@exp1))^00h,c
	line	65
	
l2133:
	movf	((c:___fttol@exp1))^00h,c,w
	btfss	status,2
	goto	u901
	goto	u900
u901:
	goto	l2131
u900:
	line	70
	
l2135:
	movf	((c:___fttol@sign1))^00h,c,w
	btfsc	status,2
	goto	u911
	goto	u910
u911:
	goto	l2139
u910:
	line	71
	
l2137:
	comf	((c:___fttol@lval+3))^00h,c
	comf	((c:___fttol@lval+2))^00h,c
	comf	((c:___fttol@lval+1))^00h,c
	negf	((c:___fttol@lval))^00h,c
	movlw	0
	addwfc	((c:___fttol@lval+1))^00h,c
	addwfc	((c:___fttol@lval+2))^00h,c
	addwfc	((c:___fttol@lval+3))^00h,c
	line	72
	
l2139:
	movff	(c:___fttol@lval),(c:?___fttol)
	movff	(c:___fttol@lval+1),(c:?___fttol+1)
	movff	(c:___fttol@lval+2),(c:?___fttol+2)
	movff	(c:___fttol@lval+3),(c:?___fttol+3)
	line	73
	
l696:
	return	;funcret
	callstack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
	signat	___fttol,4220
	global	_ReadMasterPasswordFromEEPROM

;; *************** function _ReadMasterPasswordFromEEPROM *****************
;; Defined at:
;;		line 779 in file "main.c"
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
psect	text21,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	779
global __ptext21
__ptext21:
psect	text21
	file	"main.c"
	line	779
	
_ReadMasterPasswordFromEEPROM:
;incstack = 0
	callstack 27
	line	781
	
l2203:; BSR set to: 15

	line	782
	movlw	low(0)
	movwf	((c:ReadMasterPasswordFromEEPROM@password_addr))^00h,c
	line	785
	
l2205:; BSR set to: 15

	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1487:
decfsz	wreg,f
	bra	u1487
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1487
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1487
	nop
asmopt pop

	line	786
	
l2207:
	movlw	(0)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:ReadMasterPasswordFromEEPROM@password_length))^00h,c
	line	787
	
l2209:
	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1497:
decfsz	wreg,f
	bra	u1497
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1497
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1497
	nop
asmopt pop

	line	788
	
l2211:
	incf	((c:ReadMasterPasswordFromEEPROM@password_addr))^00h,c
	line	790
	
l2213:
		incf	((c:ReadMasterPasswordFromEEPROM@password_length))^00h,c,w
	btfsc	status,2
	goto	u991
	goto	u990

u991:
	goto	l2229
u990:
	line	793
	
l2215:
	movlw	low(0)
	movwf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c
	goto	l2225
	line	795
	
l2217:
	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1507:
decfsz	wreg,f
	bra	u1507
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1507
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1507
	nop
asmopt pop

	line	796
	
l2219:
	movf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c,w
	addlw	low(_master)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:ReadMasterPasswordFromEEPROM@password_addr))^00h,c,w
	addwf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c,w
	
	call	_EEPROM_Read
	movwf	indf2,c

	line	797
	
l2221:
	asmopt push
asmopt off
movlw  41
movwf	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c
	movlw	127
u1517:
decfsz	wreg,f
	bra	u1517
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0)^00h,c,f
	bra	u1517
	decfsz	(??_ReadMasterPasswordFromEEPROM+0+0+1)^00h,c,f
	bra	u1517
	nop
asmopt pop

	line	793
	
l2223:
	incf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c
	
l2225:
		movf	((c:ReadMasterPasswordFromEEPROM@password_length))^00h,c,w
	subwf	((c:ReadMasterPasswordFromEEPROM@index))^00h,c,w
	btfss	status,0
	goto	u1001
	goto	u1000

u1001:
	goto	l2217
u1000:
	line	800
	
l2227:
	movlw	low(0)
	movwf	((c:_isExceptionRaised))^00h,c
	line	801
	movlw	low(0)
	movwf	((c:_exception_code))^00h,c
	line	802
	goto	l2231
	line	805
	
l2229:
	movlw	low(0)
	movwf	((c:_isPasswordSet))^00h,c
	line	809
	
l2231:
	movff	(c:ReadMasterPasswordFromEEPROM@password_length),0+((c:_master)+08h)
	line	810
	
l216:
	return	;funcret
	callstack 0
GLOBAL	__end_of_ReadMasterPasswordFromEEPROM
	__end_of_ReadMasterPasswordFromEEPROM:
	signat	_ReadMasterPasswordFromEEPROM,89
	global	_EEPROM_Read

;; *************** function _EEPROM_Read *****************
;; Defined at:
;;		line 746 in file "main.c"
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
psect	text22,class=CODE,space=0,reloc=2,group=0
	line	746
global __ptext22
__ptext22:
psect	text22
	file	"main.c"
	line	746
	
_EEPROM_Read:
;incstack = 0
	callstack 26
	movwf	((c:EEPROM_Read@addr))^00h,c
	line	748
	
l1715:
	movff	(c:EEPROM_Read@addr),(c:4009)	;volatile
	line	749
	
l1717:
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	750
	
l1719:
	bsf	((c:4006))^0f00h,c,0	;volsfr
	line	752
	
l1721:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	753
	
l208:
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
psect	text23,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	20
global __ptext23
__ptext23:
psect	text23
	file	"i2c.c"
	line	20
	
_I2C2_Init:
;incstack = 0
	callstack 28
	line	21
	
l1613:
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	22
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	25
	movlb	15	; () banked
	bcf	((3898))&0ffh,3	;volatile
	line	26
	bcf	((3898))&0ffh,4	;volatile
	line	28
	
l1615:; BSR set to: 15

	movlw	low(080h)
	movwf	((c:4039))^0f00h,c	;volatile
	line	37
	movlw	low(028h)
	movwf	((c:4038))^0f00h,c	;volatile
	line	38
	movlw	low(09Fh)
	movwf	((c:4040))^0f00h,c	;volatile
	line	39
	
l277:; BSR set to: 15

	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Init
	__end_of_I2C2_Init:
	signat	_I2C2_Init,89
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 219 in file "main.c"
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
	line	219
	
_isr:; BSR set to: 15

;incstack = 0
	callstack 25
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	movff	fsr1l+0,??_isr+0
	movff	fsr1h+0,??_isr+1
	movff	fsr2l+0,??_isr+2
	movff	fsr2h+0,??_isr+3
	line	222
	
i2l2245:
	btfss	((c:3998))^0f00h,c,5	;volatile
	goto	i2u102_41
	goto	i2u102_40
i2u102_41:
	goto	i2l132
i2u102_40:
	line	224
	
i2l2247:
	movff	(c:4014),(c:isr@receivedChar)	;volatile
	line	225
	bcf	((c:3997))^0f00h,c,5	;volatile
	line	230
	
i2l2249:
	movlb	1	; () banked
	movf	(0+(_receiveData+033h))&0ffh,w
	btfss	status,2
	goto	i2u103_41
	goto	i2u103_40
i2u103_41:
	goto	i2l2265
i2u103_40:
	line	234
	
i2l2251:; BSR set to: 1

		movlw	58
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u104_41
	goto	i2u104_40

i2u104_41:
	goto	i2l2257
i2u104_40:
	
i2l2253:; BSR set to: 1

	movf	((c:_start_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u105_41
	goto	i2u105_40
i2u105_41:
	goto	i2l2257
i2u105_40:
	line	237
	
i2l2255:; BSR set to: 1

	movlw	low(01h)
	movwf	((c:_start_sequence_flag))^00h,c
	line	238
	goto	i2l2305
	line	239
	
i2l2257:; BSR set to: 1

		movlw	35
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u106_41
	goto	i2u106_40

i2u106_41:
	goto	i2l2263
i2u106_40:
	
i2l2259:; BSR set to: 1

		decf	((c:_start_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u107_41
	goto	i2u107_40

i2u107_41:
	goto	i2l2263
i2u107_40:
	line	242
	
i2l2261:; BSR set to: 1

	movlw	low(01h)
	movwf	(0+(_receiveData+033h))&0ffh
	line	243
	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	246
	movlw	low(0)
	movwf	((c:_start_sequence_flag))^00h,c
	line	247
	goto	i2l2305
	line	250
	
i2l2263:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_start_sequence_flag))^00h,c
	goto	i2l2305
	line	257
	
i2l2265:; BSR set to: 1

		movlw	13
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u108_41
	goto	i2u108_40

i2u108_41:
	goto	i2l2271
i2u108_40:
	
i2l2267:; BSR set to: 1

	movf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u109_41
	goto	i2u109_40
i2u109_41:
	goto	i2l2271
i2u109_40:
	line	259
	
i2l2269:; BSR set to: 1

	movlw	low(01h)
	movwf	((c:_end_sequence_flag))^00h,c
	line	260
	goto	i2l2305
	line	261
	
i2l2271:; BSR set to: 1

		movlw	10
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u110_41
	goto	i2u110_40

i2u110_41:
	goto	i2l2289
i2u110_40:
	
i2l2273:; BSR set to: 1

		decf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u111_41
	goto	i2u111_40

i2u111_41:
	goto	i2l2289
i2u111_40:
	line	265
	
i2l2275:; BSR set to: 1

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	
i2l2277:; BSR set to: 1

	incf	(0+(_receiveData+032h))&0ffh
	line	268
	
i2l2279:; BSR set to: 1

	call	_processRequest	;wreg free
	line	271
	
i2l2281:
	movlw	low(0)
	movlb	1	; () banked
	movwf	(0+(_receiveData+032h))&0ffh
	line	272
	
i2l2283:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_receiveData+033h))&0ffh
	line	273
	
i2l2285:; BSR set to: 1

	movlw	low(01h)
	movwf	((c:_interrupt_flag))^00h,c
	line	276
	
i2l2287:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_end_sequence_flag))^00h,c
	line	277
	goto	i2l2305
	line	283
	
i2l2289:; BSR set to: 1

		movlw	032h-0
	cpfslt	(0+(_receiveData+032h))&0ffh
	goto	i2u112_41
	goto	i2u112_40

i2u112_41:
	goto	i2l2303
i2u112_40:
	line	285
	
i2l2291:; BSR set to: 1

		decf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u113_41
	goto	i2u113_40

i2u113_41:
	goto	i2l2299
i2u113_40:
	line	288
	
i2l2293:; BSR set to: 1

	movlw	low(0)
	movwf	((c:_end_sequence_flag))^00h,c
	line	291
	
i2l2295:; BSR set to: 1

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0Dh)
	movwf	indf2
	
i2l2297:; BSR set to: 1

	incf	(0+(_receiveData+032h))&0ffh
	line	294
	
i2l2299:; BSR set to: 1

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:isr@receivedChar),indf2

	
i2l2301:; BSR set to: 1

	incf	(0+(_receiveData+032h))&0ffh
	line	295
	goto	i2l2305
	line	299
	
i2l2303:; BSR set to: 1

	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	308
	
i2l2305:; BSR set to: 1

	bsf	((c:3997))^0f00h,c,5	;volatile
	line	310
	
i2l132:
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
;;		line 317 in file "main.c"
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
;;		On entry : 3F/1
;;		On exit  : 3E/0
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
psect	text25,class=CODE,space=0,reloc=2,group=0
	line	317
global __ptext25
__ptext25:
psect	text25
	file	"main.c"
	line	317
	
_processRequest:
;incstack = 0
	callstack 25
	line	319
	
i2l2149:; BSR set to: 1

	line	320
	movlw	high(0)
	movwf	((c:processRequest@length_index+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@length_index))^00h,c
	line	321
	movlw	high(0)
	movwf	((c:processRequest@i+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@i))^00h,c
	line	323
	
i2l2151:; BSR set to: 1

	movff	(_requestBuffer),(_request_unit)
	line	324
	
i2l2153:; BSR set to: 1

	movff	0+(_requestBuffer+01h),0+(_request_unit+01h)
	line	330
	
i2l2155:; BSR set to: 1

		movlw	2
	movlb	0	; () banked
	xorwf	(0+(_request_unit+01h))&0ffh,w
	btfsc	status,2
	goto	i2u92_41
	goto	i2u92_40

i2u92_41:
	goto	i2l135
i2u92_40:
	line	332
	
i2l2157:; BSR set to: 0

	movlw	high(0)
	movwf	((c:processRequest@buffer_index+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@buffer_index))^00h,c
	goto	i2l2165
	line	334
	
i2l2159:
	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_requestBuffer+02h)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	line	337
	
i2l2161:
	movlw	low(02h)
	addwf	((c:processRequest@buffer_index))^00h,c,w
	movwf	((c:processRequest@length_index))^00h,c
	movlw	high(02h)
	addwfc	((c:processRequest@buffer_index+1))^00h,c,w
	movwf	1+((c:processRequest@length_index))^00h,c
	line	332
	
i2l2163:
	infsnz	((c:processRequest@buffer_index))^00h,c
	incf	((c:processRequest@buffer_index+1))^00h,c
	
i2l2165:
	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_requestBuffer+02h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	i2u93_41
	goto	i2u93_40
i2u93_41:
	goto	i2l2159
i2u93_40:
	
i2l138:
	line	341
	movff	(c:processRequest@length_index),0+(_request_unit+02h)
	movff	(c:processRequest@length_index+1),1+(_request_unit+02h)
	line	342
	goto	i2l140
	
i2l135:; BSR set to: 0

	line	344
	movff	0+(_requestBuffer+02h),0+(_request_unit+04h)
	line	345
	movff	0+(_requestBuffer+03h),0+(_request_unit+05h)
	line	351
	
i2l140:
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
