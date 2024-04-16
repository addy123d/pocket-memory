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
	FNCALL	_main,_EEPROM_Read
	FNCALL	_main,_I2C2_Init
	FNCALL	_main,_UART_Init
	FNCALL	_main,_createResponse
	FNCALL	_createResponse,_createPingResponse
	FNCALL	_createResponse,_sendResponse
	FNCALL	_createResponse,_writeDataToEEPROM
	FNCALL	_createResponse,_writePasswordToEEPROM
	FNCALL	_writePasswordToEEPROM,_EEPROM_Read
	FNCALL	_writePasswordToEEPROM,_EEPROM_Write
	FNCALL	_writePasswordToEEPROM,_UART_TransmitChar
	FNCALL	_writeDataToEEPROM,_EEPROM_Read
	FNCALL	_writeDataToEEPROM,_EEPROM_Write
	FNCALL	_writeDataToEEPROM,_writeByteAT24_EEPROM
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Send
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Start
	FNCALL	_writeByteAT24_EEPROM,_I2C2_Stop
	FNCALL	_sendResponse,_UART_TransmitChar
	FNCALL	_UART_Init,___fttol
	FNROOT	_main
	FNCALL	_isr,_processRequest
	FNCALL	intlevel2,_isr
	global	intlevel2
	FNROOT	intlevel2
	global	_checkAck
psect	idataCOMRAM,class=CODE,space=0,delta=1,noexec
global __pidataCOMRAM
__pidataCOMRAM:
	file	"main.c"
	line	78

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
	line	28

;initializer for _timeout
	dw	(03E8h)&0ffffh
	line	35

;initializer for _checkAck
	db	low(01h)
	global	_responseBuffer
	global	_PASSWORD_CACHE
	global	_at24_eeprom_address
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
       ds      10
	global	_PASSWORD_CACHE
_PASSWORD_CACHE:
       ds      9
	global	_at24_eeprom_address
_at24_eeprom_address:
       ds      2
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
	line	78
	global	_digits
	global	_digits
_digits:
       ds      10
psect	dataCOMRAM
	file	"main.c"
	line	28
	global	_timeout
	global	_timeout
_timeout:
       ds      2
psect	dataCOMRAM
	file	"main.c"
	line	35
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
; Initialize objects allocated to COMRAM (13 bytes)
	global __pidataCOMRAM
	; load TBLPTR registers with __pidataCOMRAM
	movlw	low (__pidataCOMRAM)
	movwf	tblptrl
	movlw	high(__pidataCOMRAM)
	movwf	tblptrh
	movlw	low highword(__pidataCOMRAM)
	movwf	tblptru
	lfsr	0,__pdataCOMRAM
	lfsr	1,13
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
; Clear objects allocated to COMRAM (24 bytes)
	global __pbssCOMRAM
lfsr	0,__pbssCOMRAM
movlw	24
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
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_processRequest:	; 1 bytes @ 0x0
??_processRequest:	; 1 bytes @ 0x0
?_createPingResponse:	; 1 bytes @ 0x0
?_writeDataToEEPROM:	; 1 bytes @ 0x0
?_writePasswordToEEPROM:	; 1 bytes @ 0x0
?_sendResponse:	; 1 bytes @ 0x0
?_EEPROM_Read:	; 1 bytes @ 0x0
?_I2C2_Start:	; 1 bytes @ 0x0
?_I2C2_Send:	; 1 bytes @ 0x0
?_I2C2_Stop:	; 1 bytes @ 0x0
?_I2C2_Init:	; 1 bytes @ 0x0
?_UART_Init:	; 1 bytes @ 0x0
?_UART_TransmitChar:	; 1 bytes @ 0x0
?_isr:	; 1 bytes @ 0x0
?_createResponse:	; 1 bytes @ 0x0
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
	global	writeByteAT24_EEPROM@address
writeByteAT24_EEPROM@address:	; 2 bytes @ 0xC
	ds   1
	global	sendResponse@index
sendResponse@index:	; 2 bytes @ 0xD
	ds   1
	global	writeByteAT24_EEPROM@data
writeByteAT24_EEPROM@data:	; 1 bytes @ 0xE
	global	EEPROM_Write@addr
EEPROM_Write@addr:	; 1 bytes @ 0xE
	ds   1
??_writeDataToEEPROM:	; 1 bytes @ 0xF
??_writePasswordToEEPROM:	; 1 bytes @ 0xF
??_writeByteAT24_EEPROM:	; 1 bytes @ 0xF
??___fttol:	; 1 bytes @ 0xF
	ds   2
	global	writeDataToEEPROM@at24_eep_addr_H
writeDataToEEPROM@at24_eep_addr_H:	; 1 bytes @ 0x11
	global	writePasswordToEEPROM@last_byte_addr
writePasswordToEEPROM@last_byte_addr:	; 1 bytes @ 0x11
	ds   1
	global	writeDataToEEPROM@at24_eep_addr_L
writeDataToEEPROM@at24_eep_addr_L:	; 1 bytes @ 0x12
	global	writePasswordToEEPROM@last_byte_data
writePasswordToEEPROM@last_byte_data:	; 1 bytes @ 0x12
	ds   1
	global	writePasswordToEEPROM@payload_length
writePasswordToEEPROM@payload_length:	; 1 bytes @ 0x13
	global	writeDataToEEPROM@payload_length
writeDataToEEPROM@payload_length:	; 2 bytes @ 0x13
	ds   1
	global	writePasswordToEEPROM@pic_eeprom_addr
writePasswordToEEPROM@pic_eeprom_addr:	; 1 bytes @ 0x14
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x14
	ds   1
	global	writePasswordToEEPROM@index
writePasswordToEEPROM@index:	; 1 bytes @ 0x15
	global	writeDataToEEPROM@at24_eeprom_addr_start
writeDataToEEPROM@at24_eeprom_addr_start:	; 2 bytes @ 0x15
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x15
	ds   2
	global	writeDataToEEPROM@i
writeDataToEEPROM@i:	; 2 bytes @ 0x17
	ds   2
??_createResponse:	; 1 bytes @ 0x19
	global	createResponse@ORDER_CODE
createResponse@ORDER_CODE:	; 1 bytes @ 0x19
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x19
	ds   1
??_UART_Init:	; 1 bytes @ 0x1A
	global	UART_Init@temp
UART_Init@temp:	; 3 bytes @ 0x1A
	ds   3
??_main:	; 1 bytes @ 0x1D
	ds   2
	global	main@password_length
main@password_length:	; 1 bytes @ 0x1F
	ds   1
	global	main@password_addr
main@password_addr:	; 1 bytes @ 0x20
	ds   1
	global	main@index
main@index:	; 1 bytes @ 0x21
	ds   1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        13
