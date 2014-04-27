uint16_t multi(uint16_t op1, op2){
	uint16_t A,M,Q;	
	A = 0; 
	if(op1 < op2){				// Make M small, less loops
		M = op1; Q = op2;	
	}else{
		M = op2; Q = op1;
	}
	while(1){					// No loop counter
		if(M & 0x0001){ 		// LSb
			A = A + Q;
			if(A > 0xFFFF){		// Using carry flag
				return 0;		// Overflow - fail
			}
		}
		M = M >> 1;
		if(0 == M){
			return A;			// Finished - pass
		}
		if(Q & 0x8000){
			return 0;			// Q >= 2^16 - fail
		}
		Q = Q << 1; 
	}
}
