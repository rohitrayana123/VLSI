; Compute the factorial of R0

		; Sys Init		
		LUI SP, #7		; Setup SP
		LLI SP, #255


		
		LLI R6,#2
		; zero test
		PUSH R6			; Pass para
		PUSH R6			; placeholder for result
		BWL .multi		; Run Subroutine
		POP R6
		POP R6

		; main
		LLI R5,#6	
		PUSH R5			; Pass para
		PUSH R0			; placeholder for result
		BWL .fact		; Run Subroutine
		POP R0
		POP R5
		
		; Finish loop
.end 	BR .end

		; Recurrisve factorial
.fact  	PUSH R0
		PUSH R1
		PUSH R2
		PUSH LR		
		LDW R1,[SP,#5]	; Get para				
		ADDIB R1,#0
		BNE .retOne		; 0! = 1
		SUBI R0,R1,#1
		PUSH R0			; Pass para
		PUSH R0			; placeholder
		BWL .fact
		POP R0
		POP R2
		PUSH R2			; Pass para
		PUSH R1			; Pass para
		BWL .multi
		POP R1			; Get res
		POP R0
		BR .done	
.retOne	ADDIB R1,#1
.done   STW R1,[SP,#5]
		POP LR
		POP R2
		POP R1
		POP R0
		RET


		; Multiply function
.multi	LDW R0,[SP,#0]
		LDW R1,[SP,#1]
		SUB R2,R2,R2
		ADDIB R1,#0
		BNE .done
.loop	ADD R2,R2,R0
		SUBIB R1,#1
		BE .loop
.done 	STW R2,[SP,#0]
		RET
