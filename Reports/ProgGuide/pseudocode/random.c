uint16_t rand(uint16_t last){
	uint16_t next,test;
	next = last >> 1;				// The shift
	test = last << 2;				// Compare different bits
	test = test ^ last;				
	if(test & 0x0008){				// Feedback to top
		return (next | 0x8000);
	}	
	return next;	
}
