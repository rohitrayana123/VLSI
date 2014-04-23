uint16_t rand(uint16_t last){
	uint16_t next,test;
	next = last >> 1;						// Shift reg
	test = last & 0x000A;					// Bits 4 and 1
	if((test == 0x0000)|(test == 0x000A)){	// XOR test
		return next;					
	}
	return next | 0x8000;					// Feedback to top
}
