.MODEL SMALL
.STACK
.DATA
        A DB 77H,42H,35H,12H,0FFH,05H
        L DW $-A
.CODE
        MOV AX,@DATA
        MOV DS,AX
        MOV BX,L
        DEC BX
NXTPASS: MOV CX,BX
         MOV SI ,0
NXTCOMP:MOV AL,A[SI]
        INC SI
        CMP A[SI],AL
        JB NO_EXG

        XCHG AL,A[SI]
        MOV A[SI-1],AL
NO_EXG: LOOP NXTCOMP
        DEC BX
        JNZ NXTPASS
        MOV AH,4CH
        INT 21H
        END

