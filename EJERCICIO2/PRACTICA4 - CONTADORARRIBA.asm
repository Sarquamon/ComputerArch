LIST P = 16F887
INCLUDE <P16F887.INC>
__CONFIG _CONFIG1,0XE032
__CONFIG _CONFIG2,0XFEFF
CBLOCK 0X20
    CONTA
    CONTB
    D1
    D2
    D3
 ENDC
 ORG 0X00
 ;----------------- CONFIGURACION REGISTRO --------------
 INICIA 
    BANKSEL  ANSEL
    CLRF     ANSEL
    CLRF     ANSELH

    BANKSEL TRISB
    MOVLW H'05'
    MOVWF TRISB
    
    BANKSEL TRISC
    MOVLW H'00'
    MOVWF TRISC
    
    BANKSEL TRISD
    MOVLW H'00'
    MOVWF TRISD
    
    BANKSEL TRISE
    MOVLW H'00'
    MOVWF TRISE
    
    BANKSEL PORTB
    BANKSEL PORTC
    BANKSEL PORTD
    BANKSEL PORTE
;------------------COMIENZO DE MIS INSTRUCCIONES----------------
MAIN    
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS    
    
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_50MS
        
    BTFSS PORTB, 2
    GOTO $-1

FOR1
    CALL SEC_0
    CALL ENCAPARELE2MS
    DECFSZ CONTA
    GOTO FOR1
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR2
    CALL SEC_10
    CALL ENCAPARELE4MS
    DECFSZ CONTA
    
    GOTO FOR2
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR3
    CALL SEC_20
    CALL ENCAPARELE6MS
    DECFSZ CONTA
    
    GOTO FOR3
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1

FOR4
    CALL SEC_30
    CALL ENCAPARELE8MS
    DECFSZ CONTA
    
    GOTO FOR4
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR5
    CALL SEC_40
    CALL ENCAPARELE10MS
    DECFSZ CONTA
    
    GOTO FOR5
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR6
    CALL SEC_50
    CALL ENCAPARELE12MS
    DECFSZ CONTA
    
    GOTO FOR6
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR7
    CALL SEC_60
    CALL ENCAPARELE14MS
    DECFSZ CONTA
    
    GOTO FOR7
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR8
    CALL SEC_70
    CALL ENCAPARELE16MS
    DECFSZ CONTA
    
    GOTO FOR8
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR9
    CALL SEC_80
    CALL ENCAPARELE18MS
    DECFSZ CONTA
    
    GOTO FOR9
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR10
    CALL SEC_90
    CALL ENCAPARELE20MS
    DECFSZ CONTA
    
    GOTO FOR10
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
    
FOR11
    CALL SEC_100
    DECFSZ CONTA
    
    GOTO FOR11
    
    MOVLW H'FFFFFF'
    MOVWF CONTA

    BTFSS PORTB, 0
    GOTO $-1
GOTO MAIN ; se retorna al MAIN
;RETARDO DE 50MS
    
SEC_100  
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
    
    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
    
    MOVLW H'02'
    MOVWF PORTD
    
    MOVLW H'F9'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_90
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'98'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_80
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'80' ; 83, 92, 99, B0, A4, F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_70
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'F8' ; 83, 92, 99, B0, A4, F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_60
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'83' ;92, 99, B0, A4, F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_50
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'92' ; 99, B0, A4, F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_40
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'99' ; 99, B0, A4, F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_30
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'B0' ; A4, F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_20
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'A4' ; F9, C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_10
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'F9' ; C0
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
    
SEC_0
    MOVLW H'08'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS

    MOVLW H'04'
    MOVWF PORTD
    
    MOVLW H'C0'
    MOVWF PORTC
    CALL RET_0001
    CALL APAGADODIGITOS
RETURN
      
APAGADODIGITOS
    MOVLW H'00'
    MOVWF PORTD
RETURN

ENCAPARELE2MS    
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_2MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_2MS
RETURN
ENCAPARELE4MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_4MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_4MS
RETURN
ENCAPARELE6MS    
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_6MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_6MS
RETURN
ENCAPARELE8MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_8MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_8MS
RETURN
ENCAPARELE10MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_10MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_10MS
RETURN
ENCAPARELE12MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_12MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_12MS
RETURN
    
ENCAPARELE14MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_14MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_14MS
RETURN
    
ENCAPARELE16MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_16MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_16MS
RETURN
    
ENCAPARELE18MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_18MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_18MS
RETURN
    
ENCAPARELE20MS
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_20MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_20MS
RETURN
    
PRUEBARELE
    MOVLW H'00'
    MOVWF PORTE
    CALL RET_50MS
    
    MOVLW H'FF'
    MOVWF PORTE
    CALL RET_50MS
GOTO PRUEBARELE    
    
RET_2MS
			;9993 cycles
	movlw	0xCE
	movwf	D1
	movlw	0x08
	movwf	D2
RET_2MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_2MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return

RET_4MS
			;19993 cycles
	movlw	0x9E
	movwf	D1
	movlw	0x10
	movwf	D2
RET_4MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_4MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return

RET_6MS
			;29993 cycles
	movlw	0x6E
	movwf	D1
	movlw	0x18
	movwf	D2
RET_6MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_6MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return

RET_8MS
			;39993 cycles
	movlw	0x3E
	movwf	D1
	movlw	0x20
	movwf	D2
RET_8MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_8MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return
RET_10MS
			;49993 cycles
	movlw	0x0E
	movwf	D1
	movlw	0x28
	movwf	D2
RET_10MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_10MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return
RET_12MS
			;59993 cycles
	movlw	0xDE
	movwf	D1
	movlw	0x2F
	movwf	D2
RET_12MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_12MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return

RET_14MS
			;69993 cycles
	movlw	0xAE
	movwf	D1
	movlw	0x37
	movwf	D2
RET_14MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_14MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return
RET_16MS
			;79993 cycles
	movlw	0x7E
	movwf	D1
	movlw	0x3F
	movwf	D2
RET_16MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_16MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return
RET_18MS
			;89993 cycles
	movlw	0x4E
	movwf	D1
	movlw	0x47
	movwf	D2
RET_18MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_18MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return

RET_20MS
			;99993 cycles
	movlw	0x1E
	movwf	D1
	movlw	0x4F
	movwf	D2
RET_20MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	RET_20MS_0

			;3 cycles
	goto	$+1
	nop

			;4 cycles (including call)
	return
RET_50MS 
				     ;749992 CYCLES
    MOVLW    0x85
    MOVWF    D1
    MOVLW    0XA3
    MOVWF    D2
    MOVLW    0X02
    MOVWF    D3
DELAY_0
    DECFSZ   D1,F
    GOTO     $+2
    DECFSZ   D2,F
	GOTO     $+2
	DECFSZ   D3,F
    GOTO     DELAY_0
                     ;4 CYCLES
    GOTO     $+1
    GOTO     $+1
					 ;4 CYCLES (INCLUDING CALL)
    RETURN
DELAY_10MS
			;499994 cycles
	movlw	0x03
	movwf	D1
	movlw	0x18
	movwf	D2
	movlw	0x02
	movwf	D3
DELAY_10MS_0
	decfsz	D1, f
	goto	$+2
	decfsz	D2, f
	goto	$+2
	decfsz	D3, f
	goto	DELAY_10MS_0
			;2 cycles
	goto	$+1
			;4 cycles (including call)
	return

RET_0001
			;496 cycles
	movlw	0xA5
	movwf	D1
RET_0001_0
	decfsz	D1, f
	goto	RET_0001_0
			;4 cycles (including call)
	return
END
