		DISI				; Reset is off anyway	
		LUI 	R7, #7
		LLI 	R7, #208
		LUI		R0,	#2		; R0 is read ptr	0x0200
		LLI 	R0, #0
		ADDI 	R1,R0,#2	; 0x0202
		STW 	R1,[R0,#0]	; Read ptr set to   0x0202			
		STW 	R1,[R0,#1]	; Write ptr set to 	0x0202
		LUI 	R0,#160		; Address of Serial control reg
		LLI 	R0,#1
		LUI 	R1,#0
		LLI 	R1,#1		; Data to enable ints
		STW 	R1,[R0,#0]	; Store 0x001 @ 0xA001
		ENAI
.main	LUI 	R0, #2		; Read ptr address in R0
		LLI 	R0, #0	
		LDW 	R2,[R0,#0]	; Read ptr in R2
		LDW 	R3,[R0,#1]	; Write ptr in R3
		CMP 	R2,R3		 
		BE 		.main		; Jump back if the same
		LDW 	R3,[R2,#0] 	; Load data out of buffer	
		ADDIB 	R2,#1		; Inc read ptr
		SUB 	R0,R0,R0
		LUI 	R0,#2
		LLI 	R0,#6
		SUB 	R0,R0,R2
		BNE		.wrapR
		SUBIB 	R2,#4
.wrapR	LUI 	R0, #2		; Read ptr address in R0
		LLI 	R0, #0	
		STW 	R2,[R0,#0]	; Store new read pointer
		SUB 	R4,R4,R4
		LLI 	R4,#15
		AND 	R3,R4,R3
		CMPI 	R3,#8
		BE		.do
		LLI 	R4,#7
		AND 	R3,R3,R4	
.do 	PUSH 	R3
		BWL		.fact
		POP 	R3
		LUI 	R4,#8	
		LLI 	R4,#1		; Address of LEDs
		STW 	R3,[R4,#0]	; Put factorial on LEDs	
		BR		.main       	; look again	
.fact   PUSH 	R0
		PUSH 	R1
		PUSH 	LR
		LDW 	R1,[SP,#3]  ; Get para	
		ADDIB 	R1,#0
		BE		.retOne     	; 0! = 1
		SUBI 	R0,R1,#1
		PUSH 	R0        	; Pass para
		BWL		.fact		; The output remains on the stack
		PUSH 	R1			; Pass para
		SUBIB 	SP,#1		; Placeholder
		BWL		.multi
		POP 	R1          ; Get res
		ADDIB 	SP,#2     	; pop x 2
		STW 	R1,[SP,#3]
		POP 	LR
		POP 	R1
		POP 	R0
		RET
.retOne ADDIB 	R1,#1    	; Avoid jump checking
		STW 	R1,[SP,#3]                                                                                                  
		POP 	LR                                                                                                          
		POP 	R1                                                                                                          
		POP 	R0                                                                                                          
		RET
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
		BLT		.nSw		; Branch if M < Q
		ADDI 	R2,R1,#0	; Make M the smallest
		ADDI 	R1,R0,#0
		ADDI 	R0,R2,#0
.nSw	SUB 	R2,R2,R2    ; R2 - Accumulator                                                                                                	
		ADDI 	R3,R2,#1	; R3 - 0x0001		
		LUI 	R4,#128		; R4 - 0x8000
		LLI 	R4,#0
.mloop	AND 	R6,R0,R3	; R6 - Cmp var  	
		CMPI 	R6,#1
		BNE		.nAcc
		SUB 	R3,R3,R3
		ADD 	R2,R2,R1	; A = A + Q	
		ADCI 	R3,R3,#1
		CMPI 	R3,#2 
		BE		.fail		; OV
.nAcc	LSR 	R0,R0,#1	; M = M >> 1
		CMPI 	R0,#0
		BE		.done
		AND 	R5,R4,R1
		CMPI 	R5,#0
		BNE		.fail		
		LSL 	R1,R1,#1	; Q = Q << 1
		BR		.mloop
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
.isr  	STF					; Keep flags, disable auto
		PUSH 	R0			; Save only this for now
		LUI 	R0,#160
		LLI 	R0,#0
		LDW 	R0,[R0,#0]	; R1 contains read serial data
		ENAI				; Don't miss event
		PUSH 	R1
		PUSH 	R2
		PUSH 	R3
		PUSH 	R4
		LUI 	R1,#2
		LLI 	R1,#0
		LDW 	R2,[R1,#0]	; R2 contains read ptr
		ADDI 	R3,R1,#1
		LDW 	R4,[R3,#0]	; R4 contain the write ptr
		SUBIB 	R2,#1		; Get out if W == R - 1
		CMP 	R4,R2
		BE 		.isrOut
		ADDIB 	R2,#1
		LUI 	R1,#2
		LLI 	R1,#2
		CMP 	R2,R1
		BNE 	.write	
		ADDIB 	R1,#3
		CMP 	R4,R1
		BE 		.isrOut
.write	STW 	R0,[R4,#0]	; Write to buffer
		ADDIB 	R4,#1
		LUI 	R1,#2
		LLI 	R1,#6
		CMP 	R1,R4
		BNE 	.wrapW
		SUBIB 	R4,#4
.wrapW	STW 	R4,[R3,#0]	; Inc write ptr
.isrOut	POP 	R4
		POP 	R3
		POP 	R2
		POP 	R1
		POP 	R0
		LDF
		RETI

