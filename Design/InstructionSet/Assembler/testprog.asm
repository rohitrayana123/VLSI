		LLI R5, #51	:Define Source
		LDW R1, [R5, 0]	:R1 = 1st no.
		LDW R2, [R5, 1]	:R2 = 2nd no.
		LLI R3, #9	:n = 9
		LLI R4, #0	:t = 0
.loop		SUBI R7, R3, #0	:n - 0
		BGE .calcnext 	:n>=0?
		BR .end
.calcnext 	SUBI R7, R4, #1	:t - 1
		BGE .calcr2	:t>=1?
.calcr1		ADD R1, R1, R2	:R1 = R1 + R2
		LLI R4, #1	:t = 1
		SUB R6, R3, #10	:R6 = n - 10
		NEG R6		:R6 = (10 - n)
		SDW R1, [R6, 1]	:Store R1
		BR .loop
.calcr2		ADD R2, R1, R2	:R2 = R1 + R2
		LLI R4, #0	:t = 0
		SDW R2, [R6, 2]	:Store R2
		BR .loop
.end
