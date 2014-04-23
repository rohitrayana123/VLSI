		LUI R7, #7
		LLI R7, #208
		LUI R0, #8		; Address in R0
		LLI R0, #0
		LDW R0,[R0,#0]	; Read switches into R0
		LUI R1,#0		; Calculate only 8 or less
		LLI R1,#8
		CMP R1,R0
		BE .do
		SUBIB R1,#1
		AND R0,R0,R1
.do		PUSH R0			; Pass para
		BWL .fact		; Run Subroutine
		POP R0			; Para overwritten with result	
		LUI R4, #8
		LLI R4, #1		; Address of LEDS
		STW R0,[R4,#0]	; Result on LEDS
.end 	BR .end			; finish loop
.fact   PUSH R0
		PUSH R1
		PUSH LR
		LDW R1,[SP,#3]  ; Get para	
		ADDIB R1,#0
		BE .retOne     	; 0! = 1
		SUBI R0,R1,#1
		PUSH R0        	; Pass para
		BWL .fact		; The output from fact to multi remains on the stack
		PUSH R1			; Pass para
		SUBIB SP,#1		; Placeholder
		BWL .multi
		POP R1          ; Get res
		ADDIB SP,#2     ; POP x 2
		STW R1,[SP,#3]
		POP LR
		POP R1
		POP R0
		RET
.retOne ADDIB R1,#1    	; Trade off code size to avoid jump checking
		STW R1,[SP,#3]                                                                                                  
		POP LR                                                                                                          
		POP R1                                                                                                          
		POP R0                                                                                                          
		RET
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
		ADDI R6,R4,#1	; R6 - Constant 1
		SUB R5,R5,R5	; R5 - Constant 0
		SUB R0,R0,R0	; R0 - C check
		AND R1,R2,R6 	; Stage 1, R1 - cmp
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
		AND R1,R2,R6	; Stage 8
		CMPI R1,#0
		BE .sh8
		ADD R4,R4,R3	
.sh8	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 9
		CMPI R1,#0
		BE .sh9
		ADD R4,R4,R3	
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh9	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 10 
		CMPI R1,#0
		BE .sh10
		ADD R4,R4,R3
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh10	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 11
		CMPI R1,#0
		BE .sh11
		ADD R4,R4,R3
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh11	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 12
		CMPI R1,#0
		BE .sh12
		ADD R4,R4,R3
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh12	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6  	; Stage 13
		CMPI R1,#0
		BE .sh13
		ADD R4,R4,R3
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh13	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6	; Stage 14 
		CMPI R1,#0
		BE .sh14
		ADD R4,R4,R3	
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh14	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 	; Stage 15
		CMPI R1,#0
		BE .sh15
		ADD R4,R4,R3
		ADCI R0,R5,#0
		CMPI R0,#0
		BNE .over
.sh15	LSL R3,R3,#1
		LSR R2,R2,#1	
		AND R1,R2,R6  	; Stage 16 
		CMPI R1,#0
		BE .sh16
		ADD R4,R4,R3
		ADCI R0,R5,#0
		CMPI R0,#0
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
		STW R4,[SP,#7]	; Res on stack frame                                                                                         
		POP R6
		POP R5
		POP R4
		POP R3
		POP R2
		POP R1
		POP R0
		RET
