DATA SEGMENT
	OP1 DB 01H
	OP2 DB 09H
	RESULT DW ?
	
    ;�˴��������ݶδ���  
DATA ENDS

STACK SEGMENT
    ;�˴������ջ�δ���
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
    MOV AX,DATA
    MOV DS,AX 
    MOV AL,OP1
    MUL OP2
    AAM   ;���������AL,AH��
    
    MOV RESULT, AX
      
    MOV BL, AL   ;�Ͱ�λ������BL
    
    MOV CL,8
    SHR AX, CL  ;����8λ��BCD�뱣���ڵ�λ
    
    ADD AL,30H
    MOV DL, AL  ;��λ��BCD��
    MOV AH, 2
    INT 21H
    
    ADD BL,30H
    MOV DL,BL   ;��λ��BCD��
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    
CODE ENDS
    END START




