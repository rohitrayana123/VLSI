.define addr	R0
.define data	R1
		LUI 	SP,#7
		LLI 	SP,#208
		LUI		addr,#2 		; read ptr	0x0200
		ADDI 	data,addr,#2	; 0x0202
		STW 	data,[addr,#0]	; Read ptr set to   0x0202			
		STW 	data,[addr,#1]	; Write ptr set to 	0x0202
		LUI 	addr,#160		; Address of Serial control reg
		LLI 	addr,#1
		LUI 	data,#0
		LLI 	data,#1			; Data to enable ints
		STW 	data,[addr,#0]	; Store 0x001 @ 0xA001
		ENAI					; Interrupts on
.main	LUI 	R0, #2		; Read ptr address in R0
		LLI 	R0, #0	
		LDW 	R2,[R0,#0]	; Read ptr in R2
		LDW 	R3,[R0,#1]	; Write ptr in R3
		CMP 	R2,R3		 
		BE 		.main		; Jump back if the same
		LDW 	R3,[R2,#0] 	; Load data out of buffer	
		ADDIB 	R2,#1		; Inc read ptr
		SUB 	R0,R0,R0
		LUI 	R0,#2
		LLI 	R0,#6
		SUB 	R0,R0,R2
		BNE		.wrapR
		SUBIB 	R2,#4
.wrapR	LUI 	R0, #2		; Read ptr address in R0
		LLI 	R0, #0	
		STW 	R2,[R0,#0]	; Store new read pointer
		SUB 	R4,R4,R4
		LLI 	R4,#15
		AND 	R3,R4,R3
		CMPI 	R3,#8
		BE		.do
		LLI 	R4,#7
		AND 	R3,R3,R4	
.do 	PUSH 	R3
		BWL		.fact
		POP 	R3
		LUI 	R4,#8	
		LLI 	R4,#1		; Address of LEDs
		STW 	R3,[R4,#0]	; Put factorial on LEDs	
		BR		.main       	; look again	
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
		SUB 	A,A,A                                                                                                	
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
.isr  	STF					; Keep flags, disable auto
		PUSH 	R0			; Save only this for now
		LUI 	R0,#160
		LLI 	R0,#0
		LDW 	R0,[R0,#0]	; R1 contains read serial data
		ENAI				; Don't miss event
		PUSH 	R1
		PUSH 	R2
		PUSH 	R3
		PUSH 	R4
		LUI 	R1,#2
		LLI 	R1,#0
		LDW 	R2,[R1,#0]	; R2 contains read ptr
		ADDI 	R3,R1,#1
		LDW 	R4,[R3,#0]	; R4 contain the write ptr
		SUBIB 	R2,#1		; Get out if W == R - 1
		CMP 	R4,R2
		BE 		.isrOut
		ADDIB 	R2,#1
		LUI 	R1,#2
		LLI 	R1,#2
		CMP 	R2,R1
		BNE 	.write	
		ADDIB 	R1,#3
		CMP 	R4,R1
		BE 		.isrOut
.write	STW 	R0,[R4,#0]	; Write to buffer
		ADDIB 	R4,#1
		LUI 	R1,#2
		LLI 	R1,#6
		CMP 	R1,R4
		BNE 	.wrapW
		SUBIB 	R4,#4
.wrapW	STW 	R4,[R3,#0]	; Inc write ptr
.isrOut	POP 	R4
		POP 	R3
		POP 	R2
		POP 	R1
		POP 	R0
		LDF
		RETI
