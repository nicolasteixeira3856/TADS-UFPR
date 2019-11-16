include emu8086.inc
ORG 100h 

.data 

    varApoio db ? 
    
.code
    
    PRINT 'Digite um numero de 1 a 99: '
	MOV AH, 1
	PUTC 10
	PUTC 13
	INT 21h
	MOV varApoio, AL
	
	CMP AL, 45
	JE numeroNegativo
	
	CMP varApoio, 48
	JE rotaNumeroNulo
	
	MOV BL, AL 
	
	MOV AL, 1
	INT 21h
	MOV CL, AL
	
	PUTC 10
	PUTC 13
	
	PRINT 'O numero digitado e positivo'
	
	RET
 
    numeroNegativo:
    
        
        MOV AH, 1
    	INT 21h 
    	SUB AL, 48
    	MOV BL, AL
    	MOV AL, 1
    	INT 21h  
    	SUB AL, 48
    	MOV CL, AL 
    	
    	PUTC 10
    	PUTC 13
    	
    	PRINT 'O numero digitado e negativo.'
        
        RET
        
    rotaNumeroNulo:
    
        MOV AL, 1
    	INT 21h
    	
    	CMP AL, 48
    	JE printNeutro 
    	
    	PUTC 10
    	PUTC 13
    	
    	PRINT 'O numero digitado e positivo'
    	
    	RET
    	
    printNeutro:
    
    	PUTC 10
    	PUTC 13
    
        PRINT 'O numero digitado e neutro'
        
        RET    
                                                                           





