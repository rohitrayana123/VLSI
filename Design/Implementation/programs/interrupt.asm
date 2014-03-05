		LUI R7, #7		; Setup SP
		LLI R7, #255
		LUI	R0,	#1		; R0 is read ptr	0x0100
		ADDI R1,R0,#1	; 0x0101
		STW R1,[R0,#0]	; Read ptr set to   0x0101		
		STW R1,[R0,#1]	; Write ptr set to 	0x0101
		ADDIB R0,#0		; ENINT			; Enable interrupts
		LUI R0,#160		; Address of Serial control reg
		LLI R1,#01		; Data to enable ints
		STW R1,[R0,#1]	; Store 0x001 @ 0xA001		AJR - Ints from here should be OK
		LLI R3,#18		; main line -1 in .main
		BR .main		;JMP R3,#0		; Jump to main, line number - 1
		ADDIB R0,#0		; Unreachable code to position isr
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
.isr  	ADDIB R0,#0
		RET
.main	LUI R0, #1		; Read ptr address in R0
		LLI R0, #0	
		ADDI R1,R0,#1	; No data position in R1
		LDW R2,[R0,#0]	; Read ptr in R2
		SUB R0,R1,R2	 
		BNE .main		; Jump back if in default position
		LDW R3,[R2,#0] 	; Load data out of buffer
		LUI R4,#8	
		LLI R4,#1		; Address of LEDs
		STW R3,[R4,#0]	; Put read data on LEDs
		SUBIB R2,#1		; Dec read ptr
		STW R2,[R0,#0]	; Store new read pointer
		BR .main       	; look again	
