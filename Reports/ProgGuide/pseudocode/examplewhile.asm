.define i 		R0			; while( i < 15) i = i + i;
		...
.loop	CMPI	i,#15
		BGE		.end 
		ADD 	i,i,i 		; Do op i = i*2
		BR		.loop 		; return to the top of the loop
.end 	...					; i = 1 ? 1..2..4..8..16 > out 

