#define TOP		0x0206
#define BOTTOM	0x0202
#define WRITE	0x0201
#define READ	0x0200
#define SERIAL	0xA000

isr(){
	uint16_t data,readPtri,writePtr;
	asm("DISI");				// critical op
	data = read(SERIAL);	
	asm("ENAI");				// nested ints
	readPtr = read(READ);
	writePtr = read(WRITE);
	if(((readPtr-1) == writePtr) 	||
		(readPtr == BOTTOM)			||
		(writePtr == (TOP-1))		){
		asm("RETI");			// full, don't write
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
	asm("RETI")
}

void main(){
	uint16_t readPtr,writePtri,data;
	do{
		readPtr = read(READ);
		writePtr = read(WRITE);
	}while(readPtr == writePtr)
	data = read(readPtr)
		
	fact();
}
