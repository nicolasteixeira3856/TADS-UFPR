include emu8086.inc
org 100h
.data

VAR1 DB 10
VAR2 DW 12h

.code
MAIN PROC
MOV AL, VAR1
MOV BX, VAR2
ADD AL,BL

RET 

