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
		ADD R7,R0,R0	; R0
		ADD R6,R0,R0			
		ADD R5,R0,R0
		ADD R4,R0,R0
		ADD R3,R0,R0
		ADD R2,R0,R0
		ADD R1,R0,R0
		ADD R0,R0,R0	; 0x0002 in all regsisters
		ADD R7,R1,R1 	; R1
		ADD R6,R1,R1			
		ADD R5,R1,R1
		ADD R4,R1,R1
		ADD R3,R1,R1
		ADD R2,R1,R1
		ADD R0,R1,R1
		ADD R1,R1,R1	; 0x0004 in all regsisters
		ADD R7,R2,R2	; R2 
		ADD R6,R2,R2			
		ADD R5,R2,R2
		ADD R4,R2,R2
		ADD R3,R2,R2
		ADD R3,R2,R2
		ADD R0,R2,R2
		ADD R2,R2,R2	; 0x0008 in all regsisters
		ADD R7,R3,R3	; R3 
		ADD R6,R3,R3			
		ADD R5,R3,R3
		ADD R4,R3,R3
		ADD R2,R3,R3
		ADD R1,R3,R3
		ADD R0,R3,R3
		ADD R3,R3,R3	; 0x0010 in all regsisters
		ADD R7,R4,R4	; R4 
		ADD R6,R4,R4			
		ADD R5,R4,R4
		ADD R3,R4,R4
		ADD R2,R4,R4
		ADD R1,R4,R4
		ADD R0,R4,R4
		ADD R4,R4,R4	; 0x0020 in all regsisters
		ADD R7,R5,R5	; R5 
		ADD R6,R5,R5			
		ADD R4,R5,R5
		ADD R3,R5,R5	
		ADD R2,R5,R5
		ADD R1,R5,R5
		ADD R0,R5,R5
		ADD R5,R5,R5	; 0x0040 in all regsisters
		ADD R7,R6,R6 	; R6
		ADD R5,R6,R6			
		ADD R4,R6,R6
		ADD R3,R6,R6
		ADD R2,R6,R6
		ADD R1,R6,R6
		ADD R0,R6,R6
		ADD R6,R6,R6	; 0x0080 in all regsisters
		ADD R6,R7,R7	; R7 
		ADD R5,R7,R7			
		ADD R4,R7,R7
		ADD R3,R7,R7
		ADD R2,R7,R7
		ADD R1,R7,R7
		ADD R0,R7,R7
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
.Fadd	LUI R0,#0
		LLI R0,#19
		JMP R0,#0
