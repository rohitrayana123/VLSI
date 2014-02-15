	ADDL r31, #51, r5	:Start at memory 51
	LDL r1, 0(r5)		:r1 = first value
	LDL r2, 1(r5)		:r2 = second value
	ADDL r31, #10, r3	:r3 = 10 (n)
	ADDL r31, r31, r4	:r4 = 0 (t)
.loop	BGT r3, .next		:test r3 > 0
	BR r31, .end
.next	BGT r4, .calcr2		:text r4 > 0
.calcr1	ADDL r1, r2, r1		:r1 = r1 + r2
	ADDL r4, #1, r4		:r4 = 1
	SUBL r3, #10, r6	:r6 = n - 10
	SUBL r31, r6, r6	:r6 = 10 - n
	STL r1, 1(r6)		:Store r1
	BR r31, .loop
.calcr2	ADDL r1, r2, r2		:r2 = r1 + r2
	ADDL r31, r31, r4	:r4 = 0
	STL r2, 2(r6)		:Store r2
	BR r31, .loop
.end