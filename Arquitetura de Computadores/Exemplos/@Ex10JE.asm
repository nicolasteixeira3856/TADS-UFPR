include 'emu8086.inc'

   ORG 100h
   MOV AL, 5
   CMP AL, 5
   JE  label1 ; pula para o label caso o primeiro valor seja igual o segundo
   PRINT 'AL nao eh igual a 5.'
   JMP exit
label1:
   PRINT 'AL eh igual a 5.'
exit:
   RET