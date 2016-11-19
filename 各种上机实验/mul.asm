DATA SEGMENT
	OP1 DB 01H
	OP2 DB 09H
	RESULT DW ?
	
    ;此处输入数据段代码  
DATA ENDS

STACK SEGMENT
    ;此处输入堆栈段代码
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
    MOV AX,DATA
    MOV DS,AX 
    MOV AL,OP1
    MUL OP2
    AAM   ;结果保存在AL,AH中
    
    MOV RESULT, AX
      
    MOV BL, AL   ;低八位保存在BL
    
    MOV CL,8
    SHR AX, CL  ;右移8位，BCD码保存在低位
    
    ADD AL,30H
    MOV DL, AL  ;低位的BCD码
    MOV AH, 2
    INT 21H
    
    ADD BL,30H
    MOV DL,BL   ;高位的BCD码
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    
CODE ENDS
    END START