.addi	SUB R0,R0,R0
		ADDI R7,R0,#8	; R0
		ADDI R6,R0,#8
		ADDI R5,R0,#8
		ADDI R4,R0,#8
		ADDI R3,R0,#8
		ADDI R2,R0,#8
		ADDI R1,R0,#8
		ADDI R0,R0,#8
		ADDI R7,R1,#8	; R1
		ADDI R6,R1,#8
		ADDI R5,R1,#8
		ADDI R4,R1,#8
		ADDI R3,R1,#8
		ADDI R2,R1,#8
		ADDI R0,R1,#8
		ADDI R1,R1,#8
		ADDI R7,R2,#8	; R2
		ADDI R6,R2,#8
		ADDI R5,R2,#8
		ADDI R4,R2,#8
		ADDI R3,R2,#8
		ADDI R1,R2,#8
		ADDI R0,R2,#8
		ADDI R2,R2,#8
		ADDI R7,R3,#8	; R3
		ADDI R6,R3,#8
		ADDI R5,R3,#8
		ADDI R4,R3,#8
		ADDI R2,R3,#8
		ADDI R1,R3,#8
		ADDI R0,R3,#8
		ADDI R3,R3,#8
		ADDI R7,R4,#8	; R4
		ADDI R6,R4,#8
		ADDI R5,R4,#8
		ADDI R3,R4,#8
		ADDI R2,R4,#8
		ADDI R1,R4,#8
		ADDI R0,R4,#8
		ADDI R4,R4,#8
		ADDI R7,R5,#8	; R5
		ADDI R6,R5,#8
		ADDI R4,R5,#8
		ADDI R3,R5,#8
		ADDI R2,R5,#8
		ADDI R1,R5,#8
		ADDI R0,R5,#8	; R6
		ADDI R5,R5,#8
		ADDI R7,R6,#8
		ADDI R5,R6,#8
		ADDI R4,R6,#8
		ADDI R3,R6,#8
		ADDI R2,R6,#8
		ADDI R1,R6,#8
		ADDI R0,R6,#8
		ADDI R6,R6,#8
		ADDI R6,R7,#8	; R7
		ADDI R5,R7,#8
		ADDI R4,R7,#8
		ADDI R3,R7,#8
		ADDI R2,R7,#8
		ADDI R1,R7,#8
		ADDI R0,R7,#8
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
		ADDIB R0,#1		; C = 1
		ADC R1,R1,R1	; R1 = R1 + R1 + C
		CMPI R1,#3
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R2,#0
		LLI R2,#1		
		ADDIB R0,#1		; C = 1
		ADC R2,R2,R2	; R2 = R2 + R2 + C
		CMPI R2,#3
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R3,#0
		LLI R3,#1		
		ADDIB R0,#1		; C = 1
		ADC R3,R3,R3	; R3 = R3 + R3 + C
		CMPI R3,#3	
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R4,#0
		LLI R4,#1		
		ADDIB R0,#1		; C = 1
		ADC R4,R4,R4	; R4 = R4 + R4 + C
		CMPI R4,#3
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R5,#0
		LLI R5,#1		
		ADDIB R0,#1		; C = 1
		ADC R5,R5,R5	; R5 = R5 + R5 + C
		CMPI R5,#3
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R5,#0
		LLI R5,#1		
		ADDIB R0,#1		; C = 1
		ADC R5,R5,R5	; R5 = R5 + R5 + C
		CMPI R5,#3
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R6,#0
		LLI R6,#1		
		ADDIB R0,#1		; C = 1
		ADC R6,R6,R6	; R6 = R6 + R6 + C
		CMPI R6,#3
		BNE .Fadc
		LUI R0,#255
		LLI R0,#255
		LUI R7,#0
		LLI R7,#1		
		ADDIB R0,#1		; C = 1
		ADC R7,R7,R7	; R7 = R7 + R7 + C
		CMPI R7,#3
		BNE .Fadc
		LUI R1,#255
		LLI R1,#255
		LUI R0,#0
		LLI R0,#1		
		ADDIB R1,#1		; C = 1
		ADC R0,R0,R0	; R3 = R3 + R3 + C
		CMPI R0,#3
		BE .adci
.Fadc	SUB R0,R0,R0
		JMP R0,#3
.adci	SUB R0,R0,R0
		LUI R1,#255
		LLI R1,#255		
		ADDIB R1,#1		; C = 1
		ADCI R0,R0,#1	; R0 = R0 + 1 + C
		CMPI R0,#2
		BNE .Fadci
		SUB R1,R1,R1
		LUI R2,#255
		LLI R2,#255		
		ADDIB R2,#1		; C = 1
		ADCI R1,R1,#1	; R0 = R0 + 1 + C
		CMPI R1,#2
		BNE .Fadci
		SUB R2,R2,R2
		LUI R3,#255
		LLI R3,#255		
		ADDIB R3,#1		; C = 1
		ADCI R2,R2,#1	; R0 = R0 + 1 + C
		CMPI R2,#2
		BNE .Fadci
		SUB R3,R3,R3
		LUI R4,#255
		LLI R4,#255		
		ADDIB R4,#1		; C = 1
		ADCI R3,R3,#1	; R0 = R0 + 1 + C
		CMPI R3,#2
		BNE .Fadci
		SUB R4,R4,R4
		LUI R5,#255
		LLI R5,#255		
		ADDIB R5,#1		; C = 1
		ADCI R4,R4,#1	; R0 = R0 + 1 + C
		CMPI R4,#2
		BNE .Fadci
		SUB R5,R5,R5
		LUI R6,#255
		LLI R6,#255		
		ADDIB R6,#1		; C = 1
		ADCI R5,R5,#1	; R0 = R0 + 1 + C
		CMPI R5,#2
		BNE .Fadci
		SUB R6,R6,R6
		LUI R7,#255
		LLI R7,#255		
		ADDIB R7,#1		; C = 1
		ADCI R6,R6,#1	; R0 = R0 + 1 + C
		CMPI R6,#2
		BNE .Fadci
		SUB R7,R7,R7
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		ADCI R7,R7,#1	; R0 = R0 + 1 + C
		CMPI R7,#2
		BE .neg
