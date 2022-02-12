   include 'emu8086.inc'

   ORG 100h             
   
   v1 db ?
   
   MOV SI, 0
   MOV CX, 5 
                              
PRINT 'ENTRE COM 5 VALORES: ' 
IN_VET:           
   MOV AH,01h                   
   INT 21H                      
   SUB AL,48                 
   MOV v1[SI],AL
   INC SI         
   CMP CX, 0   
   LOOPNE IN_VET:
               
   MOV SI, 0
   MOV CX, 5     
 
    CALL PULA_LINHA:          
	PRINT 'VALORES INFORMADOS: '  
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
        
PULA_LINHA:          
    PUTC 10                       
	PUTC 13                     
RET
        
   
   
