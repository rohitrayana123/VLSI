		LUI R7, #7		; Setup SP
		LLI R7, #255
		LUI	R0,	#1		; R0 is read ptr
		LUI R1, #1		' R1 in write ptr
		LLI R1, #1
		TOGI			; Enable interrupts
		LUI R0,#A0		; Address of Serial control reg
		LLI R1,#01		; Data to enable ints
		STW R1,[R0,#1]	; Store 0x001 @ 0xA001		AJR - Ints from here should be OK
		LLI R0,#17		; main line -1 in R0	
		JMP R0,#0		; Jump to main, line number - 1
		ADDIB R0,#0		; Unreachable code to position isr
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0	
.isr  	ADDIB R0,#0
		RETI
.main	SUB R0,R0,R0	; START OF MAIN
		SUB R1,R1,R1
		SUB R2,R2,R2
		SUB R3,R3,R3	; Dummy prog, waiting for int
		SUB R4,R4,R4
		BWL .isr
		SUB R5,R5,R5
		SUB R6,R6,R6
		BR .main       	; done	