;!    BSS         178
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           94     34      71
;!    BANK0           160      0     154
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
;!    _createResponse->_writeDataToEEPROM
;!    _writePasswordToEEPROM->_EEPROM_Write
;!    _writeDataToEEPROM->_EEPROM_Write
;!    _writeDataToEEPROM->_writeByteAT24_EEPROM
;!    _writeByteAT24_EEPROM->_I2C2_Send
;!    _sendResponse->_UART_TransmitChar
;!    _UART_Init->___fttol
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
;! (0) _main                                                 5     5      0    2332
;!                                             29 COMRAM     5     5      0
;!                        _EEPROM_Read
;!                          _I2C2_Init
;!                          _UART_Init
;!                     _createResponse
;! ---------------------------------------------------------------------------------
;! (1) _createResponse                                       1     1      0    1799
;!                                             25 COMRAM     1     1      0
;!                 _createPingResponse
;!                       _sendResponse
;!                  _writeDataToEEPROM
;!              _writePasswordToEEPROM
;! ---------------------------------------------------------------------------------
;! (2) _writePasswordToEEPROM                                7     7      0     667
;!                                             15 COMRAM     7     7      0
;!                        _EEPROM_Read
;!                       _EEPROM_Write
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (2) _writeDataToEEPROM                                   11    11      0     972
;!                                             15 COMRAM    10    10      0
;!                        _EEPROM_Read
;!                       _EEPROM_Write
;!               _writeByteAT24_EEPROM
;! ---------------------------------------------------------------------------------
;! (3) _writeByteAT24_EEPROM                                 3     0      3     393
;!                                             12 COMRAM     3     0      3
;!                          _I2C2_Send
;!                         _I2C2_Start
;!                          _I2C2_Stop
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Stop                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Start                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _I2C2_Send                                            1     1      0      22
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (3) _EEPROM_Write                                         4     3      1     348
;!                                             11 COMRAM     4     3      1
;! ---------------------------------------------------------------------------------
;! (3) _EEPROM_Read                                          1     1      0      22
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _sendResponse                                         3     3      0     137
;!                                             12 COMRAM     3     3      0
;!                  _UART_TransmitChar
;! ---------------------------------------------------------------------------------
;! (3) _UART_TransmitChar                                    1     1      0      22
;!                                             11 COMRAM     1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _createPingResponse                                   0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _UART_Init                                            3     3      0     351
;!                                             26 COMRAM     3     3      0
;!                            ___fttol
;! ---------------------------------------------------------------------------------
;! (2) ___fttol                                             15    11      4     328
;!                                             11 COMRAM    15    11      4
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
;!   _EEPROM_Read
;!   _I2C2_Init
;!   _UART_Init
;!     ___fttol
;!   _createResponse
;!     _createPingResponse
;!     _sendResponse
;!       _UART_TransmitChar
;!     _writeDataToEEPROM
;!       _EEPROM_Read
;!       _EEPROM_Write
;!       _writeByteAT24_EEPROM
;!         _I2C2_Send
;!         _I2C2_Start
;!         _I2C2_Stop
;!     _writePasswordToEEPROM
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
;!BANK1              100      0       0       6        0.0%
;!BITBANK0            A0      0       0       3        0.0%
;!BANK0               A0      0      9A       4       96.2%
;!BITCOMRAM           5E      0       0       0        0.0%
;!COMRAM              5E     22      47       1       75.5%
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
;!ABS                  0      0      E1      26        0.0%
;!DATA                 0      0      E1      28        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 598 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1   33[COMRAM] unsigned char 
;;  password_add    1   32[COMRAM] unsigned char 
;;  password_len    1   31[COMRAM] unsigned char 
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
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:         5       0       0       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_EEPROM_Read
;;		_I2C2_Init
;;		_UART_Init
;;		_createResponse
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	598
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	598
	
_main:
;incstack = 0
	callstack 25
	line	601
	
l1712:
	movlw	low(070h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	602
	movlw	low(0C0h)
	movwf	((c:3995))^0f00h,c	;volatile
	line	617
	
l1714:
	call	_UART_Init	;wreg free
	line	618
	
l1716:
	call	_I2C2_Init	;wreg free
	line	620
	
l1718:; BSR set to: 15

	line	621
	
l1720:; BSR set to: 15

	movlw	low(0)
	movwf	((c:main@password_addr))^00h,c
	line	624
	
l1722:; BSR set to: 15

	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u797:
decfsz	wreg,f
	bra	u797
	decfsz	(??_main+0+0)^00h,c,f
	bra	u797
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u797
	nop
asmopt pop

	line	625
	
l1724:
	movlw	(0)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:main@password_length))^00h,c
	line	626
	
l1726:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u807:
decfsz	wreg,f
	bra	u807
	decfsz	(??_main+0+0)^00h,c,f
	bra	u807
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u807
	nop
asmopt pop

	line	627
	
l1728:
	incf	((c:main@password_addr))^00h,c
	line	629
	
l1730:
		incf	((c:main@password_length))^00h,c,w
	btfsc	status,2
	goto	u761
	goto	u760

u761:
	goto	l1744
u760:
	line	631
	
l1732:
	movlw	low(0)
	movwf	((c:main@index))^00h,c
	goto	l1742
	line	632
	
l1734:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u817:
decfsz	wreg,f
	bra	u817
	decfsz	(??_main+0+0)^00h,c,f
	bra	u817
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u817
	nop
asmopt pop

	line	633
	
l1736:
	movf	((c:main@index))^00h,c,w
	addlw	low(_PASSWORD_CACHE)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:main@password_addr))^00h,c,w
	addwf	((c:main@index))^00h,c,w
	
	call	_EEPROM_Read
	movwf	indf2,c

	line	634
	
l1738:
	asmopt push
asmopt off
movlw  41
movwf	(??_main+0+0+1)^00h,c
movlw	150
movwf	(??_main+0+0)^00h,c
	movlw	127
u827:
decfsz	wreg,f
	bra	u827
	decfsz	(??_main+0+0)^00h,c,f
	bra	u827
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u827
	nop
asmopt pop

	line	631
	
l1740:
	incf	((c:main@index))^00h,c
	
l1742:
		movf	((c:main@password_length))^00h,c,w
	subwf	((c:main@index))^00h,c,w
	btfss	status,0
	goto	u771
	goto	u770

u771:
	goto	l1734
u770:
	line	641
	
l1744:
	movf	((c:_interrupt_flag))^00h,c,w
	btfsc	status,2
	goto	u781
	goto	u780
u781:
	goto	l1744
u780:
	line	643
	
l1746:
	call	_createResponse	;wreg free
	line	644
	
l1748:
	movlw	low(0)
	movwf	((c:_interrupt_flag))^00h,c
	goto	l1744
	global	start
	goto	start
	callstack 0
	line	647
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_createResponse

;; *************** function _createResponse *****************
;; Defined at:
;;		line 308 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ORDER_CODE      1   25[COMRAM] unsigned char 
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
;;      Locals:         1       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_createPingResponse
;;		_sendResponse
;;		_writeDataToEEPROM
;;		_writePasswordToEEPROM
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	line	308
global __ptext1
__ptext1:
psect	text1
	file	"main.c"
	line	308
	
_createResponse:
;incstack = 0
	callstack 25
	line	310
	
l1634:
	movff	0+(_request_unit+01h),(c:createResponse@ORDER_CODE)
	line	313
	
l1636:
		movlw	33
	movlb	0	; () banked
	xorwf	((_request_unit))&0ffh,w
	btfss	status,2
	goto	u631
	goto	u630

