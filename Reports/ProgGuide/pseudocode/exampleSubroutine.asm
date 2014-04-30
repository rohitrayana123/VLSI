		PUSH 	R0			; Op1					; STEM CALLER
		PUSH 	R1			; Op2
		SUBIB	SP,#1		; Dummy push
		BWL 	.one		; Run Subroutine
		POP 	R0			; Result
		ADDIB 	SP,#2		; Duummy pop x 2
		...
.one	PUSH 	LR		  	; Save link register	; CALLEE/CALLER
		PUSH 	R0	
		PUSH 	R1			; Save caller regs
		PUSH 	R2
		PUSH 	R3
		PUSH 	R4
		LDW 	R3,[SP,#6]	; R3 - Op2
		LDW 	R4,[SP,#7]  ; R4 - Op1                  	                                                                              	
		...
		PUSH 	R3	
		BWL		.two		; Nested subroutine
		POP		R3			; Pass and return
		...
		STW 	R2,[SP,#5]	; Output on frame                                                                                         
		POP 	R4
		POP 	R3
		POP 	R2
		POP 	R1
		POP 	R0
		POP		LR
		RET
.two	PUSH 	R0			; No LR save			; LEAF CALLEE
		LDW		R0,[SP,#1]
		...	
		STW		R0,[SP,#1]
		POP R0
		RET
