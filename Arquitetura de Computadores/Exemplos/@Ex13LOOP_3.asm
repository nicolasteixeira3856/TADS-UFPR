   include 'emu8086.inc'

   ORG 100h             
   
   v1 db ?
   
   MOV SI, 0
   MOV CX, 5
IN_VET:   
   MOV AX,SI     
   MOV v1[SI],AL
   INC SI         
   CMP CX, 0   
   LOOPNE IN_VET:
               
   MOV SI, 0
   MOV CX, 5
IMPRIMIR:     
   MOV AL, v1[SI]    
   MOV AH,2  
   ADD AL,48                      
   MOV DL,AL
   INT 21H                         
   INC SI   
   CMP CX, 0                          
   LOOPNE IMPRIMIR
RET
   
   
   
