 include 'emu8086.inc'
   ORG 100h
   MOV AL, 250
   CMP AL, 5
   JA label1 ; pula para o label caso o primeiro valor seja maior que o segundo
   PRINT 'AL nao eh acima 5'
   JMP exit
label1:
   PRINT 'AL eh acima 5'
exit:
   RET