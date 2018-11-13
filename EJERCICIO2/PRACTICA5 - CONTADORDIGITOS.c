#INCLUDE <16F887.h>
#USE DELAY(CLOCK=4000000)
#FUSES XT,NOPROTECT,NOWDT,NOBROWNOUT,PUT,NOLVP
Byte CONST display[10]= {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x67};
#BYTE PORTC = 7
#BYTE PORTD = 8
#DEFINE DIGITOUNIDAD PORTD,3
#DEFINE DIGITODECENA PORTD,2
#DEFINE DIGITOCENTENA PORTD,1
#DEFINE DIGITOUNIDADMIL PORTD,0

INT CONT;
LONG CONTRET;

VOID MOSTRAR() {
   INT UNIDAD, DECENA, CENTENA, CERO, CEROS, UNO;

   DECENA = CONT/10;
   UNIDAD = CONT%10;
   CERO = 0;
   UNO = 1;

   PORTC=(DISPLAY[UNIDAD]);
   BIT_SET (DIGITOUNIDAD);
   DELAY_MS(1);
   BIT_CLEAR(DIGITOUNIDAD);

   PORTC=(DISPLAY[DECENA]);
   BIT_SET (DIGITODECENA);
   DELAY_MS(1);
   BIT_CLEAR(DIGITODECENA);

   IF(UNO != CERO){
      PORTC=(DISPLAY[CERO]);
      BIT_SET (DIGITODECENA);
      DELAY_MS(1);
      BIT_CLEAR(DIGITOCENTENA);
      UNO = CERO;
   }ELSE{
      PORTC=(DISPLAY[CERO]);
      BIT_SET (DIGITODECENA);
      DELAY_MS(1);
      BIT_CLEAR(DIGITOCENTENA);
      UNO = CERO;
   }

   PORTC=(DISPLAY[CERO]);
   BIT_SET (DIGITOUNIDADMIL);
   DELAY_MS(1);
   BIT_CLEAR(DIGITOUNIDADMIL);   
}

VOID RET1SEG(){
   CONTRET=500;
   WHILE (CONTRET>0) {
   MOSTRAR();
   CONTRET--;
   }
}

void MAIN() {
   SET_TRIS_B(1);
   SET_TRIS_C(0);
   SET_TRIS_D(0);
   CONT=0;
   IF(TRUE){
      WHILE(TRUE) {
      CONT=0;
      WHILE(CONT<100) {
         RET1SEG();
         CONT++;
         }
      }
   }
}