.MODEL SMALL
.DATA 
        N DW 5
        R DW 0
        NCR DW 0
.CODE
MOV AX, @DATA
MOV DS, AX
MOV AX, N
MOV BX, R
CALL NCR_PROC
MOV AH, 4CH
INT 21H
ncr_proc proc
CMP AX, BX
JZ N1
CMP BX, 0
JZ N1
CMP BX, 1
JZ N2
MOV CX, AX
DEC CX
CMP CX, BX
JZ N2
PUSH AX
PUSH BX
DEC AX
CALL ncr_proc
POP BX
POP AX
DEC AX
DEC BX
CALL ncr_proc
JMP LAST
n1: ADD ncr, 1
RET
n2:ADD ncr, AX
LAST:RET
ncr_proc ENDP
END
