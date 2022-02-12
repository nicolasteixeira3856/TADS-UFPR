include 'emu8086.inc'
ORG 100h  
           
TAM EQU 0AH
NUMBER DB TAM DUP(?)
CONT DB ?
   
   MOV DI,00H
   MOV CONT,01H
   MOV CL, 5   
label1: 
   MOV AL,CONT    
   MOV NUMBER[DI],AL
   INC DI    
   INC CONT
   LOOP label1
   RET      
   
   
   
    