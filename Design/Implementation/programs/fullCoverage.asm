		BR .add			
		LUI R0, #255	; PASS - LINE 1 - 0xFFFF is pass code
		BR .leds
		LUI R0, #0		; FAIL - LINE 3 -  0x00FF is fail code
.leds	LLI R0, #255
		LUI R1, #8		; Address of leds
		LLI R1, #1
		STW R0,[R1,#0]	; Status on LEDS
.end	BR .end			; Terminate loop	
.add	LUI R0,	#0		
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
		BNE .Fadd
		CMP R1,R2
		BNE .Fadd		
		CMP R2,R3
		BNE .Fadd
		CMP R2,R3
		BNE .Fadd
		CMP R4,R5
		BNE .Fadd
		CMP R5,R6
		BNE .Fadd
		CMP R6,R7
		BNE .Fadd
		LUI R0,#1
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0100
		BNE .Fadd
		BR .addi
.Fadd	SUB R0,R0,R0
		JMP R0,#3
.addi	SUB R0,R0,R0
		ADDI R0,R0,#8	; R0
		ADDI R1,R0,#8
		ADDI R2,R0,#8
		ADDI R3,R0,#8
		ADDI R4,R0,#8
		ADDI R5,R0,#8
		ADDI R6,R0,#8
		ADDI R7,R0,#8
		ADDI R0,R1,#8	; R1
		ADDI R1,R1,#8
		ADDI R2,R1,#8
		ADDI R3,R1,#8
		ADDI R4,R1,#8
		ADDI R5,R1,#8
		ADDI R6,R1,#8
		ADDI R7,R1,#8
		ADDI R0,R2,#8	; R2
		ADDI R1,R2,#8
		ADDI R2,R2,#8
		ADDI R3,R2,#8
		ADDI R4,R2,#8
		ADDI R5,R2,#8
		ADDI R6,R2,#8
		ADDI R7,R2,#8
		ADDI R0,R3,#8	; R3
		ADDI R1,R3,#8
		ADDI R2,R3,#8
		ADDI R3,R3,#8
		ADDI R4,R3,#8
		ADDI R5,R3,#8
		ADDI R6,R3,#8
		ADDI R7,R3,#8
		ADDI R0,R4,#8	; R4
		ADDI R1,R4,#8
		ADDI R2,R4,#8
		ADDI R3,R4,#8
		ADDI R4,R4,#8
		ADDI R5,R4,#8
		ADDI R6,R4,#8
		ADDI R7,R4,#8
		ADDI R0,R5,#8	; R5
		ADDI R1,R5,#8
		ADDI R2,R5,#8
		ADDI R3,R5,#8
		ADDI R4,R5,#8
		ADDI R5,R5,#8
		ADDI R6,R5,#8	; R6
		ADDI R7,R5,#8
		ADDI R0,R6,#8
		ADDI R1,R6,#8
		ADDI R2,R6,#8
		ADDI R3,R6,#8
		ADDI R4,R6,#8
		ADDI R5,R6,#8
		ADDI R6,R6,#8
		ADDI R7,R6,#8
		ADDI R0,R7,#8	; R7
		ADDI R1,R7,#8
		ADDI R2,R7,#8
		ADDI R3,R7,#8
		ADDI R4,R7,#8
		ADDI R5,R7,#8
		ADDI R6,R7,#8
		ADDI R7,R7,#8
		CMP R0,R1		; Make sure all regs are the same
		BNE .Faddi
		CMP R1,R2
		BNE .Faddi		
		CMP R2,R3
		BNE .Faddi
		CMP R2,R3
		BNE .Faddi
		CMP R4,R5
		BNE .Faddi
		CMP R5,R6
		BNE .Faddi
		CMP R6,R7
		BNE .Faddi
		LUI R0,#0
		LLI R0,#64
		CMP R0,R1		; Make sure all regs contain 0x0040
		BNE .Faddi
		BR .addib
.Faddi 	SUB R0,R0,R0
		JMP R0,#3
.addib	SUB R0,R0,R0
		ADDIB R0,#127
		SUB R1,R1,R1
		ADDIB R1,#127
		SUB R2,R2,R2
		ADDIB R2,#127
		SUB R3,R3,R3
		ADDIB R3,#127
		SUB R4,R4,R4
		ADDIB R4,#127
		SUB R5,R5,R5
		ADDIB R5,#127
		SUB R6,R6,R6
		ADDIB R6,#127
		SUB R7,R7,R7
		ADDIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Faddib
		CMP R1,R2
		BNE .Faddib		
		CMP R2,R3
		BNE .Faddib
		CMP R2,R3
		BNE .Faddib
		CMP R4,R5
		BNE .Faddib
		CMP R5,R6
		BNE .Faddib
		CMP R6,R7
		BNE .Faddib
		LUI R0,#0
		LLI R0,#127
		CMP R0,R1		; Make sure all regs contain 0x00EF
		BNE .Faddib
		BR .adc
.Faddib SUB R0,R0,R0
		JMP R0,#3
.adc	LUI R0,#255
		LLI R0,#255
		LUI R1,#0
		LLI R1,#1
		ADDIB R0,#1
		ADC R1,R1,R1
		BR .neg
.Fadc	SUB R0,R0,R0
		JMP R0,#3
.neg	LUI R0,#170
		LLI R0,#170
		NEG R7,R0
		NEG R6,R0
		NEG R5,R0
		NEG R4,R0
		NEG R3,R0
		NEG R2,R0
		NEG R1,R0
		NEG R0,R0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fneg
		CMP R1,R2
		BNE .Fneg		
		CMP R2,R3
		BNE .Fneg
		CMP R2,R3
		BNE .Fneg
		CMP R4,R5
		BNE .Fneg
		CMP R5,R6
		BNE .Fneg
		CMP R6,R7
		BNE .Fneg
		LUI R0,#0
		LLI R0,#127
		CMP R0,R1		; Make sure all regs contain 0x00EF
		BNE .Fneg
		BR .sub
.Fneg	SUB R0,R0,R0
		JMP R0,#3
.sub	LUI R0,#255
		LLI R1,#255
		BR .pass
.Fsub	SUB R0,R0,R0
		JMP R0,#3
.pass	SUB R0,R0,R0
		JMP R0,#1
