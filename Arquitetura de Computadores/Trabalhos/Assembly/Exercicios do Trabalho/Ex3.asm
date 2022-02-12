include emu8086.inc
#make_COM#
ORG 100h

.data
    varApoioNum db ?
   
.code
     
    PRINT 'Digite um numero de 1 a 99: '
    PUTC 10
	PUTC 13
    
    ;Entrando com os valores
	MOV AH, 01h
	INT 21h 
	MOV BH, AL ;Coloca a entrada do primeiro digito no BH
	INT 21h
	MOV BL, AL ;Coloca a entrada do segundo digito no BL
	
	MOV AL, BH ;BH - primeiro digito, vai para o AL
	SUB AL, 48 ;Tira menos 48 do AL para converter em numero
	MOV AH, 10 ;Coloca 10 NO AH
	
	MUL AH ;Multiplica AL por AH, ou seja, primeiro digito * 10
	
	ADD AL, BL ;Adiciona BL ao AL (resultado da multiplicacao)
	SUB AL, 48 ;Subtrai 48 para fazer jus a conversao para numero
	
	MOV varApoioNum, AL ;Aloca o valor de AL na variavel
	
	PUTC 10   
    PUTC 13
	
	;--------Imprimindo o valor------------

    PRINT 'O numero informado foi: '
    
    PUTC 10
	PUTC 13
    
    ;Primeiro valor
    MOV AL, varApoioNum
    MOV AH, 0h
    MOV CH, 10
    DIV CH
    MOV DX, AX
    ADD DX, 48
    MOV AH, 02h
    INT 21h
    
    ;Segundo valor
    MOV AL, varApoioNum
    MOV AH, 0h
    MOV CH, 10
    DIV CH
    MOV DL, AH
    ADD DX, 48
    MOV AH, 02h
    INT 21h
    
    PUTC 10
	PUTC 13  
	PUTC 10
	PUTC 13
	
	;Logica de par e impar
	MOV AH, 0h
	MOV AL, varApoioNum
	MOV CH, 2
	DIV CH
	CMP AH, 0
	JE PRINTPAR
	
	CMP AH, 1
	JGE PRINTIMPAR
	
	
PRINTIMPAR:	
    PRINT 'O numero e impar'
    
    RET
	
PRINTPAR:

    PRINT 'O numero e par'
    
    RET

                                                                     









