DATAS SEGMENT
   OP1 DW ?
   OP2 DW ?
   RESULT DB 5 DUP(?)
   BUFFSIZE DB 25 
   ACT DB ?
   TEXT DB 25 DUP(?)
DATAS ENDS

STACKS SEGMENT
   
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    LEA DX, BUFFSIZE
    MOV AH, 0AH     ;�س�����
    INT 21H
    MOV DL, 13
    MOV AH,2
    INT 21H
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    MOV CL, ACT
    MOV CH, 0
    DEC CX
    LEA BX,  TEXT
    MOV DH, 10
T1:
	MOV DL, 2BH
	CMP DL, [BX]  ;�ж��Ƿ��ǼӺ�
	ADD BX, 1
	JZ T2         ;���ּӺ�������T2                
	MOV AL, [BX]  
	SUB AL, 30H    ;�ַ�������
	MUL DH
	MOV OP1,AX   ;����OP1
	MOV AH, 0
  	LOOP T1
  	
  	
T2:  
	MOV AL, [BX]  ;ȡ�Ӻź�ļ���
	SUB AL, 30H
	MUL DH
	MOV OP1,AX  ;����OP2
	MOV AH, 0
	LOOP T2
    
    
    MOV AX, OP1  ;�������
    ADD AX, OP2     
    LEA BX, RESULT

    MOV CL,ACT
    MOV CH,0
   
   
L1:
	MOV DL, 10   ;��10ȡ��
	DIV DL
	MOV [BX],AH
	MOV AH,0
	ADD BX,1
	
LOOP L1	
	
	LEA BX, RESULT   ;
	ADD BX, 2
	MOV CL,ACT
    MOV CH,0
L2:		
	MOV DL,[BX]  ;��ʾ����
	ADD DL,30H
	MOV AH, 2
    INT 21H
    DEC BX
   
LOOP L2
   
   
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START








