		; Sys Init		
		LUI SP, #7		; Setup SP
		LLI SP, #208
		
		; main
		LLI R5,#8	
		PUSH R5			; Pass para
		BWL .fact		; Run Subroutine
		POP R5			; Para overwritten with result	

		; Finish loop
.end 	BR .end

		; Recurrisve factorial
.fact  	PUSH R0
		PUSH R1
		PUSH LR		
		LDW R1,[SP,#3]	; Get para				
		ADDIB R1,#0
		BNE .retOne		; 0! = 1
		SUBI R0,R1,#1
		PUSH R0			; Pass para
		BWL .fact		; The output from fact to multi remains on the stack		
		PUSH R1			; Pass para
		BWL .multi		
		POP R1			; Get res
		ADDIB SP,#1		; POP
		STW R1,[SP,#3]
		POP LR
		POP R1
		POP R0
		RET
.retOne	ADDIB R1,#1		; Trade off code size to avoid jump checking	
		STW R1,[SP,#3]
		POP LR
		POP R1
		POP R0
		RET


		; Multiply function
.multi	LDW R2,[SP,#0]	; Use different regs to avoid context save
		LDW R3,[SP,#1]
		SUB R4,R4,R4
		ADDIB R3,#0
		BNE .done
.loop	ADD R4,R4,R2
		SUBIB R3,#1
		BE .loop
.done 	STW R4,[SP,#0]
		RET