u631:
	goto	l131
u630:
	goto	l1648
	line	319
	
l1640:; BSR set to: 0

	call	_createPingResponse	;wreg free
	line	320
	goto	l1650
	line	322
	
l1642:; BSR set to: 0

	call	_writeDataToEEPROM	;wreg free
	line	323
	goto	l1650
	line	331
	
l1644:; BSR set to: 0

	call	_writePasswordToEEPROM	;wreg free
	line	332
	goto	l1650
	line	316
	
l1648:; BSR set to: 0

	movf	((c:createResponse@ORDER_CODE))^00h,c,w
	; Switch size 1, requested type "simple"
; Number of cases is 6, Range of values is 1 to 241
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l1642
	xorlw	2^1	; case 2
	skipnz
	goto	l1650
	xorlw	3^2	; case 3
	skipnz
	goto	l1650
	xorlw	4^3	; case 4
	skipnz
	goto	l1650
	xorlw	17^4	; case 17
	skipnz
	goto	l1640
	xorlw	241^17	; case 241
	skipnz
	goto	l1644
	goto	l1650

	line	338
	
l1650:
	call	_sendResponse	;wreg free
	line	340
	
l131:
	return	;funcret
	callstack 0
GLOBAL	__end_of_createResponse
	__end_of_createResponse:
	signat	_createResponse,89
	global	_writePasswordToEEPROM

;; *************** function _writePasswordToEEPROM *****************
;; Defined at:
;;		line 431 in file "main.c"
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
	line	431
global __ptext2
__ptext2:
psect	text2
	file	"main.c"
	line	431
	
_writePasswordToEEPROM:
;incstack = 0
	callstack 26
	line	432
	
l1484:
	line	433
	movlw	low(0)
	movwf	((c:writePasswordToEEPROM@index))^00h,c
	line	435
	movlw	low(0)
	movwf	((c:writePasswordToEEPROM@last_byte_addr))^00h,c
	line	436
	movlw	low(0)
	movwf	((c:writePasswordToEEPROM@last_byte_data))^00h,c
	line	438
	movlw	low(0)
	movwf	((c:writePasswordToEEPROM@pic_eeprom_addr))^00h,c
	line	441
	
l1486:
	movlb	0	; () banked
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writePasswordToEEPROM@payload_length))^00h,c
	line	449
	
l1488:; BSR set to: 0

		movlw	09h-1
	cpfsgt	((c:writePasswordToEEPROM@payload_length))^00h,c
	goto	u501
	goto	u500

u501:
	goto	l1494
u500:
	line	450
	
l1490:; BSR set to: 0

	movlw	(0FFh)&0ffh
	
	call	_UART_TransmitChar
	goto	l145
	line	456
	
l1494:; BSR set to: 0

	asmopt push
asmopt off
movlw  82
movwf	(??_writePasswordToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writePasswordToEEPROM+0+0)^00h,c
	movlw	0
u837:
decfsz	wreg,f
	bra	u837
	decfsz	(??_writePasswordToEEPROM+0+0)^00h,c,f
	bra	u837
	decfsz	(??_writePasswordToEEPROM+0+0+1)^00h,c,f
	bra	u837
	nop2
asmopt pop

	line	457
	
l1496:
	movff	(c:writePasswordToEEPROM@payload_length),(c:EEPROM_Write@eep_data)
	movlw	(0)&0ffh
	
	call	_EEPROM_Write
	line	458
	
l1498:
	asmopt push
asmopt off
movlw  82
movwf	(??_writePasswordToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writePasswordToEEPROM+0+0)^00h,c
	movlw	0
u847:
decfsz	wreg,f
	bra	u847
	decfsz	(??_writePasswordToEEPROM+0+0)^00h,c,f
	bra	u847
	decfsz	(??_writePasswordToEEPROM+0+0+1)^00h,c,f
	bra	u847
	nop2
asmopt pop

	line	461
	
l1500:
	incf	((c:writePasswordToEEPROM@pic_eeprom_addr))^00h,c
	line	464
	
l1502:
	movlw	low(0)
	movwf	((c:writePasswordToEEPROM@index))^00h,c
	goto	l1514
	line	465
	
l1504:
	asmopt push
asmopt off
movlw  41
movwf	(??_writePasswordToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writePasswordToEEPROM+0+0)^00h,c
	movlw	127
u857:
decfsz	wreg,f
	bra	u857
	decfsz	(??_writePasswordToEEPROM+0+0)^00h,c,f
	bra	u857
	decfsz	(??_writePasswordToEEPROM+0+0+1)^00h,c,f
	bra	u857
	nop
asmopt pop

	line	466
	
l1506:
	movf	((c:writePasswordToEEPROM@index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:EEPROM_Write@eep_data))^00h,c
	movf	((c:writePasswordToEEPROM@pic_eeprom_addr))^00h,c,w
	addwf	((c:writePasswordToEEPROM@index))^00h,c,w
	
	call	_EEPROM_Write
	line	467
	
l1508:
	asmopt push
asmopt off
movlw  41
movwf	(??_writePasswordToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writePasswordToEEPROM+0+0)^00h,c
	movlw	127
u867:
decfsz	wreg,f
	bra	u867
	decfsz	(??_writePasswordToEEPROM+0+0)^00h,c,f
	bra	u867
	decfsz	(??_writePasswordToEEPROM+0+0+1)^00h,c,f
	bra	u867
	nop
asmopt pop

	line	469
	
l1510:
	movf	((c:writePasswordToEEPROM@pic_eeprom_addr))^00h,c,w
	addwf	((c:writePasswordToEEPROM@index))^00h,c,w
	movwf	((c:writePasswordToEEPROM@last_byte_addr))^00h,c
	line	464
	
l1512:
	incf	((c:writePasswordToEEPROM@index))^00h,c
	
l1514:
		movf	((c:writePasswordToEEPROM@payload_length))^00h,c,w
	subwf	((c:writePasswordToEEPROM@index))^00h,c,w
	btfss	status,0
	goto	u511
	goto	u510

u511:
	goto	l1504
u510:
	line	472
	
l1516:
	asmopt push
asmopt off
movlw  9
movwf	(??_writePasswordToEEPROM+0+0+1)^00h,c
movlw	30
movwf	(??_writePasswordToEEPROM+0+0)^00h,c
	movlw	228
u877:
decfsz	wreg,f
	bra	u877
	decfsz	(??_writePasswordToEEPROM+0+0)^00h,c,f
	bra	u877
	decfsz	(??_writePasswordToEEPROM+0+0+1)^00h,c,f
	bra	u877
	nop2
asmopt pop

	line	473
	
l1518:
	movf	((c:writePasswordToEEPROM@last_byte_addr))^00h,c,w
	
	call	_EEPROM_Read
	movwf	((c:writePasswordToEEPROM@last_byte_data))^00h,c
	line	474
	
l1520:
	asmopt push
asmopt off
movlw  9
movwf	(??_writePasswordToEEPROM+0+0+1)^00h,c
movlw	30
movwf	(??_writePasswordToEEPROM+0+0)^00h,c
	movlw	228
