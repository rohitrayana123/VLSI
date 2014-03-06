; Compute the factorial of R0

		; Sys Init		
		LUI SP, #7		; Setup SP
		LLI SP, #255
		
		; main
		LLI R6,5
		SUBIB SP,#1
		STW R6,[SP,#0]
		BWL .fact		; Run Subroutine
		LDW R6,[SP,#0]
		ADDIB SP,#1
		
		; Finish loop
.end 	BR .end

		; Recurrisve factorial
.fact  	SUBIB SP,#1
		PUSH Lr
		LDW R0,[SP,#1]			
		SUBIB R0,#1
		BNE .zero
		SUBIB SP,#1
		STW R0,[SP,#0]
		BWL .fact
		LDW R0,[SP,#0]
		ADDIB SP,#1
.zero   POP Lr
		ADDIB SP,#1
		RET
