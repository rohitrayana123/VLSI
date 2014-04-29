		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
		ADDIB R0,#0
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
		LLI R0,#26
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
		ADDIB R0,#26
		JMP R0,#0
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
		ADDIB R0,#26
		JMP R0,#0
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
		ADDIB R0,#26
		JMP R0,#0
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
		ADDIB R0,#26
		JMP R0,#0
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
		BE .sub
.Fneg	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
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
		ADDIB R0,#26
		JMP R0,#0
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
		ADDIB R0,#26
		JMP R0,#0
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
		LUI R0,#255
		LLI R0,#128
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsubib
		BR .suc
.Fsubib	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.suc	SUB R1,R1,R1
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R1,R1,R1	; R = R - R - C
		SUB R2,R2,R2
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R2,R2,R2	; R = R - R - C
		SUB R3,R3,R3
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R3,R3,R3	; R = R - R - C
		SUB R4,R4,R4
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R4,R4,R4	; R = R - R - C
		SUB R5,R5,R5
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R5,R5,R5	; R = R - R - C
		SUB R6,R6,R6
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R6,R6,R6	; R = R - R - C
		SUB R7,R7,R7
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUC R7,R7,R7	; R = R - R - CC	
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
		LUI R0,#255		; -1
		LLI R0,#255
		CMP R0,R1		; Make sure all regs contain 0x0000
		BNE .Fsuc
		BR .suci
.Fsuc	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.suci	SUB R1,R1,R1
		ADDIB R1,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R1,R1,#10	; R = R - R - C
		SUB R2,R2,R2
		ADDIB R2,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R2,R2,#10	; R = R - R - C
		SUB R3,R3,R3
		ADDIB R3,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R3,R3,#10	; R = R - R - C
		SUB R4,R4,R4
		ADDIB R4,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R4,R4,#10	; R = R - R - C
		SUB R5,R5,R5
		ADDIB R5,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R5,R5,#10	; R = R - R - C
		SUB R6,R6,R6
		ADDIB R6,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R6,R6,#10	; R = R - R - C
		SUB R7,R7,R7
		ADDIB R7,#10
		LUI R0,#255
		LLI R0,#255		
		ADDIB R0,#1		; C = 1
		SUCI R7,R7,#10	; R = R - R - C
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
		LUI R0,#255
		LLI R0,#255
		CMP R0,R1		; Make sure all regs contain 0x0000
		BE .and
.Fsuci	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.and	LUI R0,#170
		LLI R0,#170
		LUI R1,#85
		LLI R1,#85
		AND R2,R1,R0
		CMPI R2,#0		; Make sure all regs are the same
		BE .or
.Fand	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.or		LUI R0,#170
		LLI R0,#170
		LUI R1,#85
		LLI R1,#85
		LUI R2,#255
		LLI R2,#255
		OR R3,R1,R0
		CMP R2,R3
		BE .xor
.For	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.xor	LUI R0,#170
		LLI R0,#170
		LUI R1,#85
		LLI R1,#85
		LUI R3,#255
		LLI R3,#255
		XOR R2,R0,R1
		CMP R2,R3		; Make sure all regs are the same
		BE .not
.Fxor	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.not	LUI R0,#255
		LLI R0,#255
		NOT R0,R0
		CMPI R0,#0		; Make sure all regs are the same
		BE .nand
.Fnot	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.nand	LUI R0,#170
		LLI R0,#170
		LUI R1,#170
		LLI R1,#170
		LUI R3,#85
		LLI R3,#85
		NAND R2,R1,R0
		CMP R2,R3		; Make sure all regs are the same
		BE .nor
.Fnand	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.nor	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BE .lsl
.Fnor	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.lsl	LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#1
		LUI R1,#170
		LLI R1,#170
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#2
		LUI R1,#85
		LLI R1,#84
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#3
		LUI R1,#170
		LLI R1,#168
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#4
		LUI R1,#85
		LLI R1,#80
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#5
		LUI R1,#170
		LLI R1,#160
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#6
		LUI R1,#85
		LLI R1,#64
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#7
		LUI R1,#170
		LLI R1,#128
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#8
		LUI R1,#85
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#9
		LUI R1,#170
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#10
		LUI R1,#84
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#11
		LUI R1,#168
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#12
		LUI R1,#80
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#13
		LUI R1,#160
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#14
		LUI R1,#64
		LLI R1,#0
		CMP R0,R1
		BNE .Flsl
		LUI R0,#85
		LLI R0,#85
		LSL R0,R0,#15
		LUI R1,#128
		LLI R1,#0
		CMP R0,R1
		BE .lsr
.Flsl	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.lsr	LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#1
		LUI R1,#85
		LLI R1,#85
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#2
		LUI R1,#42
		LLI R1,#170
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#3
		LUI R1,#21
		LLI R1,#85
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#4
		LUI R1,#10
		LLI R1,#170
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#5
		LUI R1,#5
		LLI R1,#85
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#6
		LUI R1,#2
		LLI R1,#170
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#7
		LUI R1,#1
		LLI R1,#85
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#8
		LUI R1,#0
		LLI R1,#170
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#9
		LUI R1,#0
		LLI R1,#85
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#10
		LUI R1,#0
		LLI R1,#42
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#11
		LUI R1,#0
		LLI R1,#21
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#12
		LUI R1,#0
		LLI R1,#10
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#13
		LUI R1,#0
		LLI R1,#5
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#14
		LUI R1,#0
		LLI R1,#2
		CMP R0,R1
		BNE .Flsr
		LUI R0,#170
		LLI R0,#170
		LSR R0,R0,#15
		LUI R1,#0
		LLI R1,#1
		CMP R0,R1
		BE .blt
.Flsr	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.blt	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BR .bge
.Fblt	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.bge	LUI R0,#255
		LLI R0,#255
		ADDI R1,R0,#0
		CMP R0,R1		; Make sure all regs are the same
		BE .pass
.Fbge	SUB R0,R0,R0
		ADDIB R0,#26
		JMP R0,#0
.pass	SUB R0,R0,R0
		ADDIB R0,#23
		JMP R0,#0