u887:
decfsz	wreg,f
	bra	u887
	decfsz	(??_writePasswordToEEPROM+0+0)^00h,c,f
	bra	u887
	decfsz	(??_writePasswordToEEPROM+0+0+1)^00h,c,f
	bra	u887
	nop2
asmopt pop

	line	477
	
l1522:
	movff	(_request_unit),(c:_responseBuffer)
	line	478
	
l1524:
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	479
	
l1526:
	movff	(c:writePasswordToEEPROM@last_byte_data),0+((c:_responseBuffer)+02h)
	line	480
	
l1528:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+03h))^00h,c
	line	481
	
l1530:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+04h))^00h,c
	line	483
	
l145:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writePasswordToEEPROM
	__end_of_writePasswordToEEPROM:
	signat	_writePasswordToEEPROM,89
	global	_writeDataToEEPROM

;; *************** function _writeDataToEEPROM *****************
;; Defined at:
;;		line 361 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   23[COMRAM] unsigned short 
;;  at24_eeprom_    2   21[COMRAM] unsigned short 
;;  payload_leng    2   19[COMRAM] unsigned short 
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
;;      Locals:         8       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0
;;      Totals:        10       0       0       0       0       0       0
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
	line	361
global __ptext3
__ptext3:
psect	text3
	file	"main.c"
	line	361
	
_writeDataToEEPROM:
;incstack = 0
	callstack 25
	line	364
	
l1428:
	line	365
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_addr_H))^00h,c
	line	366
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eep_addr_L))^00h,c
	line	367
	movlw	high(0)
	movwf	((c:writeDataToEEPROM@at24_eeprom_addr_start+1))^00h,c
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@at24_eeprom_addr_start))^00h,c
	line	373
	
l1430:
	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:writeDataToEEPROM@at24_eep_addr_H))^00h,c
	line	374
	
l1432:
	asmopt push
asmopt off
movlw  41
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	150
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	127
u897:
decfsz	wreg,f
	bra	u897
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u897
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u897
	nop
asmopt pop

	line	375
	
l1434:
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Read
	movwf	((c:writeDataToEEPROM@at24_eep_addr_L))^00h,c
	line	379
	
l1436:
	movf	((c:writeDataToEEPROM@at24_eep_addr_L))^00h,c,w
	movff	(c:writeDataToEEPROM@at24_eep_addr_H),??_writeDataToEEPROM+0+0
	clrf	(??_writeDataToEEPROM+0+0+1)^00h,c
	movff	??_writeDataToEEPROM+0+0,??_writeDataToEEPROM+0+1
	clrf	(??_writeDataToEEPROM+0+0)^00h,c
	iorwf	(??_writeDataToEEPROM+0+0)^00h,c,w
	movwf	((c:_at24_eeprom_address))^00h,c
	movf	(??_writeDataToEEPROM+0+1)^00h,c,w
	movwf	1+((c:_at24_eeprom_address))^00h,c
	line	382
	
l1438:
		incf	((c:_at24_eeprom_address))^00h,c,w
	bnz	u461
	incf	((c:_at24_eeprom_address+1))^00h,c,w
	btfss	status,2
	goto	u461
	goto	u460

u461:
	goto	l1442
u460:
	line	383
	
l1440:
	movlw	high(0)
	movwf	((c:_at24_eeprom_address+1))^00h,c
	movlw	low(0)
	movwf	((c:_at24_eeprom_address))^00h,c
	line	386
	
l1442:
	movff	(c:_at24_eeprom_address),(c:writeDataToEEPROM@at24_eeprom_addr_start)
	movff	(c:_at24_eeprom_address+1),(c:writeDataToEEPROM@at24_eeprom_addr_start+1)
	line	389
	
l1444:
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
	line	392
	
