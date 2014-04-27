uint16_t fact(uint16_t x){
	if(x == 0){
		return 1;				// 0! = 1
	}
	return multi(x,fact(x-1));	// Recurrsive	
}
