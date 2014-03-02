SUB R0,R0,R0	// Init regs
SUB R1,R1,R1
SUB R2,R2,R2
SUB R3,R3,R3
SUB R4,R4,R4
SUB R5,R5,R5
SUB R6,R6,R6
SUB R7,R7,R7	// Setup SP
LUI R7, 7
LLI R7, 255		// Put stuff here...
LUI R0, 255		// Write to stop mem pos
LLI R0, 255
LUI R1, 4 
LLI R1, 0	
STW R0, [R1,0]	






