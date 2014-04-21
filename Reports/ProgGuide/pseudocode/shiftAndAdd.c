unsigned short multi(unsigned char mul, unsigned char quo){
	unsigned char M,Q,i;
	unsigned short A;
	A = 0; M = mul; Q = quo;
	for(i=0;i<16;i++){
		if(M[0] == 1){
			A = A + Q;
		}
		Q = Q << 1;
		M = M >> 1;
	}
	return A;
}
