LIST P = 16F887
INCLUDE <P16F887.INC>
__CONFIG _CONFIG1,0XE032
__CONFIG _CONFIG2,0XFEFF
CBLOCK 0X20
    CONTA
    CONTB
    CONTC
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
    MOVLW H'00'
    MOVWF TRISB
    
    BANKSEL PORTB
;------------------COMIENZO DE MIS INSTRUCCIONES----------------
MAIN

GOTO MAIN ; se retorna al MAIN
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
