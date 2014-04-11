
logic [4:0] OpCode;
logic [3:0] imm4;
logic C, V, N, Z;
logic FAOut, AND, OR, XOR, NOT, NAND, NOR, SUB, ZeroA, CIn_slice, LastCIn, COut, Sum, nZ;
logic Sh1, Sh2, Sh4, Sh8, ShL, ShR, ShInBit, ShB, ShOut, ASign;
logic LLI;


initial
    OpCode = 5'b11000; //Default to NOP
    imm4 = 0; LastCIn = 0; COut = 0; Sum = 0; nZ = 0; ASign = 0; 
    
    #50 OpCode = 5'b00000; //LDW
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00001; //POP
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00011; //ADDIB
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00010; //ADD
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00110; //ADDI
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00111; //CMP
    #50 assert(FAOut == 1);
        assert(SUB == 1);
    #50 OpCode = 5'b00101; //ADCI
    #50 assert(FAOut == 1);
        //UseC
    #50 OpCode = 5'b00100; //ADC
    #50 assert(FAOut == 1);
        //UseC

    #50 OpCode = 5'b00100; //STW
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00100; //PUSH
    #50 assert(FAOut == 1);
        assert(SUB == 1);
    #50 OpCode = 5'b00100; //SUBIB
    #50 assert(FAOut == 1);
        assert(SUB == 1);
    #50 OpCode = 5'b00100; //SUB
    #50 assert(FAOut == 1);
        assert(SUB == 1);
    #50 OpCode = 5'b00100; //SUBI
    #50 assert(FAOut == 1);
        assert(SUB == 1);
    #50 OpCode = 5'b00100; //CMPI
    #50 assert(FAOut == 1);
	assert(SUB == 1);
    #50 OpCode = 5'b00100; //SUCI
	assert(SUB == 1);
	assert(SUB == 1);
	//UseC
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00100; //SUC
    #50 assert(FAOut == 1);
	assert(SUB == 1);
	//UseC

    #50 OpCode = 5'b00100; //NOP
    #50 assert(ShOut == 1);
    #50 OpCode = 5'b00100; //NEG
    #50 assert(FAOut == 1);
	assert(SUB == 1);
	assert(ZeroA == 1);
    #50 OpCode = 5'b00100; //'D'
    #50 assert(FAOut == 1);
    #50 OpCode = 5'b00100; //LSL
    #50 assert(ShOut == 1);
	assert(ShL == 1);
	assert(Sh8 == imm4[3]);
	assert(Sh4 == imm4[1]);
	assert(Sh2 == imm4[2]);
	assert(Sh1 == imm4[0]);
	assert(ShiftInBit == 0);
	//inner signal N= = 1
    #50 OpCode = 5'b00100; //LSR
    #50 assert(ShOut == 1);
	assert(ShR == 1);
	assert(Sh8 == imm4[3]);
	assert(Sh4 == imm4[1]);
	assert(Sh2 == imm4[2]);
	assert(Sh1 == imm4[0]);
	assert(ShiftInBit == 0);
	//inner signal N == 1
    #50 OpCode = 5'b00100; //ASR
    #50 assert(ShOut == 1);
	assert(ShR == 1);
	assert(Sh8 == imm4[3]);
	assert(Sh4 == imm4[1]);
	assert(Sh2 == imm4[2]);
	assert(Sh1 == imm4[0]);
	assert(ShiftInBit == ASign);
	//inner signal N == 1

    #50 OpCode = 5'b00100; //AND
    #50 assert(AND == 1);
    #50 OpCode = 5'b00100; //OR
    #50 assert(OR == 1);
    #50 OpCode = 5'b00100; //XOR
    #50 assert(XOR == 1);
    #50 OpCode = 5'b00100; //NOT
    #50 assert(NOT == 1);
    #50 OpCode = 5'b00100; //NAND
    #50 assert(NAND == 1);
    #50 OpCode = 5'b00100; //NOR
    #50 assert(NOR == 1);
    #50 OpCode = 5'b00100; //LLI
    #50 assert(ShOut == 1);
	assert(LLI == 1);
    #50 OpCode = 5'b00100; //LUI
    #50 assert(ShOut == 1);
	assert(ShR = 1);
	assert(ShB == 1);
	assert(Sh8 == 1);
	//inner signal N == 0