l1446:; BSR set to: 0

	movff	(c:_at24_eeprom_address),(c:writeByteAT24_EEPROM@address)
	movff	(c:_at24_eeprom_address+1),(c:writeByteAT24_EEPROM@address+1)
	movf	(0+(_request_unit+02h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	movwf	((c:writeByteAT24_EEPROM@data))^00h,c
	call	_writeByteAT24_EEPROM	;wreg free
	line	393
	
l1448:
	infsnz	((c:_at24_eeprom_address))^00h,c
	incf	((c:_at24_eeprom_address+1))^00h,c
	line	395
	
l1450:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u907:
decfsz	wreg,f
	bra	u907
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u907
asmopt pop

	line	398
	
l1452:
	movlw	high(0)
	movwf	((c:writeDataToEEPROM@i+1))^00h,c
	movlw	low(0)
	movwf	((c:writeDataToEEPROM@i))^00h,c
	goto	l1460
	line	399
	
l1454:
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
	line	400
	
l1456:
	asmopt push
asmopt off
movlw	208
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	202
u917:
decfsz	wreg,f
	bra	u917
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u917
asmopt pop

	line	398
	
l1458:
	infsnz	((c:writeDataToEEPROM@i))^00h,c
	incf	((c:writeDataToEEPROM@i+1))^00h,c
	
l1460:
		movf	((c:writeDataToEEPROM@payload_length))^00h,c,w
	subwf	((c:writeDataToEEPROM@i))^00h,c,w
	movf	((c:writeDataToEEPROM@payload_length+1))^00h,c,w
	subwfb	((c:writeDataToEEPROM@i+1))^00h,c,w
	btfss	status,0
	goto	u471
	goto	u470

u471:
	goto	l1454
u470:
	line	404
	
l1462:
	movf	((c:writeDataToEEPROM@payload_length))^00h,c,w
	addwf	((c:_at24_eeprom_address))^00h,c
	movf	((c:writeDataToEEPROM@payload_length+1))^00h,c,w
	addwfc	((c:_at24_eeprom_address+1))^00h,c

	line	410
	
l1464:
	asmopt push
asmopt off
movlw  82
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	0
u927:
decfsz	wreg,f
	bra	u927
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u927
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u927
	nop2
asmopt pop

	line	412
	
l1466:
	movff	0+((c:_at24_eeprom_address)+01h),(c:EEPROM_Write@eep_data)
	movlw	(0Ah)&0ffh
	
	call	_EEPROM_Write
	line	413
	
l1468:
	asmopt push
asmopt off
movlw  82
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	0
u937:
decfsz	wreg,f
	bra	u937
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u937
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u937
	nop2
asmopt pop

	line	414
	
l1470:
	movff	(c:_at24_eeprom_address),(c:EEPROM_Write@eep_data)
	movlw	(0Bh)&0ffh
	
	call	_EEPROM_Write
	line	415
	
l1472:
	asmopt push
asmopt off
movlw  82
movwf	(??_writeDataToEEPROM+0+0+1)^00h,c
movlw	43
movwf	(??_writeDataToEEPROM+0+0)^00h,c
	movlw	0
u947:
decfsz	wreg,f
	bra	u947
	decfsz	(??_writeDataToEEPROM+0+0)^00h,c,f
	bra	u947
	decfsz	(??_writeDataToEEPROM+0+0+1)^00h,c,f
	bra	u947
	nop2
asmopt pop

	line	418
	
l1474:
	movff	(_request_unit),(c:_responseBuffer)
	line	419
	
l1476:
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	420
	
l1478:
	movff	0+((c:writeDataToEEPROM@at24_eeprom_addr_start)+01h),0+((c:_responseBuffer)+02h)
	line	421
	
l1480:
	movff	(c:writeDataToEEPROM@at24_eeprom_addr_start),0+((c:_responseBuffer)+03h)
	line	422
	
l1482:
	movf	((c:_checkAck))^00h,c,w
	btfsc	status,2
	goto	u481
	goto	u480
u481:
	movlw	1
	goto	u490
u480:
	movlw	0
u490:
	movwf	(0+((c:_responseBuffer)+04h))^00h,c
	line	423
	
l141:
	return	;funcret
	callstack 0
GLOBAL	__end_of_writeDataToEEPROM
	__end_of_writeDataToEEPROM:
	signat	_writeDataToEEPROM,89
	global	_writeByteAT24_EEPROM

;; *************** function _writeByteAT24_EEPROM *****************
;; Defined at:
;;		line 490 in file "main.c"
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
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	line	490
global __ptext4
__ptext4:
psect	text4
	file	"main.c"
	line	490
	
_writeByteAT24_EEPROM:
;incstack = 0
	callstack 25
	line	492
	
l1392:
	call	_I2C2_Start	;wreg free
	line	493
	
l1394:
	movlw	(0A0h)&0ffh
	
	call	_I2C2_Send
	movwf	((c:_checkAck))^00h,c
	line	494
	
l1396:
	movf	(0+((c:writeByteAT24_EEPROM@address)+01h))^00h,c,w
	
	call	_I2C2_Send
	line	495
	
l1398:
	movf	((c:writeByteAT24_EEPROM@address))^00h,c,w
	
	call	_I2C2_Send
	line	496
	
l1400:
	movf	((c:writeByteAT24_EEPROM@data))^00h,c,w
	
	call	_I2C2_Send
	line	497
	call	_I2C2_Stop	;wreg free
	line	498
	
l151:
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
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	82
global __ptext5
__ptext5:
psect	text5
	file	"i2c.c"
	line	82
	
_I2C2_Stop:
;incstack = 0
	callstack 25
	line	83
	
l1376:
	bsf	((c:4037))^0f00h,c,2	;volatile
	line	84
	
l215:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u431
	goto	u430
u431:
	goto	l215
u430:
	
l217:
	line	85
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	86
	
l218:
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
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	51
global __ptext6
__ptext6:
psect	text6
	file	"i2c.c"
	line	51
	
_I2C2_Start:
;incstack = 0
	callstack 25
	line	52
	
l1372:
	bsf	((c:4037))^0f00h,c,0	;volatile
	line	53
	
l203:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u401
	goto	u400
u401:
	goto	l203
u400:
	
l205:
	line	54
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	55
	
l206:
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
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	131
global __ptext7
__ptext7:
psect	text7
	file	"i2c.c"
	line	131
	
_I2C2_Send:
;incstack = 0
	callstack 25
	movwf	((c:I2C2_Send@BYTE))^00h,c
	line	132
	
l1374:
	movff	(c:I2C2_Send@BYTE),(c:4041)	;volatile
	line	133
	
l233:
	btfss	((c:3998))^0f00h,c,3	;volatile
	goto	u411
	goto	u410
u411:
	goto	l233
u410:
	
l235:
	line	134
	bcf	((c:3998))^0f00h,c,3	;volatile
	line	135
	btfsc	((c:4037))^0f00h,c,6	;volatile
	goto	u421
	goto	u420
u421:
	movlw	1
	goto	u426
u420:
	movlw	0
u426:
	line	136
	
l236:
	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Send
	__end_of_I2C2_Send:
	signat	_I2C2_Send,4217
	global	_EEPROM_Write

;; *************** function _EEPROM_Write *****************
;; Defined at:
;;		line 541 in file "main.c"
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
;;		_writePasswordToEEPROM
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	541
global __ptext8
__ptext8:
psect	text8
	file	"main.c"
	line	541
	
_EEPROM_Write:
;incstack = 0
	callstack 26
	movwf	((c:EEPROM_Write@addr))^00h,c
	line	542
	
l1402:
	asmopt push
asmopt off
movlw  82
movwf	(??_EEPROM_Write+0+0+1)^00h,c
movlw	43
movwf	(??_EEPROM_Write+0+0)^00h,c
	movlw	0
u957:
decfsz	wreg,f
	bra	u957
	decfsz	(??_EEPROM_Write+0+0)^00h,c,f
	bra	u957
	decfsz	(??_EEPROM_Write+0+0+1)^00h,c,f
	bra	u957
	nop2
asmopt pop

	line	544
	
l1404:
	movff	(c:EEPROM_Write@addr),(c:4009)	;volatile
	line	545
	
l1406:
	movff	(c:EEPROM_Write@eep_data),(c:4008)	;volatile
	line	547
	
l1408:
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	548
	
l1410:
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	549
	
l1412:
	bsf	((c:4006))^0f00h,c,2	;volsfr
	line	551
	
l1414:
	bcf	((c:4082))^0f00h,c,7	;volatile
	line	554
	
l1416:
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	555
	
l1418:
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	556
	
l1420:
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	558
	
l1422:
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	561
	
l162:
	btfss	((c:4001))^0f00h,c,4	;volatile
	goto	u451
	goto	u450
u451:
	goto	l162
u450:
	
l164:
	line	563
	bcf	((c:4001))^0f00h,c,4	;volatile
	line	564
	
l165:
	return	;funcret
	callstack 0
GLOBAL	__end_of_EEPROM_Write
	__end_of_EEPROM_Write:
	signat	_EEPROM_Write,8313
	global	_EEPROM_Read

;; *************** function _EEPROM_Read *****************
;; Defined at:
;;		line 571 in file "main.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1   11[COMRAM] unsigned char 
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
;;		_writePasswordToEEPROM
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	line	571
global __ptext9
__ptext9:
psect	text9
	file	"main.c"
	line	571
	
_EEPROM_Read:
;incstack = 0
	callstack 26
	movwf	((c:EEPROM_Read@addr))^00h,c
	line	572
	
l1382:
	movff	(c:EEPROM_Read@addr),(c:4009)	;volatile
	line	573
	
l1384:
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	574
	
l1386:
	bsf	((c:4006))^0f00h,c,0	;volsfr
	line	576
	
l1388:
	movf	((c:4008))^0f00h,c,w	;volatile
	line	577
	
l168:
	return	;funcret
	callstack 0
GLOBAL	__end_of_EEPROM_Read
	__end_of_EEPROM_Read:
	signat	_EEPROM_Read,4217
	global	_sendResponse

;; *************** function _sendResponse *****************
;; Defined at:
;;		line 506 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           2   13[COMRAM] unsigned int 
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
;;      Temps:          1       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_UART_TransmitChar
;; This function is called by:
;;		_createResponse
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,group=0
	line	506
global __ptext10
__ptext10:
psect	text10
	file	"main.c"
	line	506
	
_sendResponse:
;incstack = 0
	callstack 26
	line	508
	
l1532:
	line	511
	
l1534:
	movlw	(03Ah)&0ffh
	
	call	_UART_TransmitChar
	line	512
	
l1536:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u967:
decfsz	wreg,f
	bra	u967
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u967
asmopt pop

	line	513
	
l1538:
	movlw	(023h)&0ffh
	
	call	_UART_TransmitChar
	line	514
	
l1540:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u977:
decfsz	wreg,f
	bra	u977
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u977
asmopt pop

	line	516
	movlw	high(0)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(0)
	movwf	((c:sendResponse@index))^00h,c
	line	518
	
l1546:
	movf	((c:sendResponse@index))^00h,c,w
	addlw	low(_responseBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	
	call	_UART_TransmitChar
	line	519
	
l1548:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u987:
decfsz	wreg,f
	bra	u987
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u987
asmopt pop

	line	516
	
l1550:
	infsnz	((c:sendResponse@index))^00h,c
	incf	((c:sendResponse@index+1))^00h,c
	
l1552:
		movf	((c:sendResponse@index+1))^00h,c,w
	bnz	u520
	movlw	10
	subwf	 ((c:sendResponse@index))^00h,c,w
	btfss	status,0
	goto	u521
	goto	u520

u521:
	goto	l1546
u520:
	line	523
	
l1554:
	movlw	(0Dh)&0ffh
	
	call	_UART_TransmitChar
	line	524
	
l1556:
	asmopt push
asmopt off
movlw	208
movwf	(??_sendResponse+0+0)^00h,c
	movlw	202
u997:
decfsz	wreg,f
	bra	u997
	decfsz	(??_sendResponse+0+0)^00h,c,f
	bra	u997
asmopt pop

	line	525
	
l1558:
	movlw	(0Ah)&0ffh
	
	call	_UART_TransmitChar
	line	529
	
l1560:
	movlw	high(032h)
	movwf	((c:sendResponse@index+1))^00h,c
	movlw	low(032h)
	movwf	((c:sendResponse@index))^00h,c
	line	530
	goto	l1566
	line	531
	
l1562:
	movf	((c:sendResponse@index))^00h,c,w
	sublw	low(_requestBuffer+032h)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0FFh)
	movwf	indf2
	line	532
	
l1564:
	decf	((c:sendResponse@index))^00h,c
	btfss	status,0
	decf	((c:sendResponse@index+1))^00h,c
	line	530
	
l1566:
	movf	((c:sendResponse@index))^00h,c,w
iorwf	((c:sendResponse@index+1))^00h,c,w
	btfss	status,2
	goto	u531
	goto	u530

u531:
	goto	l1562
u530:
	line	534
	
l159:
	return	;funcret
	callstack 0
GLOBAL	__end_of_sendResponse
	__end_of_sendResponse:
	signat	_sendResponse,89
	global	_UART_TransmitChar

;; *************** function _UART_TransmitChar *****************
;; Defined at:
;;		line 169 in file "main.c"
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
;;		_writePasswordToEEPROM
;;		_sendResponse
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,group=0
	line	169
global __ptext11
__ptext11:
psect	text11
	file	"main.c"
	line	169
	
_UART_TransmitChar:
;incstack = 0
	callstack 26
	movwf	((c:UART_TransmitChar@data))^00h,c
	line	171
	
l1378:
	
l92:
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	u441
	goto	u440
u441:
	goto	l92
u440:
	line	172
	
l1380:
	movff	(c:UART_TransmitChar@data),(c:4013)	;volatile
	line	173
	
l95:
	return	;funcret
	callstack 0
GLOBAL	__end_of_UART_TransmitChar
	__end_of_UART_TransmitChar:
	signat	_UART_TransmitChar,4217
	global	_createPingResponse

;; *************** function _createPingResponse *****************
;; Defined at:
;;		line 348 in file "main.c"
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
psect	text12,class=CODE,space=0,reloc=2,group=0
	line	348
global __ptext12
__ptext12:
psect	text12
	file	"main.c"
	line	348
	
_createPingResponse:
;incstack = 0
	callstack 27
	line	350
	
l1424:
	movff	(_request_unit),(c:_responseBuffer)
	line	351
	movff	0+(_request_unit+01h),0+((c:_responseBuffer)+01h)
	line	352
	
l1426:
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+02h))^00h,c
	line	353
	movlw	low(0)
	movwf	(0+((c:_responseBuffer)+03h))^00h,c
	line	354
	
