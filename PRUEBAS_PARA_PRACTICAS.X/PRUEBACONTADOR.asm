LIST P = 16F887
INCLUDE <P16F887.INC>
__CONFIG _CONFIG1,0XE032
__CONFIG _CONFIG2,0XFEFF
CBLOCK 0X20
    CONTA ;THIS IS COUNTER 1
    CONTB ;THIS IS COUNTER 1
    UNIDAD ;UNIT LIKE 1, 2
    DECENA ;DECE LIKE 10, 20
    CENTENA ; CENTE LIKE 100, 200
    UNIDADMIL ;THOUSAND LIKE 1000, 2000
    D1 ;VARIABLES FOR DELAYS
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
    
    BANKSEL TRISD
    MOVLW H'00'
    MOVWF TRISD ; PORTD AND C AS OUTPUTS
    
    BANKSEL TRISB
    MOVLW H'01'
    MOVWF TRISB ; PORTB AS INPUT
    
    BANKSEL TRISB
    BANKSEL TRISC
    BANKSEL TRISD
    ;MAIN STARTS
MAIN
    MOVLW H'0A'
    MOVWF CONTA ;GIVING A 0 VALUE TO COUNTER A
    MOVLW H'0A'
    MOVWF CONTB ;GIVING A 0 VALUE TO COUNTER B
    MOVLW H'0A'
    MOVWF CONTC ;GIVING A 0 VALUE TO COUNTER C
    
    MOVLW H'FF'
    MOVWF PORTD ;CLEANING PORTD
    
    MOVLW H'00'
    MOVWF PORTC ;CLEANING PORTC
        
BTFSS PORTB, 1 ;GETTING BUTTON FROM PORTB BIT 1 TO START THE DISPLAY
GOTO $-1
    
SEC_99
    MOVLW H'04' ;TURNS ON THE 2 DIGIT
    MOVWF PORTD ; TURNING ON DISPLAYS DIGIT, IN THIS CASE DIGIT 4 FROM PORTD
    
    MOVF CONTB, F 
    CALL TABLE ;CALLING TABLE
    MOVWF PORTC ;MOVING ITS VALUE TO PORTC TO TURN THE NUMBER
    CALL RET_50MS ;CALLING DELAY OF 50 MS
    CALL APAGADODIGITO
SEC_INTERNA
    MOVLW H'0A'
    MOVWF CONTA ;GIVING A 0 VALUE TO COUNTER A
    
    MOVLW H'08'
    MOVWF PORTD ; TURNING ON DISPLAYS DIGIT, IN THIS CASE DIGIT 4 FROM PORTD
    
    MOVF CONTA, F
    CALL TABLE ;CALLING TABLE
    MOVWF PORTC ;MOVING ITS VALUE TO PORTC TO TURN THE NUMBER
    CALL RET_50MS ;CALLING DELAY OF 0.0001 S
    DECFSZ CONTA
    GOTO SEC_INTERNA
    DECFSZ CONTB
GOTO SEC_99
SEC_60
    MOVLW H'04' ;TURNS ON THE 2 DIGIT
    MOVWF PORTD ; TURNING ON DISPLAYS DIGIT, IN THIS CASE DIGIT 4 FROM PORTD
    
    MOVLW H'07'
    MOVWF CONTB
    
    MOVF CONTB, F 
    CALL TABLE ;CALLING TABLE
    MOVWF PORTC ;MOVING ITS VALUE TO PORTC TO TURN THE NUMBER
    CALL RET_50MS ;CALLING DELAY OF 50 MS
    CALL APAGADODIGITO
SEC_INTERNA2
    MOVLW H'0A'
    MOVWF CONTA ;GIVING A 0 VALUE TO COUNTER A
    
    MOVLW H'08'
    MOVWF PORTD ; TURNING ON DISPLAYS DIGIT, IN THIS CASE DIGIT 4 FROM PORTD
    
    MOVF CONTA, F
    CALL TABLE ;CALLING TABLE
    MOVWF PORTC ;MOVING ITS VALUE TO PORTC TO TURN THE NUMBER
    CALL RET_50MS ;CALLING DELAY OF 0.0001 S
    DECFSZ CONTA
    GOTO SEC_INTERNA2
    DECFSZ CONTB
GOTO SEC_60
        
GOTO MAIN
    
APAGADODIGITO
    MOVLW H'00'
    MOVWF PORTD
RETURN
    
TABLE ;TABLE FOR THE NUMBERS
    ADDWF PCL,1
    RETLW H'C0' ;0
    RETLW H'F9' ;1
    RETLW H'A4' ;2
    RETLW H'B0' ;3
    RETLW H'99' ;4
    RETLW H'92' ;5
    RETLW H'83' ;6
    RETLW H'B8' ;7
    RETLW H'80' ;8
    RETLW H'98' ;9
    
RET_0001
			;496 cycles
	movlw	0xA5
	movwf	D1
RET_0001_0
	decfsz	D1, f
	goto	RET_0001_0
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
END