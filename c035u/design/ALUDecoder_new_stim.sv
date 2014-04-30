// stimulus file ALUDecoder_new_stim.sv for ALUDecoder_new
// created by ext2svmod 5.5

module ALUDecoder_new_stim;

timeunit 1ns;
timeprecision 10ps;

//import opcodes::*;

logic [4:0] OpCode;							//Operation Code Input
logic [3:0] imm4;							//Shifting Amount Input
wire C, V, Z;								//Flag Outputs
wire FAOut, CIn_slice, AND, OR, XOR, NOT, NAND, NOR, SUB, ZeroA, Sum;	//Arith, Logic Control Outputs
logic Cin, COut, nZ, LastCIn;						//Arith, Logic Control Inputs
wire Sh1, Sh2, Sh4, Sh8, ShL, ShR, ShiftIn, ShB, ShOut;			//Shifting Control Outputs
logic ASign;								//Shifting Control Inputs
wire LLI;								//LLI Control Output

logic ENABLECHECKS;							//Testbench Variable
logic A, B, bitC, D, E, nA, nB, nC, nD, nE;
//Opcode_t OpCode; 

ALUDecoder_new d(
	.AND ( AND ),
	.C ( C ),
	.CIn_slice ( CIn_slice ),
	.FAOut ( FAOut ),
	.LLI ( LLI ),
	.NAND ( NAND ),
	.NOR ( NOR ),
	.NOT ( NOT ),
	.OR ( OR ),
	.Sh1 ( Sh1 ),
	.Sh2 ( Sh2 ),
	.Sh4 ( Sh4 ),
	.Sh8 ( Sh8 ),
	.ShB ( ShB ),
	.ShiftIn( ShiftIn ),
	.ShL ( ShL ),
	.ShOut ( ShOut ),
	.ShR ( ShR ),
	.SUB ( SUB ),
	.V ( V ),
	.XOR ( XOR ),
	.Z ( Z ),
	.ZeroA ( ZeroA ),
	.ASign ( ASign ),
	.Cin ( Cin ),
	.COut ( COut ),
	.imm4 ( imm4 ),
	.LastCIn ( LastCIn ),
	.nZ ( nZ ),
	.OpCode ( OpCode )
	);

assign A = OpCode[4];    assign nA = ~OpCode[4];
assign B = OpCode[3];    assign nB = ~OpCode[3];
assign bitC = OpCode[2]; assign nC = ~OpCode[2];
assign D = OpCode[1];    assign nD = ~OpCode[1];
assign E = OpCode[0];    assign nE = ~OpCode[0];

