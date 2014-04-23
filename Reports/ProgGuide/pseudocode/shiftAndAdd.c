uint16_t multi(uint16_t mul, quo){
	uint32_t A;
	uint16_t M,Q,i;	
	A = 0; M = mul; Q = quo;
	for(i=0;i<16;i++){
		if(M && 0x0001){ 		// LSb
			A = A + Q;
			if(A > 0xFFFF){		// Larger than 16 bits?
				return 0;		// Fail
			}
		}
		Q = Q << 1; 
		M = M >> 1;
	}
	return A;					// Bottom 16 bits
}
