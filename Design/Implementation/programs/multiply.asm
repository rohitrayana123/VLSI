		LUI SP, #7		; Init SP
		LLI SP, #208
		LUI R0, #8		; SWs ADDR
		LLI R0, #0
		LDW R0,[R0,#0]	; READ SWs
		LUI R1, #0		
		LLI R1, #255	; 0x00FF in R1
		AND R1,R0,R1	; Lower byte SWs in R1	
		LSR R0,R0,#8	; Upper byte SWs in R0		 
		PUSH R0
		PUSH R1
		BWL .multi		; Run Subroutine
		POP R1			; Result
		ADDIB SP,#1		; Duummy pop
		LUI R4, #8
		LLI R4, #1		; Address of LEDS
		STW R1,[R4,#0]	; Result on LEDS
.end 	BR .end			; Finish loop
.multi  LDW R2,[SP,#0]	; R2 - Multiplier
		LDW R3,[SP,#1]  ; R3 - Quotient                  	                                                                              
		SUB R4,R4,R4    ; R4 - Accumulator                                                                                                
		LUI R6,#0		; R6 - Constant 1 
		LLI R6,#1 		; R1 - CMP var
		AND R1,R2,R6 	; Stage 1
		CMPI R1,#0		; LSb ?	
		BE .sh1
		ADD R4,R4,R3	; (LSb == 1)?
.sh1	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6	; Stage 2 
		CMPI R1,#0
		BE .sh2
		ADD R4,R4,R3
.sh2	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 3
		CMPI R1,#0
		BE .sh3
		ADD R4,R4,R3
.sh3	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 4 
		CMPI R1,#0
		BE .sh4
		ADD R4,R4,R3
.sh4	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 5 
		CMPI R1,#0
		BE .sh5
		ADD R4,R4,R3
.sh5	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 6 
		CMPI R1,#0
		BE .sh6
		ADD R4,R4,R3
.sh6	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6  	; Stage 7
		CMPI R1,#0
		BE .sh7
		ADD R4,R4,R3
.sh7	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6  	; Stage 8 
		CMPI R1,#0
		BE .sh8
		ADD R4,R4,R3
.sh8	STW R4,[SP,#0]	; Res on stack frame                                                                                         
		RET
