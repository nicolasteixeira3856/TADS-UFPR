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
    ADD CL,48   
    
	CMP CL, 1
	JB sucessor
    
sucessor:
 
    PUTC 10   
    PUTC 13
    PRINT 'O valor informado foi: '
    MOV AH,2
    PUTC 10   
    PUTC 13
                           
    
                          
    MOV DL,BL                       
    INT 21H
    
    MOV AH, 2
    MOV DL, CL
    INT 21h
    JMP exit      
                                       
exit: 
 RET                                     





