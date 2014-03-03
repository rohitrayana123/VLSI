		; Sys Init
		
		SUB R0,R0,R0	; Init regs, just to be explicit
		SUB R1,R1,R1
		SUB R2,R2,R2
		SUB R3,R3,R3
		SUB R4,R4,R4
		SUB R5,R5,R5
		SUB R6,R6,R6
		SUB R7,R7,R7	
		LUI R7, #7		; Setup SP
		LLI R7, #255
		
		; Read data
		
		LUI R0, #8		; Address in R0
		LLI R0, #0
		LDW R1,[R0,#0]	; Read switches into R1
		LUI R2, #0		
		LLI R2, #255	; 0x00FF in R2
		AND R2,R1,R2	; Lower byte of switches in R2	
		LSR R1,R1,#8	; Upper byte of switches in R1	
		
		; Call subroutine 

		STW R1,[R7,#0]	; Param 1 = R1, Upper	
		SUBIB R7,#1
		STW R2,[R7,#0]	; Param 2 = R2, Lower
		SUBIB R7,#1
		STW R4,[R7,#0]	; Placeholder = 0
		SUBIB R7,#1		; Created stack frame	
		BWL .multi		; Run Subroutine
		ADDIB R7,#1
		LDW R0,[R7,#0]	; Result in R0	
		ADDIB R7,#2		; Destroy stack frame	
		LUI R1, #8
		LLI R1, #1		; Addres of LEDS
		STW R0,[R1,#0]	; Result on LEDS

		; Finish loop

.end 	BR .end			; Finshed loop

		; Multiply loop

.multi  LDW R5,[R7,#2]	; Op1 in R5
		LDW R6,[R7,#3]	; Op2 in R6
		SUB R2,R2,R2	; Zero in R2
        ADDIB R1,#0		; Check Op2 is not zero
		BNE .done
.loop  	ADD R2,R2,R0	; Add Op1
		SUBIB R1,#1		; Dec Op2
		BE .loop
.done  	STW R2,[R7,#1]	; Store result in the place holder
		RET
