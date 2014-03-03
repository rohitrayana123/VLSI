		; Sys Init		
		LUI R7, #7		; Setup SP
		LLI R7, #255
		
		; Read data		
		LUI R0, #8		; Address in R0
		LLI R0, #0
		LDW R0,[R0,#0]	; Read switches into R0
		LUI R1, #0		
		LLI R1, #255	; 0x00FF in R1
		AND R1,R0,R1	; Lower byte of switches in R1	
		LSR R0,R1,#8	; Upper byte of switches in R0	
		
		; Call subroutine 
		STW R0,[R7,#0]	; Param 1 = R1, Upper	
		SUBIB R7,#1
		STW R1,[R7,#0]	; Param 2 = R2, Lower
		SUBIB R7,#1
		STW R2,[R7,#0]	; Placeholder = 0
		SUBIB R7,#1		; Created stack frame	
		BWL .multi		; Run Subroutine
		ADDIB R7,#1		; Restore registers
		LDW R2,[R7,#0]	; Result in R2
		ADDIB R7,#1	
		LDW R1,[R7,#0]	; Restore R1	
		ADDIB R7,#1
		LDW R0,[R7,#0]	; Restire R0	
		LUI R4, #8
		LLI R4, #1		; Address of LEDS
		STW R2,[R4,#0]	; Result on LEDS

		; Finish loop
.end 	BR .end			; Finshed loop

		; Multiply loop
.multi  LDW R0,[R7,#2]	; Op1 in R0
		LDW R1,[R7,#3]	; Op2 in R1
		SUB R2,R2,R2	; Zero in R2
        ADDIB R1,#0		; Check Op2 is not zero
		BNE .done
.loop  	ADD R2,R2,R0	; Add Op1
		SUBIB R1,#1		; Dec Op2
		BE .loop
.done  	STW R2,[R7,#1]	; Store result in the place holder
		RET
