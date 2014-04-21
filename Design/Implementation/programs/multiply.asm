		LUI R7, #7
		LLI R7, #208
		LUI R0, #8		; Address in R0
		LLI R0, #0
		LDW R0,[R0,#0]	; Read switches into R0
		LUI R1, #0		
		LLI R1, #255	; 0x00FF in R1
		AND R1,R0,R1	; Lower byte of switches in R1	
		LSR R0,R0,#8	; Upper byte of switches in R0		 
		PUSH R0
		PUSH R1
		BWL .multi		; Run Subroutine
		POP R1			; Result
		POP R0			; Nothing
		LUI R4, #8
		LLI R4, #1		; Address of LEDS
		STW R1,[R4,#0]	; Result on LEDS
.end 	BR .end			; Finish loop
.multi  PUSH R2 		; R2 is M
		PUSH R3 		; R3 is Q
		PUSH R4 		; R4 Is ACC
		PUSH R6 		; R6 is 1
		PUSH R1 		; R1 is temp
		LDW R2,[SP,#5]
		LDW R3,[SP,#6]                                                                                                  
		SUB R4,R4,R4                                                                                                    
		LUI R6,#0
		LLI R6,#1 		; load 1 into R6 for compare
		AND R1,R2,R6 	; Loop unroll for maximum fastness
		CMPI R1,#0
		BE .sh1
		ADD R4,R4,R3
.sh1	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh2
		ADD R4,R4,R3
.sh2	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh3
		ADD R4,R4,R3
.sh3	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh4
		ADD R4,R4,R3
.sh4	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh5
		ADD R4,R4,R3
.sh5	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh6
		ADD R4,R4,R3
.sh6	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh7
		ADD R4,R4,R3
.sh7	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh8
		ADD R4,R4,R3
.sh8	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh9
		ADD R4,R4,R3
.sh9	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh10
		ADD R4,R4,R3
.sh10	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh11
		ADD R4,R4,R3
.sh11	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh12
		ADD R4,R4,R3
.sh12	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh13
		ADD R4,R4,R3
.sh13	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh14
		ADD R4,R4,R3
.sh14	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh15
		ADD R4,R4,R3
.sh15	LSL R3,R3,#1
		LSR R2,R2,#1
		AND R1,R2,R6 
		CMPI R1,#0
		BE .sh16
		ADD R4,R4,R3
.sh16	LSL R3,R3,#1
		LSR R2,R2,#1
		STW R4,[SP,#5]                                                                                                    
		POP R1
		POP R6
	 	POP R4
		POP R3
		POP R2
		RET
