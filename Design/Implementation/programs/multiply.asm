		BR .main
.multi 	LDW R0,[R7,2]
		LDW R1,[R7,3]
		ADD R0,R1,R1
		STW R0,[R7,1]	; Store in place holder
.main 	SUB R0,R0,R0	; Init regs
		SUB R1,R1,R1
		SUB R2,R2,R2
		SUB R3,R3,R3
		SUB R4,R4,R4
		SUB R5,R5,R5
		SUB R6,R6,R6
		SUB R7,R7,R7	; Setup SP
		LUI R7, #7
		LLI R7, #255	; Put stuff here...
		LUI R0, #8		; Address in R0
		LLI R0, #0
		LDW R1,[R0,0]	; Switches in R1
		LUI R2, #0		
		LLI R2, #255
		AND R3,R1,R2	
		STW R3,[R7,0]
		SUBIB R7,#1		; Lower byte on stack
		LDW R1,[R0,0]	; Switches in R1 again
		LSR R1,R1,#8	
		STW R1,[R7,0]
		SUBIB R7,#1		; Upper byte on stack
		LUI R0, #170
		LLI R0, #170
		STW R0,[R7,0]	; Place holder on stack
		SUBIB R7,#1		; Call subroutineh
		BR .multi
		ADDIB R7,#1		; Return here
		LDW R0,[R7,0]	; Result in R0	
		ADDIB R7,#1
		LDW R1,[R7,0]
		ADDIB R7,#1
		LDW R2,[R7,0]	; Stack frame destoryed
		LUI R1, #8
		LLI R1, #1		; Addres of LEDS
		STW R0,[R1,0]	; Result on LEDS
		LUI R0, #255	; Write to stop mem pos - Not for BIM
		LLI R0, #255
		LUI R1, #4 
		LLI R1, #0	
		STW R0,[R1,0]
