uint16_t multi(uint16_t op1, op2){
	uint16_t A,M,Q;	
	A = 0; 
	while(1){					// No loop counter
		if(M & 0x0001)		// LSb
			A = A + Q;
		M = M >> 1;
		if(0 == M)
			return A;			// Finished - pass
		Q = Q << 1; 
	}
}