l134:
	return	;funcret
	callstack 0
GLOBAL	__end_of_createPingResponse
	__end_of_createPingResponse:
	signat	_createPingResponse,89
	global	_UART_Init

;; *************** function _UART_Init *****************
;; Defined at:
;;		line 100 in file "main.c"
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
psect	text13,class=CODE,space=0,reloc=2,group=0
	line	100
global __ptext13
__ptext13:
psect	text13
	file	"main.c"
	line	100
	
_UART_Init:
;incstack = 0
	callstack 27
	line	104
	
l1614:
	bcf	c:(31910/8),(31910)&7	;volatile
	line	105
	bsf	c:(31911/8),(31911)&7	;volatile
	line	106
	movlb	15	; () banked
	bcf	((3898))&0ffh,7	;volatile
	line	109
	bsf	((c:4082))^0f00h,c,7	;volatile
	line	110
	bsf	((c:4082))^0f00h,c,6	;volatile
	line	111
	bsf	((c:3997))^0f00h,c,5	;volatile
	line	114
	
l1616:; BSR set to: 15

	movlw	low(020h)
	movwf	((c:4012))^0f00h,c	;volatile
	line	115
	movlw	low(090h)
	movwf	((c:4011))^0f00h,c	;volatile
	line	118
	movlw	low(float24(103.16666666666667))
	movwf	((c:UART_Init@temp))^00h,c
	movlw	high(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+1))^00h,c
	movlw	low highword(float24(103.16666666666667))
	movwf	((c:UART_Init@temp+2))^00h,c

	line	119
	
l1618:; BSR set to: 15

	movff	(c:UART_Init@temp),(c:___fttol@f1)
	movff	(c:UART_Init@temp+1),(c:___fttol@f1+1)
	movff	(c:UART_Init@temp+2),(c:___fttol@f1+2)
	call	___fttol	;wreg free
	movf	(0+?___fttol)^00h,c,w
	movwf	((c:4015))^0f00h,c	;volatile
	line	162
	
l89:
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
psect	text14,class=CODE,space=0,reloc=2,group=1
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
global __ptext14
__ptext14:
psect	text14
	file	"C:\Program Files\Microchip\xc8\v2.46\pic\sources\c90\common\fttol.c"
	line	44
	
___fttol:
;incstack = 0
	callstack 27
	line	49
	
l1568:; BSR set to: 15

	movff	(c:___fttol@f1+2),??___fttol+0+0
	clrf	(??___fttol+0+0+1)^00h,c
	clrf	(??___fttol+0+0+2)^00h,c
	rlcf	((c:___fttol@f1+1))^00h,c,w
	rlcf	(??___fttol+0+0)^00h,c
	bnc	u541
	bsf	(??___fttol+0+0+1)^00h,c,0
