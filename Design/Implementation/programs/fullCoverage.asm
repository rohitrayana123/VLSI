		LUI R0,	#0		; *** ADD TEST **
		LLI R0,	#1
		ADD R0,R0,R0	; R0
		ADD R1,R0,R0			
		ADD R2,R0,R0
		ADD R3,R0,R0
		ADD R4,R0,R0
		ADD R5,R0,R0
		ADD R6,R0,R0
		ADD R7,R0,R0	; 0x0002 in all regsisters
		ADD R0,R1,R1 	; R1
		ADD R1,R1,R1			
		ADD R2,R1,R1
		ADD R3,R1,R1
		ADD R4,R1,R1
		ADD R5,R1,R1
		ADD R6,R1,R1
		ADD R7,R1,R1	; 0x0004 in all regsisters
		ADD R0,R2,R2	; R2 
		ADD R1,R2,R2			
		ADD R2,R2,R2
		ADD R3,R2,R2
		ADD R4,R2,R2
		ADD R5,R2,R2
		ADD R6,R2,R2
		ADD R7,R2,R2	; 0x0008 in all regsisters
		ADD R0,R3,R3	; R3 
		ADD R1,R3,R3			
		ADD R2,R3,R3
		ADD R3,R3,R3
		ADD R4,R3,R3
		ADD R5,R3,R3
		ADD R6,R3,R3
		ADD R7,R3,R3	; 0x0010 in all regsisters
		ADD R0,R4,R4	; R4 
		ADD R1,R4,R4			
		ADD R2,R4,R4
		ADD R3,R4,R4
		ADD R4,R4,R4
		ADD R5,R4,R4
		ADD R6,R4,R4
		ADD R7,R4,R4	; 0x0020 in all regsisters
		ADD R0,R5,R5	; R5 
		ADD R1,R5,R5			
		ADD R2,R5,R5
		ADD R3,R5,R5
		ADD R4,R5,R5
		ADD R5,R5,R5
		ADD R6,R5,R5
		ADD R7,R5,R5	; 0x0040 in all regsisters
		ADD R0,R6,R6 	; R6
		ADD R1,R6,R6			
		ADD R2,R6,R6
		ADD R3,R6,R6
		ADD R4,R6,R6
		ADD R5,R6,R6
		ADD R6,R6,R6
		ADD R7,R6,R6	; 0x0080 in all regsisters
		ADD R0,R7,R7	; R7 
		ADD R1,R7,R7			
		ADD R2,R7,R7
		ADD R3,R7,R7
		ADD R4,R7,R7
		ADD R5,R7,R7
		ADD R6,R7,R7
		ADD R7,R7,R7	; 0x0100 in all regsisters	
		CMP R0,R1		; Make sure all regs are the same
		BNE .fail
		CMP R1,R2
		BNE .fail		
		CMP R2,R3
		BNE .fail
		CMP R2,R3
		BNE .fail
		CMP R4,R5
		BNE .fail
		CMP R5,R6
		BNE .fail
		CMP R6,R7
		BNE .fail
		LUI R0,#1
		LLI R0,#0
		CMP R0,R1		; Make ure all regs contain 0x0100
		BNE .fail		
.pass	LUI R0, #255	; 0xFFFF is pass code
		BR .leds
.fail	LUI R0, #0		; 0x00FF is fail code
.leds	LLI R0, #255
		LUI R1, #8		; Address of leds
		LLI R1, #1
		STW R0,[R1,#0]	; Status on LEDS
.end	BR .end			; Terminate loop	
