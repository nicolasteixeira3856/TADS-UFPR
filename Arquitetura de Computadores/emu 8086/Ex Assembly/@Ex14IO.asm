                                 include emu8086.inc
#make_COM#
ORG 100h

    
    PRINT 'ENTRADA DE UM NUM: '   ; IMPRIME NA TELA "ENTRADA DE UM NUM"
	MOV AH,01h                    ; COLOCA 1 HEXA EM AH PARA A INTERRUPCAO ENTENDER QUE TEMOS UMA ENTRADA DE DADOS
	INT 21H                       ; FAZ A INTERRUCAO ESPERANDO O DADO
	PUTC 10                       ;PULA LINHA
	PUTC 13                       ;COLOCA O CURSOR NO INICIO DA LINHA
    sub AL,48                     ; EX 1
    mov BL, AL 
    PRINT 'O VALOR INFORMADO FOI: '  
    MOV AH,2                       ; COLOCA 2 HEXA EM AH PARA A INTERRUPCAO ENTENDER QUE TEMOS UMA SAIDA DE DADOS
    ADD AL,48                      ;EX 2
    MOV DL,AL                      ; MOVE O CONTEUDO DE AL PARA DL POIS O VALOR PARA IMPRESSAO SAI DE DL
    INT 21H       
    PUTC 10   
	PUTC 13                                

RET                                     

;NA TABELA ASCII O CARACTER '3' TAH NA POSICAO 051 DECIMAL PARA OBTER O VALOR EM DECIMAL SUBTRAI 48 (REFERÊNCIA 0)
;PARA RETORNAR UM VALOR NÚMERICO PARA UM ASCII SOMAMOS 48.


