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
		LDW R2,[SP,#8]	; R2 - Multiplier
		LDW R3,[SP,#9]  ; R3 - Quotient                  	                                                                              
		SUB R4,R4,R4    ; R4 - Accumulator                                                                                                	
		ADDI R6,R4,#1	; R6 - Compare 1/0
		LUI R5,#128
		LLI R5,#0		; R5 - 0x8000
		AND R1,R2,R6 	; Stage 1, R1 - cmp
		CMPI R1,#0		; LSb ?	
		BE .sh1
		ADD R4,R4,R3	; (LSb == 1)?
.sh1	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6	; Stage 2 
		CMPI R1,#0
		BE .sh2
		ADD R4,R4,R3
.sh2	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 3
		CMPI R1,#0
		BE .sh3
		ADD R4,R4,R3
.sh3	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 4 
		CMPI R1,#0
		BE .sh4
		ADD R4,R4,R3
.sh4	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 5 
		CMPI R1,#0
		BE .sh5
		ADD R4,R4,R3
.sh5	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 6 
		CMPI R1,#0
		BE .sh6
		ADD R4,R4,R3
.sh6	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6  	; Stage 7
		CMPI R1,#0
		BE .sh7
		ADD R4,R4,R3
.sh7	AND R0,R5,R3
		CMPI R0,#0
		BNE .over1
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6	; Stage 8
		CMPI R1,#0
		BE .sh8
		ADD R4,R4,R3
		BR .sh8
.over1  BR .over
.sh8	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 9
		CMPI R1,#0
		BE .sh9
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1
		CMPI R6,#2
		BNE .over
.sh9	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 10 
		CMPI R1,#0
		BE .sh10
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1
		CMPI R6,#2
		BNE .over
.sh10	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 11
		CMPI R1,#0
		BE .sh11
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1
		BNE .over
.sh11	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 12
		CMPI R1,#0
		BE .sh12
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1	
		BNE .over
.sh12	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6  	; Stage 13
		CMPI R1,#0
		BE .sh13
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1	
		BNE .over
.sh13	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6	; Stage 14 
		CMPI R1,#0
		BE .sh14
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1	
		BNE .over
.sh14	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 15
		CMPI R1,#0
		BE .sh15
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1	
		BNE .over
.sh15	AND R0,R5,R3
		CMPI R0,#0
		BNE .over
		LSL R3,R3,#1
		LSR R2,R2,#1	
		AND R1,R2,R6  	; Stage 16 
		CMPI R1,#0
		BE .sh16
		SUB R6,R6,R6
		ADD R4,R4,R3	
		ADCI R6,R4,#1
		BNE .over
.sh16	STW R4,[SP,#7]	; Res on stack frame                                                                                         
		POP R6
		POP R5
		POP R4
		POP R3
		POP R2
		POP R1
		POP R0
		RET
.over	SUB R4,R4,R4
		BR .sh16	
