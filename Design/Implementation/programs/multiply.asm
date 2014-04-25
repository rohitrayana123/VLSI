		LUI SP, #7		; Init SP
		LLI SP, #208
		LUI R0, #8		; SWs ADDR
		LLI R0, #0
		LDW R0,[R0,#0]	; READ SWs
		LUI R1, #0		
		LLI R1, #255	; 0x00FF in R1
		AND R1,R0,R1	; Lower byte SWs in R1	
		LSR R0,R0,#8	; Upper byte SWs in R0		 
		SUB R2,R2,R2	; Zero required	
		PUSH R0			; Op1
		PUSH R1			; Op2
		PUSH R2			; Place holder is zero
		BWL .multi		; Run Subroutine
		POP R1			; Result
		ADDIB SP,#2		; Duummy pop
		LUI R4, #8
		LLI R4, #1		; Address of LEDS
		STW R1,[R4,#0]	; Result on LEDS
.end 	BR .end			; Finish loop
.multi  PUSH R0
		PUSH R1
		PUSH R2
		PUSH R3
		PUSH R4
		PUSH R5
		PUSH R6
		LDW R0,[SP,#8]	; R0 - Multiplier
		LDW R1,[SP,#9]  ; R1 - Quotient                  	                                                                              	
		SUB R2,R2,R2    ; R2 - Accumulator                                                                                                	
		ADDI R3,R2,#1	; R3 - Compare 1/0	
		SUB R4,R4,R4	; R4 - Loop counter	
.lpMul	AND R6,R0,R3	; R6 - Cmp var  	
		CMPI R6,#0
		BE .sh
		SUB R3,R3,R3
		ADD R2,R2,R1	; A = A + Q	
		ADCI R3,R3,#1
		CMPI R3,#2 
		BE .over		; OV
.sh		LUI R5,#128
		LLI R5,#0		; 0x8000
		AND R5,R5,R1
		CMPI R5,#0
		BE .shift		
		CMPI R0,#0
		BNE .over		; And M != 0
.shift	LSL R1,R1,#1	; Q = Q << 1
		LSR R0,R0,#1	; M = M >> 1
		ADDIB R4,#1		; i++
		CMPI R4,#15
		BNE .lpMul
.done	STW R2,[SP,#7]	; Res on stack frame                                                                                         
		POP R6
		POP R5
		POP R4
		POP R3
		POP R2
		POP R1
		POP R0
		RET
.over	SUB R2,R2,R2	; OV - RET 0
		BR .done
	
