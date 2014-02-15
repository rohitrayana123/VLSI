	MOVW Memory[#51], r1		:()get 1st no.
	MOVW Memory[#52], r2		:()get 2nd no.
	CLRW r3				:clear r3 (n)
	CLRW r4				:clear r4 (t)
.loop	AOBLEQ #8, r3, .next		:n++, ?(n<10)
	JMP .end
.next	SUBB3 #1, r4, r0		:r0 = r4 - 1
	BEQL .calc2			:Branch if Z=1
.calcr1	ADDW2 r2, r1			:r1 = r1 + r2
	ADDW2 #1, r4			:r4++
	MOVW r1, Memory[#52 + r3]	:()Store r1
	JMP .loop
.calcr2	ADDW2 r1, r2			:r2 = r1 + r2
	SUBW2 #1, r4			:r4--
	MOVW r2, Memory[#52 + r3]	:()Store r2
	JMP .loop
.end