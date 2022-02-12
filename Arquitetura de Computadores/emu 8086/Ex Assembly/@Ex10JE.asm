include 'emu8086.inc'

   ORG 100h
   MOV AL, 5
   CMP AL, 5
   JE  label1
   PRINT 'AL nao eh igual a 5.'
   JMP exit
label1:
   PRINT 'AL eh igual a 5.'
exit:
   RET