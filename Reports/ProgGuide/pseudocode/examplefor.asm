.define i 		R0			; for ( i = 0; i <= 10; i ++)
.define a 		R1			; a = a + i;
.define temp 	R2
		LUI 	i,#0		; initialise i to 0
.loop 	ADDI 	temp,i,#1 	; need to add one to i 
		CMPI 	temp,#11 	; check condition
		BGE 	.end 		; if not(temp >= 11) -> i < 10
		ADD 	a,a,i 		; do the operation of a += i 
		ADDIB 	i,#1 		; increment i
		BR		.loop 		; return to the top of the loop
.end 	... 