u541:
	movf	(??___fttol+0+0)^00h,c,w
	movwf	((c:___fttol@exp1))^00h,c
	movf	((c:___fttol@exp1))^00h,c,w
	btfss	status,2
	goto	u551
	goto	u550
u551:
	goto	l1574
u550:
	line	50
	
l1570:
	movlw	low(0)
	movwf	((c:?___fttol))^00h,c
	movlw	high(0)
	movwf	((c:?___fttol+1))^00h,c
	movlw	low highword(0)
	movwf	((c:?___fttol+2))^00h,c
	movlw	high highword(0)
	movwf	((c:?___fttol+3))^00h,c
	goto	l619
	line	51
	
l1574:; BSR set to: 15

	movlw	(017h)&0ffh
	movwf	(??___fttol+0+0)^00h,c
	movff	(c:___fttol@f1),??___fttol+1+0
	movff	(c:___fttol@f1+1),??___fttol+1+0+1
	movff	(c:___fttol@f1+2),??___fttol+1+0+2
	incf	((??___fttol+0+0))^00h,c,w
	movwf	(??___fttol+4+0)^00h,c
	goto	u560
u565:
	bcf	status,0
	rrcf	(??___fttol+1+2)^00h,c
	rrcf	(??___fttol+1+1)^00h,c
	rrcf	(??___fttol+1+0)^00h,c
u560:
	decfsz	(??___fttol+4+0)^00h,c
	goto	u565
	movf	(??___fttol+1+0)^00h,c,w
	movwf	((c:___fttol@sign1))^00h,c
	line	52
	
l1576:
	bsf	(0+(15/8)+(c:___fttol@f1))^00h,c,(15)&7
	line	53
	
l1578:
	movlw	low(0FFFFh)
	andwf	((c:___fttol@f1))^00h,c
	movlw	high(0FFFFh)
	andwf	((c:___fttol@f1+1))^00h,c
	movlw	low highword(0FFFFh)
	andwf	((c:___fttol@f1+2))^00h,c

	line	54
	
l1580:
	movf	((c:___fttol@f1))^00h,c,w
	movwf	((c:___fttol@lval))^00h,c
	movf	((c:___fttol@f1+1))^00h,c,w
	movwf	1+((c:___fttol@lval))^00h,c
	
	movf	((c:___fttol@f1+2))^00h,c,w
	movwf	2+((c:___fttol@lval))^00h,c
	
	clrf	3+((c:___fttol@lval))^00h,c
	
	line	55
	
l1582:
	movlw	(08Eh)&0ffh
	subwf	((c:___fttol@exp1))^00h,c
	line	56
	
l1584:
	btfsc	((c:___fttol@exp1))^00h,c,7
	goto	u570
	goto	u571

u571:
	goto	l1596
u570:
	line	57
	
l1586:
		movf	((c:___fttol@exp1))^00h,c,w
	xorlw	80h
	addlw	-(80h^-15)
	btfsc	status,0
	goto	u581
	goto	u580

u581:
	goto	l1592
u580:
	goto	l1570
	line	60
	
l1592:
	bcf	status,0
	rrcf	((c:___fttol@lval+3))^00h,c
	rrcf	((c:___fttol@lval+2))^00h,c
	rrcf	((c:___fttol@lval+1))^00h,c
	rrcf	((c:___fttol@lval))^00h,c
	line	61
	
l1594:
	incfsz	((c:___fttol@exp1))^00h,c
	
	goto	l1592
	goto	l1606
	line	63
	
l1596:
		movlw	018h-1
	cpfsgt	((c:___fttol@exp1))^00h,c
	goto	u591
	goto	u590

u591:
	goto	l1604
u590:
	goto	l1570
	line	66
	
l1602:
	bcf	status,0
	rlcf	((c:___fttol@lval))^00h,c
	rlcf	((c:___fttol@lval+1))^00h,c
	rlcf	((c:___fttol@lval+2))^00h,c
	rlcf	((c:___fttol@lval+3))^00h,c
	line	67
	decf	((c:___fttol@exp1))^00h,c
	line	65
	
l1604:
	movf	((c:___fttol@exp1))^00h,c,w
	btfss	status,2
	goto	u601
	goto	u600
u601:
	goto	l1602
u600:
	line	70
	
l1606:
	movf	((c:___fttol@sign1))^00h,c,w
	btfsc	status,2
	goto	u611
	goto	u610
u611:
	goto	l1610
u610:
	line	71
	
l1608:
	comf	((c:___fttol@lval+3))^00h,c
	comf	((c:___fttol@lval+2))^00h,c
	comf	((c:___fttol@lval+1))^00h,c
	negf	((c:___fttol@lval))^00h,c
	movlw	0
	addwfc	((c:___fttol@lval+1))^00h,c
	addwfc	((c:___fttol@lval+2))^00h,c
	addwfc	((c:___fttol@lval+3))^00h,c
	line	72
	
l1610:
	movff	(c:___fttol@lval),(c:?___fttol)
	movff	(c:___fttol@lval+1),(c:?___fttol+1)
	movff	(c:___fttol@lval+2),(c:?___fttol+2)
	movff	(c:___fttol@lval+3),(c:?___fttol+3)
	line	73
	
l619:
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
psect	text15,class=CODE,space=0,reloc=2,group=0
	file	"i2c.c"
	line	20
global __ptext15
__ptext15:
psect	text15
	file	"i2c.c"
	line	20
	
_I2C2_Init:
;incstack = 0
	callstack 28
	line	21
	
l1270:
	bsf	((c:3988))^0f00h,c,4	;volatile
	line	22
	bsf	((c:3988))^0f00h,c,3	;volatile
	line	25
	movlb	15	; () banked
	bcf	((3898))&0ffh,3	;volatile
	line	26
	bcf	((3898))&0ffh,4	;volatile
	line	28
	
l1272:; BSR set to: 15

	movlw	low(080h)
	movwf	((c:4039))^0f00h,c	;volatile
	line	37
	movlw	low(028h)
	movwf	((c:4038))^0f00h,c	;volatile
	line	38
	movlw	low(09Fh)
	movwf	((c:4040))^0f00h,c	;volatile
	line	39
	
l200:; BSR set to: 15

	return	;funcret
	callstack 0
GLOBAL	__end_of_I2C2_Init
	__end_of_I2C2_Init:
	signat	_I2C2_Init,89
	global	_isr

;; *************** function _isr *****************
;; Defined at:
;;		line 181 in file "main.c"
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
	line	181
	
_isr:; BSR set to: 15

;incstack = 0
	callstack 25
	bsf int$flags,1,c ;set compiler interrupt flag (level 2)
	movff	fsr1l+0,??_isr+0
	movff	fsr1h+0,??_isr+1
	movff	fsr2l+0,??_isr+2
	movff	fsr2h+0,??_isr+3
	line	184
	
i2l1652:
	btfss	((c:3998))^0f00h,c,5	;volatile
	goto	i2u64_41
	goto	i2u64_40
i2u64_41:
	goto	i2l112
i2u64_40:
	line	186
	
i2l1654:
	movff	(c:4014),(c:isr@receivedChar)	;volatile
	line	187
	bcf	((c:3997))^0f00h,c,5	;volatile
	line	192
	