.Fadci	SUB R0,R0,R0
		JMP R0,#3
.neg	LUI R0,#0
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
		LUI R0,#255
		LLI R0,#86
		CMP R0,R1		; Make sure all regs contain 0xFF56
		BNE .Fneg
		BR .sub
		LUI R1,#0
		LLI R1,#170
		NEG R7,R1
		NEG R6,R1
		NEG R5,R1
		NEG R4,R1
		NEG R3,R1
		NEG R2,R1
		NEG R0,R1
		NEG R1,R1
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
		LUI R0,#255
		LLI R0,#86
		CMP R0,R1		; Make sure all regs contain 0xFF56
		BNE .Fneg
		LUI R2,#0
		LLI R2,#170
		NEG R7,R2
		NEG R6,R2
		NEG R5,R2
		NEG R4,R2
		NEG R3,R2
		NEG R0,R2
		NEG R1,R2
		NEG R2,R2
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
		LUI R0,#255
		LLI R0,#86
		CMP R0,R1		; Make sure all regs contain 0xFF56
		BNE .Fneg
.Fneg	SUB R0,R0,R0
		JMP R0,#3
.sub	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		ADDI R2,R0,#0
		ADDI R3,R0,#0
		ADDI R4,R0,#0
		ADDI R5,R0,#0
		ADDI R6,R0,#0
		ADDI R7,R0,#0
		SUB R1,R7,R0
		SUB R2,R7,R0
		SUB R3,R7,R0
		SUB R4,R7,R0
		SUB R5,R7,R0
		SUB R6,R7,R0
		SUB R7,R7,R0
		SUB R0,R0,R0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fsub
		CMP R1,R2
		BNE .Fsub		
		CMP R2,R3
		BNE .Fsub
		CMP R2,R3
		BNE .Fsub
		CMP R4,R5
		BNE .Fsub
		CMP R5,R6
		BNE .Fsub
		CMP R6,R7
		BNE .Fsub
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsub
		BR .subi
.Fsub	SUB R0,R0,R0
		JMP R0,#3
.subi	SUB R0,R0,R0
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fsubi
		CMP R1,R2
		BNE .Fsubi		
		CMP R2,R3
		BNE .Fsubi
		CMP R2,R3
		BNE .Fsubi
		CMP R4,R5
		BNE .Fsubi
		CMP R5,R6
		BNE .Fsubi
		CMP R6,R7
		BNE .Fsubi
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsubi
		BR .subib
.Fsubi	SUB R0,R0,R0
		JMP R0,#3
.subib	LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fsubib
		CMP R1,R2
		BNE .Fsubib		
		CMP R2,R3
		BNE .Fsubib
		CMP R2,R3
		BNE .Fsubib
		CMP R4,R5
		BNE .Fsubib
		CMP R5,R6
		BNE .Fsubib
		CMP R6,R7
		BNE .Fsubib
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsubib
		BR .suc
.Fsubib	SUB R0,R0,R0
		JMP R0,#3
.suc	LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fsuc
		CMP R1,R2
		BNE .Fsuc		
		CMP R2,R3
		BNE .Fsuc
		CMP R2,R3
		BNE .Fsuc
		CMP R4,R5
		BNE .Fsuc
		CMP R5,R6
		BNE .Fsuc
		CMP R6,R7
		BNE .Fsuc
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsuc
		BR .suci
.Fsuc	SUB R0,R0,R0
		JMP R0,#3
.suci	LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fsuci
		CMP R1,R2
		BNE .Fsuci		
		CMP R2,R3
		BNE .Fsuci
		CMP R2,R3
		BNE .Fsuci
		CMP R4,R5
		BNE .Fsuci
		CMP R5,R6
		BNE .Fsuci
		CMP R6,R7
		BNE .Fsuci
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsuci
		BR .cmp
