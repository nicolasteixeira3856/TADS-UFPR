include emu8086.inc
#make_COM#
ORG 100h

    
    PRINT 'Digite um numero de 1 a 99: '
    ; Aqui e feito o input do primeiro numero
	MOV AH, 1
	;Inicio do tratamento PUTC para pular linha 
	PUTC 10
	PUTC 13
	;Fim do tratamento PUTC para pular linha
	INT 21h
	; E colocado no AL no Bl pois o input de numero vai sempre para o AL 
	SUB AL, 48
	MOV BL, AL
	MOV AL, 1
	INT 21h
	; Insercao do segundo digito  
	SUB AL, 48
	MOV CL, AL
	; Inicio da saida de dados 
	
	ADD BL,48
    ADD CL,48 ;TRANSFORMA NOVAMENTE EM ASCII  
    
    CMP CL,48
    JE CASOUNI0 ;COMPARA CASO UNIDADE SEJA 0
    
    CMP CL,57 ;compara caso UNIDADE SEJA 9
    JE CASOUNI9 ;JOGA PRA LABEL CASOUNI9
    
    
    ;SUCESSOR E ANTECESSOR SEM VARIACOES EX 00,99,01,10
;antecessor:
 
    PUTC 10   
    PUTC 13
    PRINT 'Antecessor: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
                          
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    ADD CL,-1
    MOV DL, CL
    INT 21h
;FIM
    
    ;sucessor:
 
    PUTC 10   
    PUTC 13
    PRINT 'sucessor: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
                          
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    ADD CL,2
    MOV DL, CL
    INT 21h         
RET
                                               

 
                                      
CASOUNI0:
    CMP BL,48 ;CASO DEZENA 0 E UNIDADE 0
    JE CASODEZ0
    ;SUCESSOR
    PUTC 10   
    PUTC 13
    PRINT 'sucessor: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
                          
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    ADD CL,1
    MOV DL, CL
    INT 21h
         
    ;ANTECESSOR
    PUTC 10   
    PUTC 13
    PRINT 'Antecessor: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
    ADD BL,-1                      
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    ADD CL,8
    MOV DL, CL
    INT 21h
RET    

CASOUNI9:
    CMP BL,57 ;CASO UNIDADE 9 E DEZENA 9
    JE CASO100
    ;SUCESSOR
    PUTC 10   
    PUTC 13
    PRINT 'sucessor: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
    ADD BL,1                      
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    MOV CL,48
    MOV DL, CL
    INT 21h
         
    ;ANTECESSOR
    PUTC 10   
    PUTC 13
    PRINT 'Antecessor: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
    ADD BL,-1                      
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    ADD CL,8
    MOV DL, CL
    INT 21h     
 RET
 
 
 CASODEZ0:
 PUTC 10
 PUTC 13
 PRINT 'ANTECESSOR'
 PUTC 10
 PUTC 13
 PRINT '-1'
 PUTC 10
 PUTC 13
 PRINT 'SUCESSOR'
 PUTC 10
 PUTC 13
 PRINT '01'
 RET
 
 CASO100:
 PUTC 10
 PUTC 13
 PRINT 'ANTECESSOR'
 PUTC 10
 PUTC 13
 PRINT '98'
 PUTC 10
 PUTC 13
 PRINT 'SUCESSOR'
 PUTC 10
 PUTC 13
 PRINT '100'
 




