.define		YOU, R5
		LLI R5, #51	:Define Source
		LDW R1, [YOU, 0]:R1 = 1st no.
		LDW R2, [YOU, 1]:R2 = 2nd no.
.define		n, R3
.define		t, R4
		LLI n, #9	:n = 9
.define		a, R5
.ISR		ADDI a, a, #1	:Test ISR
		ADDI a, a, #2
		ADDI a, a, #3
		ADDI a, a, #4
		RETI
		LLI t, #0	:t = 0
.loop		SUBI R7, n, #0	:n - 0
		BGE .calcnext 	:n>=0?
		BR .end
.calcnext 	SUBI R7, t, #1	:t - 1
		BGE .calcr2	:t>=1?
.calcr1		ADD R1, R1, R2	:R1 = R1 + R2
		LLI t, #1	:t = 1
		SUBI R6, n, #10:R6 = n - 10
		NEG R6, n	:R6 = (10 - n)
		STW R1, [R6, 1]	:Store R1
		BR .loop
.calcr2		ADD R2, R1, R2	:R2 = R1 + R2
		LLI t, #0	:t = 0
		STW R2, [R6, 2]	:Store R2
		BR .loop
.end		BR .longtarget	:Remain in tight loop
		ADDI R6, R6, #1	:Filling Code that does nothing useful
.goingup	BR .goingup
.start		ADDI R6, R6, #1
		ADDI R6, R6, #2
		ADDI R6, R6, #3
		ADDI R6, R6, #4
		ADDX R6, R6, #5
		ADDI R6, R6, #6
		ADDI R6, R6, #7
		ADDI R6, R6, #8
		ADDI R6, R6, #9
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		BR .middletest
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #12
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #7
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #2
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #12
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #3
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #4
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #5
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #6
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #7
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #8
		ADDI R6, R6, #9
.middletest	SUBI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #9
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
		ADDI R6, R6, #1
.longtarget	BR .goingup
