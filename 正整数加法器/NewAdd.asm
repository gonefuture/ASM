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
    MOV AH, 0AH
    INT 21H
    
    MOV DL, 13
    MOV AH,2
    INT 21H
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    LEA DX,  TEXT
  
    
    
    
    
    
    MOV AX, OP1
    ADD AX, OP2
    LEA BX, RESULT
    
    MOV CX,3
   
L1:
	MOV DL, 10
	DIV DL
	MOV [BX],AH
	MOV AH,0
	ADD BX,1
	
LOOP L1	
	
	LEA BX, RESULT
	ADD BX, 2
	MOV CX, 3
L2:		
	MOV DL,[BX]
	ADD DL,30H
	MOV AH, 2
    INT 21H
    DEC BX
   
LOOP L2
   
   
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START




