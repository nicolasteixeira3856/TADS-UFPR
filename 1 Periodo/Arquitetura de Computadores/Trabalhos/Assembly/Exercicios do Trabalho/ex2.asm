; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here


include emu8086.inc

ORG 100h
    .data
    CALC dw 000
    CALC1 dw 000
    SUM dB 000
    
	.code

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
	MOV AX,0
	MOV AX,10
	MUL BL
	ADD AL,CL
	MOV CALC,AX
	PUTC 10
	PUTC 13
	
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
	MOV AX,0
	MOV AX,10
	MUL BL
	ADD AL,CL
	MOV CALC1,AX
	
	MOV AX,CALC1
	ADD AX,CALC 
	MOV SUM,AL
	
	CMP SUM,100
	JAE TRESDIG
	
	MOV AH,0
	MOV CH,10
	DIV CH
	MOV DX,AX
	ADD DX,48
	PUTC 10
	PUTC 13
	MOV AH,2
	INT 21H
	MOV AL,SUM
	MOV AH,0
	MOV CH,10
	DIV CH
	MOV DL,AH
	ADD DL,48
	MOV AH,2
	INT 21H
	
	JMP exit
	
	TRESDIG:
	
	MOV AH,0  
	MOV CH,100
	DIV CH
	MOV DX,AX
	ADD DX,48
	PUTC 10
	PUTC 13
	MOV AH,2
	INT 21H
	SUB SUM,100
	MOV AL,SUM
	MOV AH,0
	MOV CH,10
	DIV CH
	MOV DX,AX
	ADD DX,48
	MOV AH,2
	
	
	INT 21H
	 
	MOV AL,SUM
	MOV AH,0
	MOV CH,10
	DIV CH
	MOV DL,AH
	ADD DL,48
	MOV AH,2		
	INT 21H
	JMP exit
	
exit:
	RET 
	
	
    
	
	