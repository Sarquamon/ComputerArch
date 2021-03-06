#INCLUDE <16F887.h>
#USE DELAY(CLOCK=20000000)
#FUSES XT,NOPROTECT,NOWDT,NOBROWNOUT,PUT,NOLVP
Byte CONST display[10]= {0XC0,0XF9,0XA4,0XB0,0X99,0X92,0X83,0XF8,0X80,0X98};
#BYTE PORTA= 5
#BYTE PORTC= 7
#BYTE PORTD= 8
#BYTE PORTB= 6
#DEFINE SW PORTB,0
#DEFINE RELE PORTB,1
#DEFINE PTO1 PORTD,0 //DEFINICION DE VARIABLES POSICION EN EL DISPLAY
#DEFINE PTO2 PORTD,1 //DEFINICION DE VARIABLES POSICION EN EL DISPLAY
#DEFINE PTO3 PORTD,2
#DEFINE PTO4 PORTD,3
#DEFINE INC PORTA, 5

INT CONTA; //DECLARAR LA VARIABLE CONTA COMO UN ENTERO, ES DECIR DE 8 BITS

LONG CONTRET; //DECLARAR LA VARIABLE CONTRET COMO LONG, ES DECIR DE 16 BITS

VOID MOSTRAR()//RUTINA PARA MOSTRAR
{
   INT UNI,DEC,CERO,CEROS; //DECLARAR LAS VARIABLES UNI, DEC COMO UN ENTERO, ES DECIR DE 8 BITS
   
   DEC= CONTA/10;
   UNI= CONTA%10;
   CERO = 0;
   CEROS= 0;
   
   PORTC= (DISPLAY[UNI]); //MUESTRA LO QUE HAY EN UNIDADES EN EL DISPLAY
   BIT_SET(PTO4); //ENCIENDE EL DISPLAY DE UNIDADES;;;; ENCIENDE EN UNA POSICION DEL DISPLAY
   DELAY_MS(1); //RETARDO DE 1 MILISEGUNDO
   BIT_CLEAR(PTO4); //APAGA EL DISPLAY DE UNIDADES
   
   PORTC= (DISPLAY[DEC]); //MUESTRA LO QUE HAY EN UNIDADES EN EL DISPLAY
   BIT_SET(PTO3); //ENCIENDE EL DISPLAY DE DECENAS
   DELAY_MS(1); //RETARDO DE 1 MILISEGUNDO
   BIT_CLEAR(PTO3); //APAGA EL DISPLAY DE DECENAS
   
   PORTC= (DISPLAY[CERO]); //MUESTRA LO QUE HAY EN UNIDADES EN EL DISPLAY
   BIT_SET(PTO2); //ENCIENDE EL DISPLAY DE DECENAS
   DELAY_MS(1); //RETARDO DE 1 MILISEGUNDO
   BIT_CLEAR(PTO2); //APAGA EL DISPLAY DE DECENAS
   
   PORTC= (DISPLAY[CERO]); //MUESTRA LO QUE HAY EN UNIDADES EN EL DISPLAY
   BIT_SET(PTO1); //ENCIENDE EL DISPLAY DE DECENAS
   DELAY_MS(1); //RETARDO DE 1 MILISEGUNDO
   BIT_CLEAR(PTO1); //APAGA EL DISPLAY DE DECENAS 
}

VOID RET1SEG() //RUTINA RET1SEG
{
   CONTRET= 10; //CARGUE CON 500 LA VARIABLE CONTRET
   
      WHILE(CONTRET>0) //MIENTRAS QUE LA VARIABLE CONTRET SEA MAYOR QUE CERO
      {
         MOSTRAR(); //LLAMAR LA RUTINA MOSTRAR
         CONTRET--; //DECREMENTA LA VARIABLE CONTRET
      }
}

VOID DECREMENTO60(){
CONTA=60;
            WHILE(CONTA!=0){
            RET1SEG();
            CONTA--;
               IF(CONTA==0){
                 BIT_CLEAR(RELE);
                 CONTA=0;
               }
               //BREAK;
            }
}

void main()
{
   SET_TRIS_D(0); //EL PUERTO D ESTA CONFIGURADO COMO SALIDA
   SET_TRIS_C(0); //EL PUERTO C ESTA CONFIGURADO COMO SALIDA
   SET_TRIS_B(0X01);
   CONTA= 0;
   
   //INT CONTADOR;
  
   BIT_CLEAR(RELE);
   
   //= 90;
   
   while(TRUE) //CICLO INFINITO ;;; PARA SIEMPRE
   {
        IF(BIT_TEST(SW)){
        CONTA=99;
            WHILE(CONTA!=0){
            RET1SEG();
            CONTA--;
               IF(CONTA==0){
                 BIT_SET(RELE);
                 DECREMENTO60();
               }
               //BREAK;
            }
           /* IF(CONTA==60){
                WHILE(CONTA!=0){
                  RET1SEG();
                  CONTA--;
               IF(CONTA==0){
                 BIT_CLEAR(RELE);
                 //CONTA=60;
               }
               //BREAK;
            }
            }*/       
         }
         
          
   }
}
