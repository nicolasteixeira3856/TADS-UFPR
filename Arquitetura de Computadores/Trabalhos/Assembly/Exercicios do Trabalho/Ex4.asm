include 'emu8086.inc'
ORG 100h
    
    MOV BH, 0
    MOV BL, 0
    
    MOV CX, 99
    
    ADD BH, 48
    ADD BL, 48
   
    INC BL
LOOPNUM:
    MOV AH, 2
  
    MOV DL, ' '
    INT 21h
    MOV DL, BH
    INT 21h
    MOV DL, BL
    INT 21h
    
    INC BL
    CMP BL, 58
    JNE LOOPNUM
    
FIXLOOP:

    MOV BL, 48
    INC BH
    CMP BH, 58
    
    JNE LOOPNUM         

EXIT:  
    RET



