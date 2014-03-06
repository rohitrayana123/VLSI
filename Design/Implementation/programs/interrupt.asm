		LUI R7, #7		; Setup SP
		LLI R7, #255
		LUI	R0,	#1		; R0 is read ptr	0x0100
		ADDI R1,R0,#2	; 0x0102
		STW R1,[R0,#0]	; Read ptr set to   0x0102			
		STW R1,[R0,#1]	; Write ptr set to 	0x0102
		ENAI			; Enable interrupts
		LUI R0,#160		; Address of Serial control reg
		LLI R1,#01		; Data to enable ints
		STW R1,[R0,#1]	; Store 0x001 @ 0xA001		AJR - Ints from here should be OK
		LLI R3,#18		; main line -1 in .main
		BR .main		;JMP R3,#0		; Jump to main, line number - 1	
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
.isr  	SUBIB R7,#1		; Dec SP		; Save regs
		STW R0,[R7,#0]	; Push data
		SUBIB R7,#1		; Dec SP
		STW R1,[R7,#0]	; Push data
		SUBIB R7,#1		; Dec SP
		STW R2,[R7,#0]	; Push data
		SUBIB R7,#1		; Dec SP
		STW R3,[R7,#0]	; Push data
		SUBIB R7,#1		; Dec SP
		STW R4,[R7,#0]	; Push data
		SUBIB R7,#1		; Dec SP
		STW R5,[R7,#0]	; Push data
		SUBIB R7,#1		; Dec SP
		STW R6,[R7,#0]	; Push data
			
		; Read serial data
		LUI R0,#160
		LLI R0,#0
		LDW R1,[R0,#0]	; R1 contains read serial data

		; Get read ptr
		LUI R0,#1
		LLI R0,#0
		LDW R2,[R0,#0]	; R2 contains read ptr
		
		; Get write ptr
		ADDI R3,R0,#1
		LDW R4,[R3,#0]	; R4 contain the write ptr
	
		; Put serial data at ptr address
		STW R1,[R4,#0]	; Write to buffer
		ADDIB R4,#1
		STW R4,[R3,#0]	; Inc write ptr
						
.skip	LDW R6,[R7,#0]	; Pop data	; Rstore regs
		ADDIB R7,#1		; Iin SP
		LDW R5,[R7,#0]	; Pop data
		ADDIB R7,#1		; Iin SP
		LDW R4,[R7,#0]	; Pop data
		ADDIB R7,#1		; Iin SP
		LDW R3,[R7,#0]	; Pop data
		ADDIB R7,#1		; Iin SP
		LDW R2,[R7,#0]	; Pop data
		ADDIB R7,#1		; Iin SP
		LDW R1,[R7,#0]	; Pop data
		ADDIB R7,#1		; Iin SP
		LDW R0,[R7,#0]	; Pop data
		ADDIB R7,#1
		RETI
		
.main	LUI R0, #1		; Read ptr address in R0
		LLI R0, #0	
		LDW R2,[R0,#0]	; Read ptr in R2
		LDW R3,[R0,#1]	; Write ptr in R3
		SUB R5,R2,R3		 
		BNE .main		; Jump back if the same
		LDW R3,[R2,#0] 	; Load data out of buffer
		LUI R4,#8	
		LLI R4,#1		; Address of LEDs
		STW R3,[R4,#0]	; Put read data on LEDs
		ADDIB R2,#1		; Inc read ptr
		STW R2,[R0,#0]	; Store new read pointer
		BR .main       	; look again	
