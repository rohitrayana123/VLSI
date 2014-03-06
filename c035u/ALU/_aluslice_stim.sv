
logic A, B;
logic ALUOut; 				//***POSS CHANGING TO LLI_IN
logic SUB, ZeroA, CIn,  FAOut; 				//Arith Inputs
logic LastCIn, COut, Sum, nZ;				//Arith Outputs
logic AND, OR, XOR, NOT, NAND, NOR;			//Logic Inputs
logic Sh8, Sh4, Sh2, Sh1, ShB, ShL, ShR, ShOut;		//Shift Inputs
logic ASign,;						//Shift Outputs
logic Sh8A_L, Sh8B_L, Sh8C_L, Sh8D_L, Sh4A_L, Sh4B_L, Sh4C_L, Sh2A_L, Sh2B_L, Sh1A_L; //Shift inter-bit Left (O)
logic Sh8A_R, Sh8B_R, Sh8C_R, Sh8D_R, Sh4A_R, Sh4B_R, Sh4C_R, Sh2A_R, Sh2B_R, Sh1A_R; //Shift inter-bit right (I)

initial
    A = 0; B = 0; 
    SUB = 0; ZeroA = 0; CIn = 0; FAOut = 0; 
    AND = 0; OR = 0; XOR = 0; NOT = 0; NAND = 0; NOR = 0;
    Sh8 = 0; Sh4 = 0; Sh2 = 0; Sh1 = 0; ShB = 0; ShL = 0; ShR = 0; ShOut = 0; 
    Sh8A_R = 0; Sh8B_R = 0; Sh8C_R = 0; Sh8D_R = 0; Sh4A_R = 0; Sh4B_R = 0; Sh4C_R = 0; Sh2A_R = 0; Sh2B_R = 0; Sh1A_R = 0;

    #50 FAOut = 1;				//Sum == ALUOut
    #50 assert(ALUOut == 0);
    #50 A = 1;
    #50 assert(ALUOut == 1);
	assert(COut == 0);
    #50 B = 1;
    #50 assert(ALUOut == 0); //DEP BOTTOM INPUT
	assert(COut == 1);
	assert(nZ == 0); //DEP BOTTOM INPUT
	//LastCin //DEP BOT IN
    #50 SUB == 1;
    #50 assert(ALUOut == 0); //DEP BOT IN
	assert(COut == 0); //DEP BOT IN
	assert(nZ == 0); //DEP BOT IN
    #50 SUB == 0; ZeroA == 1;
    #50 assert(ALUOut == 1);
	assert(COut == 0);
	assert(nZ == 1); 

    #50 FAOut = 0; AND = 1;
    #50 assert(ALUOut == 1);
    #50 B = 0; 
    #50 assert(ALUOut == 0);
    #50 AND = 0; OR = 1; 
    #50 assert(ALUOut == 1);
    #50 A = 0; 
    #50 assert(ALUOut == 0);
    #50 A = 1; OR = 0; XOR = 1; 
    #50 assert(ALUOut == 1);
    #50 B = 1; 
    #50 assert(ALUOut == 0);
    #50 XOR = 0; NOT = 1;
    #50 assert(ALUOut == 0);
    #50 A = 0; 
    #50 assert(ALUOut == 1);
    #50 NOT = 0; NAND = 1;
    #50 assert(ALUOut == 1);
    #50 A = 1; 
    #50 assert(ALUOut == 0);
    #50 NAND = 0; NOR = 1;
    #50 assert(ALUOut == 0);
    #50 A = 0; B = 0; 
    #50 assert(ALUOut == 1);
    
    #50 NOR = 0; 				//Testing single-slice shifting unnecessary
