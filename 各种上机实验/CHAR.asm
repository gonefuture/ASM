data segment
BUFSIZE DB 6
ACTCHAR DB ?
CHARTEXT DB 10 DUP(20H)
	 DB '$'
data ends

code segment
    assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax
    MOV SI, 0

        ;input code segment code here
    MOV DX,OFFSET BUFSIZE
    MOV AH, 0AH
    INT 21H
    MOV DX, OFFSET CHARTEXT
    MOV AH,09H
    INT 21H
    HLT
    MOV AH,4CH
    INT 21H
code ends
end start
 