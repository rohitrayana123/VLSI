		DISI			; Reset is off anyway
		LUI R7, #7		; Setup SP
		LLI R7, #255
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
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
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
		
		; Get read ptr
		LUI R1,#1
		LLI R1,#0
		LDW R2,[R1,#0]	; R2 contains read ptr
		
		; Get write ptr
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

		; Put serial data at ptr address
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


; Recurrisve factorial
.fact   PUSH R0
		PUSH R1
		PUSH LR
		LDW R1,[SP,#3]  ; Get para	
		ADDIB R1,#0
		BE .retOne             ; 0! = 1
		SUBI R0,R1,#1
		PUSH R0                 ; Pass para
		BWL .fact               ; The output from fact to multi remains on the stack
		PUSH R1                 ; Pass para
		BWL .multi
		POP R1                  ; Get res
		ADDIB SP,#1             ; POP
		STW R1,[SP,#3]
		POP LR
		POP R1
		POP R0
		RET
.retOne ADDIB R1,#1             ; Trade off code size to avoid jump checking
		STW R1,[SP,#3]                                                                                                  
		POP LR                                                                                                          
		POP R1                                                                                                          
		POP R0                                                                                                          
		RET


; Multiply routine
.multi  PUSH R2
		PUSH R3
		PUSH R4
		LDW R2,[SP,#3]
		LDW R3,[SP,#4]                                                                                                  
		SUB R4,R4,R4                                                                                                    
	    ADDIB R3,#0                                                                                                     
		BE .end                                                                                                       
.loop   ADD R4,R4,R2                                                                                                            
		SUBIB R3,#1                                                                                                     
	 	BNE .loop                                                                                                        
.end    STW R4,[SP,#3]                                                                                                          
	 	POP R4
		POP R3
		POP R2
		RET

