INCLUDE <P16F887.INC>
__CONFIG _CONFIG1,0XE032
__CONFIG _CONFIG2,0XFEFF
CBLOCK 0X20
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

    BANKSEL TRISC
    MOVLW H'00'
    MOVWF TRISC

	BANKSEL PORTC
	BANKSEL PORTD

MAIN
    CALL SECUENCIA_UNO ;LLAMO MI SECUENCIA UNO
    CALL SECUENCIA_DOS ;LLAMO MI SECUENCIA DOS
    CALL SECUENCIA_TRES ;LLAMO MI SECUENCIA TRES

GOTO MAIN ; se retorna al MAIN

SECUENCIA_UNO
	MOVLW	H'0E'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0D'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0B'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'07'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'1F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'2F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'4F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'8F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'8F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'4F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'2F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'1F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'07'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0B'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0D'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0E'
	MOVWF	PORTC
	CALL	RET_50MS

	RETURN ;FIN SECUENCIA_UNO

SECUENCIA_DOS
	MOVLW	H'17'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'2B'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'4D'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'8E'
	MOVWF	PORTC
	CALL	RET_50MS
	
	RETURN ;FIN SECUENCIA_DOS

SECUENCIA_TRES
	MOVLW	H'F0'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'70'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'30'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'10'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'08'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0C'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0E'
	MOVWF	PORTC
	CALL	RET_50MS
	
	MOVLW	H'0F'
	MOVWF	PORTC
	CALL	RET_50MS
	
	RETURN ;FIN SECUENCIA_TRES

;RETARDO DE 50MS
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
	END