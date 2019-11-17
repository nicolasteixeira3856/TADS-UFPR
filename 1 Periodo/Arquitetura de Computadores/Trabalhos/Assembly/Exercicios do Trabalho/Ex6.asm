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
	
	;Logica de multiplo de tres impar
	MOV AH, 0h
	MOV AL, varApoioNum
	MOV CH, 3
	
	DIV CH
	
	CMP AH, 0
	JE EMULTDETRES
	
	CMP AH, 1
	JGE NAOEMULTDETRES
	
	
NAOEMULTDETRES:	
    PRINT 'O numero nao e multiplo de tres'
    
    RET
	
EMULTDETRES:

    CMP varApoioNum, 0
    JE NAOEMULTDETRES

    PRINT 'O numero e multiplo de tres'
    
    RET

                                                                     









