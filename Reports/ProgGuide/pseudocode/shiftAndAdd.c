uint16_t multi(uint16_t mul, quo){
	uint16_t A,M,Q,i;
	if((mul && 0xFF00)||(quo && 0xFF00)){
		return 0;
	}
	A = 0; M = mul; Q = quo;
	for(i=0;i<8;i++){
		if(M && 0x0001){ 
			A = A + Q;
		}
		Q = Q << 1; 
		M = M >> 1;
	}
	return A;
}
