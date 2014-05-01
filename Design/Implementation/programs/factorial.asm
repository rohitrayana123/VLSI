.define SW		R0
.define LEDS	R1
.define	data	R3
		LUI 	SP, #7
		LLI 	SP, #208
		LUI 	SW, #8			; Address of switches
		ADDI	LEDS,SW,#1		; Address of LEDS
.start	LDW 	data,[SW,#0]	; Read switches into R1	
		PUSH 	data			; Pass para
		BWL 	.fact			; Run Subroutine
		POP 	data			; Para overwritten with result		
		STW 	data,[LEDS,#0]	; Result on LEDS
		BR 		.start			; Do it again
.define Op		R0
.define min		R1
.fact   PUSH	LR
		PUSH 	Op
		PUSH 	min
		LDW 	Op,[SP,#3]  ; Get para	
		CMPI	Op,#0
		BE 		.retOne    	; 0! = 1
		SUBI 	min,Op,#1
		PUSH 	min        	; Pass para
		BWL 	.fact		; The output remains on the stack
		PUSH 	Op			; Pass para
		SUBIB 	SP,#1		; Placeholder
		BWL 	.multi
		POP 	Op          ; Get res
		ADDIB 	SP,#2     	; pop x 2
.out	STW 	Op,[SP,#3]
		POP 	min
		POP 	Op
		POP		LR
		RET
.retOne ADDIB 	Op,#1    	; Make it 1
		BR .out	
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
		LUI		i,#0                                                                                               	
		LLI		i,#255			; Bottom 8 only
		AND 	M,M,i			
		AND		Q,Q,i                                                                                                 	
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
