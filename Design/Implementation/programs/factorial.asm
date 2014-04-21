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
		BWL .multi
		POP R1          ; Get res
		ADDIB SP,#1     ; POP
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
