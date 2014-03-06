		; Sys Init		
		LUI R7, #7		; Setup SP
		LLI R7, #255
		
		; main
		BWL .fact		; Run Subroutine
	
		; Finish loop
.end 	BR .end

		; Recurrisve factorial
.fact  	PUSH Lr
		POP Lr
		RET