.Fsuci	SUB R0,R0,R0
		JMP R0,#3
.cmp	LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fcmp
		CMP R1,R2
		BNE .Fcmp		
		CMP R2,R3
		BNE .Fcmp
		CMP R2,R3
		BNE .Fcmp
		CMP R4,R5
		BNE .Fcmp
		CMP R5,R6
		BNE .Fcmp
		CMP R6,R7
		BNE .Fcmp
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fcmp
		BR .cmpi
.Fcmp	SUB R0,R0,R0
		JMP R0,#3
.cmpi	LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fcmpi
		CMP R1,R2
		BNE .Fcmpi		
		CMP R2,R3
		BNE .Fcmpi
		CMP R2,R3
		BNE .Fcmpi
		CMP R4,R5
		BNE .Fcmpi
		CMP R5,R6
		BNE .Fcmpi
		CMP R6,R7
		BNE .Fcmpi
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fcmpi
		BR .and
.Fcmpi	SUB R0,R0,R0
		JMP R0,#3
.and	LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fand
		CMP R1,R2
		BNE .Fand		
		CMP R2,R3
		BNE .Fand
		CMP R2,R3
		BNE .Fand
		CMP R4,R5
		BNE .Fand
		CMP R5,R6
		BNE .Fand
		CMP R6,R7
		BNE .Fand
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fand
		BR .or
.Fand	SUB R0,R0,R0
		JMP R0,#3
.or		LUI R0,#255
		LLI R0,#255
		SUBI R1,R0,#0
		SUBI R2,R0,#0
		SUBI R3,R0,#0
		SUBI R4,R0,#0
		SUBI R5,R0,#0
		SUBI R6,R0,#0
		SUBI R7,R0,#0
		SUBIB R0,#127
		SUBIB R1,#127
		SUBIB R2,#127
		SUBIB R3,#127
		SUBIB R4,#127
		SUBIB R5,#127
		SUBIB R6,#127
		SUBIB R7,#127
		CMP R0,R1		; Make sure all regs are the same
		BNE .For
		CMP R1,R2
		BNE .For		
		CMP R2,R3
		BNE .For
		CMP R2,R3
		BNE .For
		CMP R4,R5
		BNE .For
		CMP R5,R6
		BNE .For
		CMP R6,R7
		BNE .For
		LUI R0,#0
		LLI R0,#0
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .For
		BR .xor
.For	SUB R0,R0,R0
		JMP R0,#3
.xor	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fxor
		BR .cmpi
.Fxor	SUB R0,R0,R0
		JMP R0,#3
.not	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fnot
		BR .nand
.Fnot	SUB R0,R0,R0
		JMP R0,#3
.nand	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fnand
		BR .nor
.Fnand	SUB R0,R0,R0
		JMP R0,#3
.nor	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fnor
		BR .lsl
.Fnor	SUB R0,R0,R0
		JMP R0,#3
.lsl	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Flsl
		BR .lsr
.Flsl	SUB R0,R0,R0
		JMP R0,#3
.lsr	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Flsr
		BR .asr
.Flsr	SUB R0,R0,R0
		JMP R0,#3
.asr	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fasr
		BR .pass
.Fasr	SUB R0,R0,R0
		JMP R0,#3
.ldw	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fldw
		BR .stw
.Fldw	SUB R0,R0,R0
		JMP R0,#3
.stw	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fstw
		BR .lui
.Fstw	SUB R0,R0,R0
		JMP R0,#3
.lui	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Flui
		BR .lli
.Flui	SUB R0,R0,R0
		JMP R0,#3
.lli	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Flli
		BR .br
.Flli	SUB R0,R0,R0
		JMP R0,#3
.br		LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fbr
		BR .bne
.Fbr	SUB R0,R0,R0
		JMP R0,#3
.bne	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fbne
		BR .be
.Fbne	SUB R0,R0,R0
		JMP R0,#3
.be		LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BNE .Fbe
		BR .pass
.Fbe	SUB R0,R0,R0
		JMP R0,#3
.pass	SUB R0,R0,R0
		JMP R0,#1

