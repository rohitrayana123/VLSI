.define a 		R0		;if `a' == 1 then b = 1 else b = 0
.define b 		R1
		CMPI 	a,#1 	; store flags for operation (a - 1)
		BNE 	.else 	; branch is a != 1
		LUI 	b,#0 	; else fall through
		LLI 	b,#1 	; load b with 1
		BR 		.end
.else 	LUI	 	b,#0 	; LUI sets lower byte to 0
.end 	...
