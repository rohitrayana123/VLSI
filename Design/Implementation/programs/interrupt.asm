		DISI			; Reset is off anyway	
		LUI R7, #7
		LLI R7, #208
		LUI	R0,	#1		; R0 is read ptr	0x0100
		ADDI R1,R0,#2	; 0x0102
		STW R1,[R0,#0]	; Read ptr set to   0x0102			
		STW R1,[R0,#1]	; Write ptr set to 	0x0102
		LUI R0,#160		; Address of Serial control reg
		LLI R1,#01		; Data to enable ints
		STW R1,[R0,#1]	; Store 0x001 @ 0xA001
		LLI R3,#18		; main line -1 in .main
		ENAI
		BR .main
.isr  	DISI
		STF				; Keep flags
		PUSH R0			; Save only this for now
		LUI R0,#160
		LLI R0,#0
		LDW R0,[R0,#0]	; R1 contains read serial data
		ENAI
		PUSH R1
		PUSH R2
		PUSH R3
		PUSH R4
		LUI R1,#1
		LLI R1,#0
		LDW R2,[R1,#0]	; R2 contains read ptr
		ADDI R3,R1,#1
		LDW R4,[R3,#0]	; R4 contain the write ptr
		SUBIB R2,#1		; Get out if W == R - 1
		CMP R4,R2
		BE .isrOut
		ADDIB R2,#1
		LUI R1,#1
		LLI R1,#2
		CMP R2,R1
		BNE .write	
		ADDIB R1,#3
		CMP R4,R1
		BE .isrOut
.write	STW R0,[R4,#0]	; Write to buffer
		ADDIB R4,#1
		LUI R1,#1
		LLI R1,#6
		CMP R1,R4
		BNE .wrapW
		SUBIB R4,#4
.wrapW	STW R4,[R3,#0]	; Inc write ptr
.isrOut	POP R4
		POP R3
		POP R2
		POP R1
		POP R0
		LDF
		RETI
.main	LUI R0, #1		; Read ptr address in R0
		LLI R0, #0	
		LDW R2,[R0,#0]	; Read ptr in R2
		LDW R3,[R0,#1]	; Write ptr in R3
		CMP R2,R3		 
		BE .main		; Jump back if the same
		LDW R3,[R2,#0] 	; Load data out of buffer	
		ADDIB R2,#1		; Inc read ptr
		SUB R0,R0,R0
		LUI R0,#1
		LLI R0,#6
		SUB R0,R0,R2
		BNE .wrapR
		SUBIB R2,#4
.wrapR	LUI R0, #1		; Read ptr address in R0
		LLI R0, #0	
		STW R2,[R0,#0]	; Store new read pointer
		SUB R4,R4,R4
		LLI R4,#15
		AND R3,R4,R3
		CMPI R3,#8
		BE .do
		LLI R4,#7
		AND R3,R3,R4	
.do 	PUSH R3
		BWL .fact
		POP R3
		LUI R4,#8	
		LLI R4,#1		; Address of LEDs
		STW R3,[R4,#0]	; Put factorial on LEDs	
		BR .main       	; look again	
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
