SUB R0,R0,R0	// Init regs
SUB R1,R1,R1
SUB R2,R2,R2
SUB R3,R3,R3
SUB R4,R4,R4
SUB R5,R5,R5
SUB R6,R6,R6
SUB R7,R7,R7
LDW R0,[R7, 0]
LDW R1,[R7, 1]
LDW R2,[R7, 2]
LDW R3,[R7, 3]
LDW R4,[R7, 4]
LDW R5,[R7, 5]
LDW R6,[R7, 6]
LDW R7,[R7, 7]
LUI R0, 255	
LLI R0, 255
LUI R1, 4 
LLI R1, 0	
STW R0, [R1,0]	






