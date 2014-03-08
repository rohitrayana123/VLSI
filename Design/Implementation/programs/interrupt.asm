		LUI R7, #7		; Setup SP
		LLI R7, #255
		LUI	R0,	#1		; R0 is read ptr	0x0100
		ADDI R1,R0,#2	; 0x0102
		STW R1,[R0,#0]	; Read ptr set to   0x0102			
		STW R1,[R0,#1]	; Write ptr set to 	0x0102
		ENAI			; Enable interrupts
		LUI R0,#160		; Address of Serial control reg
		LLI R1,#01		; Data to enable ints
		STW R1,[R0,#1]	; Store 0x001 @ 0xA001		AJR - Ints from here should be OK
		LLI R3,#18		; main line -1 in .main
		BR .main		;JMP R3,#0		; Jump to main, line number - 1	
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
.isr  	PUSH R0
		PUSH R1
		PUSH R2
		PUSH R3
		PUSH R4
		PUSH R5
		PUSH R6

		; Read serial data
		LUI R0,#160
		LLI R0,#0
		LDW R1,[R0,#0]	; R1 contains read serial data

		; Get read ptr
		LUI R0,#1
		LLI R0,#0
		LDW R2,[R0,#0]	; R2 contains read ptr
		
		; Get write ptr
		ADDI R3,R0,#1
		LDW R4,[R3,#0]	; R4 contain the write ptr
	
		; Put serial data at ptr address
		STW R1,[R4,#0]	; Write to buffer
		ADDIB R4,#1
		STW R4,[R3,#0]	; Inc write ptr

		POP R6
		POP R5
		POP R4
		POP R3
		POP R2
		POP R1
		POP R0
		RETI
		
.main	LUI R0, #1		; Read ptr address in R0
		LLI R0, #0	
		LDW R2,[R0,#0]	; Read ptr in R2
		LDW R3,[R0,#1]	; Write ptr in R3
		SUB R5,R2,R3		 
		BNE .main		; Jump back if the same
		LDW R3,[R2,#0] 	; Load data out of buffer
		PUSH R3
		BWL .fact
		POP R3
		LUI R4,#8	
		LLI R4,#1		; Address of LEDs
		STW R3,[R4,#0]	; Put read data on LEDs
		ADDIB R2,#1		; Inc read ptr
		STW R2,[R0,#0]	; Store new read pointer
		BR .main       	; look again	


; Recurrisve factorial
.fact   PUSH R0
		PUSH R1
		PUSH LR
		LDW R1,[SP,#3]  ; Get para
		ADDIB R1,#0
		BNE .retOne             ; 0! = 1
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
		BNE .end                                                                                                       
.loop   ADD R4,R4,R2                                                                                                            
		SUBIB R3,#1                                                                                                     
	 	BE .loop                                                                                                        
.end    STW R4,[SP,#3]                                                                                                          
	 	POP R4
		POP R3
		POP R2
		RET

