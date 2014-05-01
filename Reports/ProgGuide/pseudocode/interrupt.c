#define TOP		0x0206
#define BOTTOM	0x0202
#define WRITE	0x0201
#define READ	0x0200
#define SERIAL	0xA000
#define LEDS	0x0801

isr(){
	uint16_t data,readPtri,writePtr;
	data = read(SERIAL);		// Don't lose event
	asm("ENAI");				// nested ints
	readPtr = read(READ);
	writePtr = read(WRITE);
	if(((readPtr-1) == writePtr) 	||
		(readPtr 	== BOTTOM)		||
		(writePtr 	== (TOP-1))		){
		return					// full, don't write
	}
	if(readPtr == BOTTOM)	
	write(readPtr,data);		// write to buffer
	writePtr++;
	if(writePtr == TOP){
		writePtr = BOTTOM;
	}else{
		writePtr++;
	}
	write(WRITE,writePtr);
	return
}

void main(){
	uint16_t readPtr,writePtr,data;
	do{
		readPtr = read(READ);	// keep checking buffer
		writePtr = read(WRITE);
	}while(readPtr == writePtr)
	data = read(readPtr);		
	readPtr++;
	if(readPtr == TOP){
		readPtr = BOTTOM;
	}
	write(READ,readPtr);		// Write new read ptr
	write(fact(data));
}
