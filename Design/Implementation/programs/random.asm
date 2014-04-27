		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0	
		LUI 	SP,#7		; Init SP
		LLI 	SP,#208
		LUI 	R0,#8		; SW Address in R0
		LLI 	R0,#0
		LDW 	R1,[R0,#0]	; Read switches into R1	
		ADDIB	R0,#1		; Address of LEDS in R0	
		PUSH	R1
.reset	SUB 	R4,R4,R4	; Reset Loop counter
.loop	BWL 	.rand		 					
		CMPI 	R4,#15
		BE 		.write
		ADDIB 	R4,#1		; INC loop counter
		BR	 	.loop
.write	LDW 	R1,[SP,#0]	; No POP as re-run
		STW 	R1,[R0,#0]	; Result on LEDS
		BR 		.reset
.rand 	PUSH 	R0			; LFSR Sim
		PUSH 	R1			; Protect regs
		PUSH 	R2
		LDW		R0,[SP,#3]	; Last reg value
		LSL 	R1,R0,#2	; Shift Bit 4 <- 2
		XOR 	R1,R0,R1	; XOR Gate
		LSR 	R0,R0,#1	; Shifted reg
		LUI		R2,#0
		LLI		R2,#8
		AND 	R1,R2,R1	; Mask off Bit 4
		CMPI 	R1,#0		
		BNE 	.done
		LUI		R1,#128
		LLI		R1,#0
		OR 		R0,R0,R1	; OR with 0x8000
.done	STW		R0,[SP,#3]
		POP		R2
		POP		R1
		POP		R0
		RET


