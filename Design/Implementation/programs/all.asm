; This is conatins every instruction but does nothing

		ADD R0,R0,R0
		ADDI R0,R0,#0
		ADDIB R0,#0
		ADC R0,R0,R0
		NEG R0,R0
		SUB R0,R0,R0
		SUBI R0,R0,#0
		SUBIB R0,#0
		SUC R0,R0,R0
		SUCI R0,R0,#0
		CMP R0,R0
		CMPI R0,#0
		AND R0,R0,R0
		OR R0,R0,R0
		XOR R0,R0,R0
		NOT R0,R0
		NAND R0,R0,R0
		NOR R0,R0,R0
		LSL R0,R0,#0
		LSR R0,R0,#0
		ASR R0,R0,#0
		LDW R0,[R0,#0]
		STW R0,[R0,#0]
		LUI R0,#0
		LLI R0,#0
		BR .one
.one	BNE .two
.two	BE .three
.three  BLT .four
.four   BGE .five
.five   BWL .six
.six	RET
		JMP R0,#0
		PUSH R0
		PUSH LR
		POP R0
		POP LR
