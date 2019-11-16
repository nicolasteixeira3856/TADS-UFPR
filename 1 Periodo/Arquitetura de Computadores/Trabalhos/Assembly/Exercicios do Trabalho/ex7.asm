include 'emu8086.inc'

   ORG 100h             
   .data
   v1 db ?
   resto db 0
   CHECAGEM db 0
   MAIOR db 0
   MENORI db 99
   .code
        
   MOV SI, 0
   MOV CX, 10 
                              
PRINT 'ENTRE COM 10 VALORES: ' 
VETOR:           
   MOV AH,01h                   
   INT 21H      ;INSERCAO PRIMEIRO DIGITO                
   SUB AL,48
   MOV BL,AL ;LIBERA AL PRA BL E MULTIPLICAR
   MOV AL,0
   INT 21H  ;INSERCAO SEGUNDO DIGITO
   SUB AL,48
   PUTC 10
   PUTC 13
   MOV DL,AL ;LIBERA AL SEM USAR CL
   MOV AX,0    ;ZERA AX
   MOV AX,10   ; PREPARA MULT POR 10
   MUL BL  ;MULTIPLICA BL POR 10 E JOGA O VALOR EM AL
   ADD AL,DL  ;SOMA VALOR DE AL+DL              
   MOV v1[SI],AL ;JOGA OS VALORES EM V1 COMO NUM
   INC SI      ;INCREMENTA CONTADOR   
   CMP CX, 0   ;SE FOR 0 INICIA O VETOR
   LOOPNE VETOR
               
   MOV SI, 0
   MOV CX, 10     
 
          
	PRINT 'VALORES INFORMADOS  : '  
IMPRIMIR:
   MOV AL, v1[SI]
   MOV AH,0  ;SE JOGAR VARIAVEL FEITA ELE QUEBRA
   MOV DH,10
   DIV DH
   MOV BH,AH    
   MOV AH,2  
   ADD AL,48                      
   MOV DL,AL ;SE USAR CH ELE QUEBRA
   INT 21H
   MOV AH,0
   MOV AH,2
   MOV DL,BH
   ADD DL,48     ;SAIDA DE VALORES PERFEITA
   INT 21H
   PUTC 13
   PUTC 10                           
   INC SI      
   CMP CX, 0                          
   LOOPNE IMPRIMIR


;NAO MEXER MAIS
PUTC 10
PUTC 13
MOV SI,0
MOV CX,10
MAIO:
MOV AL, v1[SI]
    
   MOV AH,0  ;SE JOGAR VARIAVEL FEITA ELE QUEBRA
   CMP AL,MAIOR
   JG MAIORES
   
   CONTINUAR:                           
   INC SI      
   CMP CX,1                          
   LOOP MAIO
   

MOV SI,0
MOV CX,10
MENO:
   MOV AL, v1[SI]
    
   MOV AH,0  ;SE JOGAR VARIAVEL FEITA ELE QUEBRA
   CMP AL,MENORI
   JB MENORES
   
   CONTINUA:                                                 
   INC SI      
   CMP CX,1
   Jb PRINTS
                             
   LOOP MENO
  
PRINTS:
PRINT 'MENOR'
    PUTC 10
    PUTC 13
    MOV AH,0
    MOV AL,MENORI
   MOV DH,10
   DIV DH
   MOV BH,AH    
   MOV AH,2  
   ADD AL,48                      
   MOV DL,AL ;SE USAR CH ELE QUEBRA
   INT 21H
   MOV AH,0
   MOV AH,2
   MOV DL,BH
   ADD DL,48     ;SAIDA DE VALORES PERFEITA
   INT 21H
   PUTC 13
   PUTC 10
PRINT 'MAIOR'
    PUTC 10
    PUTC 13
    MOV AH,0
    MOV AL,MAIOR
   MOV DH,10
   DIV DH
   MOV BH,AH    
   MOV AH,2  
   ADD AL,48                      
   MOV DL,AL ;SE USAR CH ELE QUEBRA
   INT 21H
   MOV AH,0
   MOV AH,2
   MOV DL,BH
   ADD DL,48     ;SAIDA DE VALORES PERFEITA
   INT 21H
   PUTC 13
   PUTC 10   
   
        
RET

MENORES:
MOV MENORI,AL
JMP CONTINUA

MAIORES:
MOV MAIOR,AL
JMP CONTINUAR