i2l1656:
	movlb	0	; () banked
	movf	(0+(_receiveData+033h))&0ffh,w
	btfss	status,2
	goto	i2u65_41
	goto	i2u65_40
i2u65_41:
	goto	i2l1670
i2u65_40:
	line	196
	
i2l1658:; BSR set to: 0

		movlw	58
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u66_41
	goto	i2u66_40

i2u66_41:
	goto	i2l102
i2u66_40:
	
i2l1660:; BSR set to: 0

	movf	((c:_start_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u67_41
	goto	i2u67_40
i2u67_41:
	goto	i2l102
i2u67_40:
	line	199
	
i2l1662:; BSR set to: 0

	movlw	(01h)&0ffh
	xorwf	((c:_start_sequence_flag))^00h,c
	line	200
	
i2l102:; BSR set to: 0

	line	203
		movlw	35
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u68_41
	goto	i2u68_40

i2u68_41:
	goto	i2l1710
i2u68_40:
	
i2l1664:; BSR set to: 0

		decf	((c:_start_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u69_41
	goto	i2u69_40

i2u69_41:
	goto	i2l1710
i2u69_40:
	line	206
	
i2l1666:; BSR set to: 0

	movlw	low(01h)
	movwf	(0+(_receiveData+033h))&0ffh
	line	207
	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	210
	
i2l1668:; BSR set to: 0

	movlw	(01h)&0ffh
	xorwf	((c:_start_sequence_flag))^00h,c
	goto	i2l1710
	line	217
	
i2l1670:; BSR set to: 0

		movlw	13
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u70_41
	goto	i2u70_40

i2u70_41:
	goto	i2l1676
i2u70_40:
	
i2l1672:; BSR set to: 0

	movf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u71_41
	goto	i2u71_40
i2u71_41:
	goto	i2l1676
i2u71_40:
	line	219
	
i2l1674:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_end_sequence_flag))^00h,c
	line	220
	goto	i2l1710
	line	221
	
i2l1676:; BSR set to: 0

		movlw	10
	xorwf	((c:isr@receivedChar))^00h,c,w
	btfss	status,2
	goto	i2u72_41
	goto	i2u72_40

i2u72_41:
	goto	i2l1694
i2u72_40:
	
i2l1678:; BSR set to: 0

		decf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u73_41
	goto	i2u73_40

i2u73_41:
	goto	i2l1694
i2u73_40:
	line	225
	
i2l1680:; BSR set to: 0

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	clrf	indf2
	
i2l1682:; BSR set to: 0

	incf	(0+(_receiveData+032h))&0ffh
	line	228
	
i2l1684:; BSR set to: 0

	call	_processRequest	;wreg free
	line	231
	
i2l1686:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	232
	
i2l1688:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_receiveData+033h))&0ffh
	line	233
	
i2l1690:; BSR set to: 0

	movlw	low(01h)
	movwf	((c:_interrupt_flag))^00h,c
	line	236
	
i2l1692:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_end_sequence_flag))^00h,c
	line	238
	goto	i2l1710
	line	244
	
i2l1694:; BSR set to: 0

		movlw	032h-0
	cpfslt	(0+(_receiveData+032h))&0ffh
	goto	i2u74_41
	goto	i2u74_40

i2u74_41:
	goto	i2l1708
i2u74_40:
	line	246
	
i2l1696:; BSR set to: 0

		decf	((c:_end_sequence_flag))^00h,c,w
	btfss	status,2
	goto	i2u75_41
	goto	i2u75_40

i2u75_41:
	goto	i2l1704
i2u75_40:
	line	249
	
i2l1698:; BSR set to: 0

	movlw	low(0)
	movwf	((c:_end_sequence_flag))^00h,c
	line	252
	
i2l1700:; BSR set to: 0

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movlw	low(0Dh)
	movwf	indf2
	
i2l1702:; BSR set to: 0

	incf	(0+(_receiveData+032h))&0ffh
	line	255
	
i2l1704:; BSR set to: 0

	movf	(0+(_receiveData+032h))&0ffh,w
	addlw	low(_requestBuffer)
	movwf	fsr2l
	clrf	fsr2h
	movff	(c:isr@receivedChar),indf2

	
i2l1706:; BSR set to: 0

	incf	(0+(_receiveData+032h))&0ffh
	line	256
	goto	i2l1710
	line	260
	
i2l1708:; BSR set to: 0

	movlw	low(0)
	movwf	(0+(_receiveData+032h))&0ffh
	line	269
	
i2l1710:; BSR set to: 0

	bsf	((c:3997))^0f00h,c,5	;volatile
	line	271
	
i2l112:
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
;;		line 278 in file "main.c"
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
;;		Unchanged: 3F/0
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
psect	text17,class=CODE,space=0,reloc=2,group=0
	line	278
global __ptext17
__ptext17:
psect	text17
	file	"main.c"
	line	278
	
_processRequest:
;incstack = 0
	callstack 25
	line	280
	
i2l1620:; BSR set to: 0

	line	281
	movlw	high(0)
	movwf	((c:processRequest@length_index+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@length_index))^00h,c
	line	282
	movlw	high(0)
	movwf	((c:processRequest@i+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@i))^00h,c
	line	284
	
i2l1622:; BSR set to: 0

	movff	(_requestBuffer),(_request_unit)
	line	285
	
i2l1624:; BSR set to: 0

	movff	0+(_requestBuffer+01h),0+(_request_unit+01h)
	line	288
	movlw	high(0)
	movwf	((c:processRequest@buffer_index+1))^00h,c
	movlw	low(0)
	movwf	((c:processRequest@buffer_index))^00h,c
	goto	i2l1632
	line	289
	
i2l1626:; BSR set to: 0

	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_requestBuffer+02h)
	movwf	fsr2l
	clrf	fsr2h
	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_request_unit+04h)
	movwf	fsr1l
	clrf	fsr1h
	movff	indf2,indf1
	line	292
	
i2l1628:; BSR set to: 0

	movlw	low(02h)
	addwf	((c:processRequest@buffer_index))^00h,c,w
	movwf	((c:processRequest@length_index))^00h,c
	movlw	high(02h)
	addwfc	((c:processRequest@buffer_index+1))^00h,c,w
	movwf	1+((c:processRequest@length_index))^00h,c
	line	288
	
i2l1630:; BSR set to: 0

	infsnz	((c:processRequest@buffer_index))^00h,c
	incf	((c:processRequest@buffer_index+1))^00h,c
	
i2l1632:; BSR set to: 0

	movf	((c:processRequest@buffer_index))^00h,c,w
	addlw	low(_requestBuffer+02h)
	movwf	fsr2l
	clrf	fsr2h
	movf	indf2,w
	btfss	status,2
	goto	i2u62_41
	goto	i2u62_40
i2u62_41:
	goto	i2l1626
i2u62_40:
	
i2l117:; BSR set to: 0

	line	296
	movff	(c:processRequest@length_index),0+(_request_unit+02h)
	movff	(c:processRequest@length_index+1),1+(_request_unit+02h)
	line	301
	
i2l118:; BSR set to: 0

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
