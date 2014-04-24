		LUI 	R7,#7		; Init SP
		LLI 	R7,#208
		LUI 	R0,#8		; Address in R0
		LLI 	R0,#0
		LDW 	R0,[R0,#0]	; Read switches into R0
		LUI 	R1,#8
		LLI 	R1,#1		; CONSTANT - Address of LEDS
		LUI 	R2,#0		
		LLI 	R2,#10		; CONSTANT - 0x0008
		LUI 	R3,#128
		LLI 	R3,#0		; CONSTANT - 0x8000
		SUB 	R4,R4,R4	; Loop counter
		PUSH 	R0
.loop	BWL 	.rand		 			
		ADDIB 	R4,#1		; INC loop counter
		CMPI 	R4,#15
		BNE 	.loop
		LDW 	R0,[SP,#0]	; No POP as re-run
		STW 	R0,[R1,#0]	; Result on LEDS
		BR 		.loop
.rand 	LDW 	R4,[SP,#0]	; Linear feedback shift register sim		
		LSL 	R5,R4,#2	; Shift Bit 2 -> 4
		XOR 	R3,R4,R5	; XOR Gate
		LSR 	R4,R4,#1	; Shifted reg
		AND 	R3,R3,R2	; Mask off Bit 4
		CMPI 	R3,#0		
		BNE 	.done
		OR 		R4,R4,R3	; OR with 0x8000
.done	STW 	R4,[SP,#0]
		RET


