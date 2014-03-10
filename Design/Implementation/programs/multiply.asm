		SUB R0,R0,R0	; Init regs
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
		LDW R0,[R0,#0]	; Read switches into R0
		LUI R1, #0		
		LLI R1, #255	; 0x00FF in R1
		AND R1,R0,R1	; Lower byte of switches in R1	
		LSR R0,R0,#8	; Upper byte of switches in R0	
		
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
.end 	BR .end

		; Multiply loop
.multi  LDW R0,[R7,#2]	; Op1 in R0
		LDW R1,[R7,#3]	; Op2 in R1
		SUB R2,R2,R2	; Zero in R2
        ADDIB R1,#0		; Check Op2 is not zero
		BE .done
.loop  ADD R2,R2,R0	; Add Op1
		SUBIB R1,#1		; Dec Op2
		BNE .loop
.done  STW R2,[R7,1]	; Store result in place holder
		RET
.end  BR .end			; finshed loop
.main  LLI R7, #255	
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
		BWL .multi
		ADDIB R7,#1		; Return here
		LDW R0,[R7,0]	; Result in R0	
		ADDIB R7,#1
		LDW R1,[R7,0]
		ADDIB R7,#1
		LDW R2,[R7,0]	; Stack frame destoryed
		LUI R1, #8
		LLI R1, #1		; Addres of LEDS
		STW R0,[R1,0]	; Result on LEDS
		BR .end         ; done	
