 include 'emu8086.inc'
   ORG 100h
   MOV AL, -2
   CMP AL, 5
   JL  label1   ; pula para o label caso o primeiro valor seja menor que o segundo
   PRINT 'AL >= 5.'
   JMP exit
label1:
   PRINT 'AL < 5.'
exit:
   RET