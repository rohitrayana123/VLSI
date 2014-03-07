; Compute the factorial of R0

		; Sys Init		
		LUI SP, #7		; Setup SP
		LLI SP, #255

		; zero test
		PUSH R6			; Pass para
		PUSH R6			; placeholder for result
		BWL .fact		; Run Subroutine
		POP R6
		POP R6

		; main
		LLI R5,#5	
		PUSH R5			; Pass para
		PUSH R0			; placeholder for result
		BWL .fact		; Run Subroutine
		POP R0
		POP R5
		
		; Finish loop
.end 	BR .end

		; Recurrisve factorial
.fact  	PUSH LR		
		LDW R0,[SP,#1]	; Get para				
		ADDIB R0,#0
		BNE .retOne		; 0! = 1
		PUSH R0			; Pass para
		PUSH R1			; Pass para
		BWL .multi
		POP R1			; Get res
		POP R0
		POP LR
		RET
.retOne	ADDIB R0,#1
		STW R0,[SP,#1]
		POP LR
		RET


		; Multiply function
.multi	LDW R0,[SP,#1]
		LDW R1,[SP,#2]
		SUB R2,R2,R2
		ADDIB R1,#0
		BNE .done
.loop	ADD R2,R2,R0
		SUBIB R1,#1
		BE .loop
.done 	STW R2,[SP,#1]
		RET
