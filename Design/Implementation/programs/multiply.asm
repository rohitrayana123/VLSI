		LUI 	SP, #7		; Init SP
		LLI 	SP, #208
		LUI 	R3, #8		; SWs addr
		LLI 	R3, #0
		LDW 	R0,[R3,#0]	; READ SWs
		LUI 	R1, #0		
		LLI 	R1, #255	; 0x00FF in R1
		AND 	R1,R0,R1	; Lower byte SWs in R1	
		LSR 	R0,R0,#8	; Upper byte SWs in R0		 		
		PUSH 	R0			; Op1
		PUSH 	R1			; Op2
		SUB 	R2,R2,R2	; Zero required	
		PUSH	R2			; Place holder is zero
		BWL 	.multi		; Run Subroutine
		POP 	R1			; Result
		ADDIB 	SP,#2		; Duummy pop
		ADDIB 	R3,#1		; Address of LEDS
		STW 	R1,[R3,#0]	; Result on LEDS
.end 	BR 		.end		; Finish loop
.multi  PUSH 	R0
		PUSH 	R1
		PUSH 	R2
		PUSH 	R3
		PUSH 	R4
		PUSH 	R5
		PUSH 	R6
		LDW 	R0,[SP,#8]	; R0 - Multiplier
		LDW 	R1,[SP,#9]  ; R1 - Quotient                  	                                                                              	
		CMP 	R0,R1
		BLT 	.nSw		; Branch if M < Q
		ADDI 	R2,R1,#0	; Make M the smallest
		ADDI 	R1,R0,#0
		ADDI 	R0,R2,#0
.nSw	SUB 	R2,R2,R2    ; R2 - Accumulator                                                                                                	
		ADDI 	R3,R2,#1	; R3 - 0x0001		
		LUI 	R4,#128		; R4 - 0x8000
		LLI 	R4,#0
.mloop	AND 	R6,R0,R3	; R6 - Cmp var  	
		CMPI 	R6,#1
		BNE 	.nAcc
		SUB 	R3,R3,R3
		ADD 	R2,R2,R1	; A = A + Q	
		ADCI 	R3,R3,#1
		CMPI 	R3,#2 
		BE 		.fail		; OV
.nAcc	LSR 	R0,R0,#1	; M = M >> 1
		CMPI 	R0,#0
		BE 		.done
		AND 	R5,R4,R1
		CMPI 	R5,#0
		BNE 	.fail		
		LSL 	R1,R1,#1	; Q = Q << 1
		BR 		.mloop
.done	STW 	R2,[SP,#7]	; Res on stack frame                                                                                         
		POP 	R6
		POP 	R5
		POP 	R4
		POP 	R3
		POP 	R2
		POP 	R1
		POP 	R0
		RET
.fail	SUB 	R2,R2,R2	; OV - ret 0
		BR 		.done
	
