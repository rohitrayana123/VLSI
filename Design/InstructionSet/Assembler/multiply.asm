		LUI 	SP, #7			; Init SP
		LLI 	SP, #208
		LUI 	R3, #8			; SWs addr
		LDW 	R0,[R3,#0]		; READ SWs
		LUI 	R1, #0			
		LLI 	R1, #255		; 0x00FF in R1
		AND 	R1,R0,R1		; Lower byte SWs in R1	
		LSR 	R0,R0,#8		; Upper byte SWs in R0		 		
		PUSH 	R0				; Op1
		PUSH 	R1				; Op2	
		PUSH	R2				; Place holder is zero reset
		BWL 	.multi			; Run Subroutine
		POP 	R1				; Result
		ADDIB 	SP,#2			; Duummy pop
		ADDIB 	R3,#1			; Address of LEDS
		STW 	R1,[R3,#0]		; Result on LEDS
.end 	BR 		.end			; Finish loop
.define M		R0
.define Q		R1
.define A		R2
.define i		R3
.multi  PUSH 	M
		PUSH 	Q
		PUSH 	A
		PUSH 	i	
		LDW 	M,[SP,#5]		; Off stack frame
		LDW 	Q,[SP,#6]  		;                 	                                                                              	                                                                       	
.mloop	LSL		i,M,#15			; Bit one only
		CMPI 	i,#0
		BE 		.nAcc			; M[1] != 1
		ADD 	A,A,Q			; A = A + Q		
.nAcc	LSR 	M,M,#1			; M = M >> 1
		CMPI 	M,#0
		BE 		.done		
		LSL 	Q,Q,#1			; Q = Q << 1
		BR 		.mloop
.done	STW 	A,[SP,#4]		; Res on stack frame 
		POP		i
		POP 	A
		POP 	Q
		POP 	M
		RET
	