//Assertions to ensure only the intended set of control signals are active for each OpCode
always @(OpCode or C or V or Z or CIn_slice or imm4 or ASign)
begin
	#25 //Allow for propagation
	//Display Operations and Outputted control signals
	$write("--->");
	if(FAOut == 1)
		$write("FAOut ");
	if(SUB == 1)
		$write("SUB ");
	if(ShOut == 1)
		$write("ShOut ");
	if(ShR == 1)
		$write("ShR ");
	if(d.UseC == 1)		//Internal Signal
		$write("UseC ");
	if(CIn_slice == 1)	//Resultant External Signal
		$write("(CIn_slice) ");
	if(Sh1 == 1)
		$write("Sh1 ");
	if(Sh2 == 1)
		$write("Sh2 ");
	if(Sh4 == 1)
		$write("Sh4 ");
	if(Sh8 == 1)
		$write("Sh8 ");
	if(ZeroA == 1)
		$write("ZeroA ");
	if(AND == 1)
		$write("AND ");
	if(OR == 1)
		$write("OR ");
	if(XOR == 1)
		$write("XOR ");
	if(NOT == 1)
		$write("NOT ");
	if(NAND == 1)
		$write("NAND ");
	if(NOR == 1)
		$write("NOR ");
	if(ShL == 1)
		$write("ShL ");
	if(d.ShSign == 1)		//Internal Signal
		$write("ShSign ");
	if(ShiftIn == 1)	//Resultant External Signal
		$write("(ShiftIn) ");
	if(ShB == 1)
		$write("ShB ");
	if(LLI == 1)
		$write("LLI ");
	$write("--->");//Display flags Seperately
	if(C == 1)
		$write("C ");
	if(V == 1)
		$write("V ");
	if(Z == 1)
		$write("Z ");
	$write("\n");

	//Assertion checks for Control Outputs
	if ((nA)|(B&D&nE))
		assert(FAOut == 1);
	else
		assert(FAOut == 0);
	if ((B&nC&D&nE)|(nA&bitC&D&E)|(nA&B&bitC)|(nA&B&nC&E))
		assert(SUB == 1);
	else
		assert(SUB == 0);
	if ((A&bitC&nD)|(A&B&bitC&E)|(A&B&nC&nD))
		//if (A&B&nC&nD&E) 
		//	assert(ShOut == 0);
		//else
			assert(ShOut == 1); 
	else
		assert(ShOut == 0);
	if (A&B&bitC&nD)
		assert(ShR == 1);
	else
		assert(ShR == 0);
	if (nA&bitC&nD)		//Internal Signal
		assert(d.UseC == 1);
	else
		assert(d.UseC == 0);
	if (d.UseC)		//Resultant External Signal
		assert(CIn_slice == (Cin^SUB));
	else
		assert(CIn_slice == SUB);
	if ((A&B&bitC&E)|(A&B&bitC&nD))
	begin
		assert(Sh1 == imm4[0]);
		assert(Sh2 == imm4[1]);
		assert(Sh4 == imm4[2]);
	end
	else
	begin
		assert(Sh1 == 0);
		assert(Sh2 == 0);
		assert(Sh4 == 0);
	end
	if ((A&B&bitC&E)|(A&B&bitC&nD))
		assert(Sh8 == imm4[3]);
	else if (OpCode == 5'b10100)
		assert(Sh8 == 1'b1);
	else
		assert(Sh8 == 0);
	if (OpCode == 5'b11010)
		assert(ZeroA == 1);
	else
		assert(ZeroA == 0);
	if (OpCode == 5'b10000)
		assert(AND == 1);
	else
		assert(AND == 0);
	if (OpCode == 5'b10001)
		assert(OR == 1);
	else
		assert(OR == 0);
	if (OpCode == 5'b10011)
		assert(XOR == 1);
	else
		assert(XOR == 0);
	if (OpCode == 5'b10010)
		assert(NOT == 1);
	else
		assert(NOT == 0);
	if (OpCode == 5'b10110)
		assert(NAND == 1);
	else
		assert(NAND == 0);
	if (OpCode == 5'b10111)
		assert(NOR == 1);
	else
		assert(NOR == 0);
	if ((A&B&bitC&D&E)|(A&nB&bitC&nD&nE))
		assert(ShL == 1);
	else
		assert(ShL == 0);
	if (OpCode == 5'b11100)		//Internal Signal
		assert(d.ShSign == 1);
	else
		assert(d.ShSign == 0);
	if (d.ShSign)			//Resultant External Signal
		assert(ShiftIn == ASign);
	else
		assert(ShiftIn == 0);
	if (OpCode == 5'b10100)
		assert(ShB == 1);
	else
		assert(ShB == 0);
	if (OpCode == 5'b10101)
		assert(LLI == 1);
	else
		assert(LLI == 0);
	//Assertion Checks for Flags
	assert(C == (SUB ^ COut));
	assert(V == (LastCIn ^ SUB ^ COut));
	assert(Z == (~nZ));
end

initial
  begin
    imm4 = 4'b0000; Cin = 0; COut = 0; nZ = 0; LastCIn = 0; ASign = 0;
    $write("Input Change--->Control Output ---> Flags\n");
    $write("NOP         "); OpCode = 5'b11000; //Default to NOP

	//Column 1
    #50 $write("LDW         "); OpCode = 5'b00000; //LDW
    #50 $write("POP         "); OpCode = 5'b00001; //POP
    #50 $write("ADDIB       "); OpCode = 5'b00011; //ADDIB
    #50 $write("ADD         "); OpCode = 5'b00010; //ADD
    #50 $write("ADDI        "); OpCode = 5'b00110; //ADDI
    #50 $write("CMP         "); OpCode = 5'b00111; //CMP
    #50 $write("ADCI        "); OpCode = 5'b00101; //ADCI
    #50 $write("ADC         "); OpCode = 5'b00100; //ADC

	//Column 2
    #50 $write("STW         "); OpCode = 5'b01000; //STW
    #50 $write("PUSH        "); OpCode = 5'b01001; //PUSH
    #50 $write("SUBIB       "); OpCode = 5'b01011; //SUBIB
    #50 $write("SUB         "); OpCode = 5'b01010; //SUB
    #50 $write("SUBI        "); OpCode = 5'b01110; //SUBI
    #50 $write("CMPI        "); OpCode = 5'b01111; //CMPI
    #50 $write("SUCI        "); OpCode = 5'b01101; //SUCI
    #50 $write("SUC         "); OpCode = 5'b01100; //SUC

	//Column 3
    #50 $write("NOP         "); OpCode = 5'b11000; //NOP
    #50 $write("'F'         "); OpCode = 5'b11001; //'F' (INTERRUPTS)
    #50 $write("NEG         "); OpCode = 5'b11010; //NEG
    #50 $write("'D'         "); OpCode = 5'b11110; //'D'
    #50 $write("LSL         "); OpCode = 5'b11111; //LSL
    #50 $write("LSR         "); OpCode = 5'b11101; //LSR
    #50 $write("ASR         "); OpCode = 5'b11100; //ASR

	//Column 4
    #50 $write("AND         "); OpCode = 5'b10000; //AND
    #50 $write("OR          "); OpCode = 5'b10001; //OR
    #50 $write("XOR         "); OpCode = 5'b10011; //XOR
    #50 $write("NOT         "); OpCode = 5'b10010; //NOT
    #50 $write("NAND        "); OpCode = 5'b10110; //NAND
    #50 $write("NOR         "); OpCode = 5'b10111; //NOR
    #50 $write("LLI         "); OpCode = 5'b10101; //LLI
    #50 $write("LUI         "); OpCode = 5'b10100; //LUI
    #50 $write("===End of Basic Tests=======\n");

	//Carry in Tests
    #50 $write("ADC         "); OpCode = 5'b00100;
    #50 $write("Cin         "); Cin = 1; 
    #50 $write("COut        "); COut = 1;
    #50 $write("LastCIn     "); LastCIn = 1; 
    #50 $write("SUC         "); OpCode = 5'b01100;
    #50 $write("Cin = 0     "); Cin = 0; 
    #50 $write("COut = 0    "); COut = 0;
    #50 $write("~LastCIn    "); LastCIn = 0; 
    #50 $write("===End of CarryIn Tests=====\n");

	//Shifting Amount Tests
    #50 $write("LSL         "); OpCode = 5'b11111;
    #50 $write("imm4 = 1    "); imm4 = 4'd1;
    #50 $write("imm4 = 2    "); imm4 = 4'd2;
    #50 $write("imm4 = 3    "); imm4 = 4'd3;
    #50 $write("imm4 = 4    "); imm4 = 4'd4;
    #50 $write("imm4 = 5    "); imm4 = 4'd5;
    #50 $write("imm4 = 8    "); imm4 = 4'd8;
    #50 $write("imm4 = 9    "); imm4 = 4'd9;
    #50 $write("imm4 = 15   "); imm4 = 4'd15;
    #50 $write("LSR         "); OpCode = 5'b11101;
    #50 $write("imm4 = 1    "); imm4 = 4'd1;
    #50 $write("imm4 = 2    "); imm4 = 4'd2;
    #50 $write("imm4 = 3    "); imm4 = 4'd3;
    #50 $write("imm4 = 4    "); imm4 = 4'd4;
    #50 $write("imm4 = 5    "); imm4 = 4'd5;
    #50 $write("imm4 = 8    "); imm4 = 4'd8;
    #50 $write("imm4 = 9    "); imm4 = 4'd9;
    #50 $write("imm4 = 15   "); imm4 = 4'd15;
    #50 $write("===End of Shifting Tests====\n");

	//Shifting Bit In Tests
    #50 $write("ASign       "); ASign = 1;
    #50 $write("ASR         "); OpCode = 5'b11100;
    #50 $write("ASign = 0   "); ASign = 0; 
    #50 $write("===End of ShiftIn Bit Tests=\n");

	//Basic Flag Tests
    #50 $write("nZ          "); nZ = 1;

    #50 $write("====All Tests Completed!====\n");

    #50 $finish;
  end

//SIMVISION SCRIPT:ALUDecoder.tcl

endmodule
