// stimulus file ALUDecoder_stim.sv for ALUDecoder
// created by ext2svmod 5.5

module ALUDecoder_stim;

timeunit 1ns;
timeprecision 10ps;

logic [4:0] OpCode;							//Operation Code Input
logic [3:0] imm4;							//Shifting Amount Input
wire C, V, N, Z;							//Flag Outputs
wire FAOut, CIn_Slice, AND, OR, XOR, NOT, NAND, NOR, SUB, ZeroA, Sum;	//Arith, Logic Control Outputs
logic Cin, COut, nZ, LastCIn;						//Arith, Logic Control Inputs
wire Sh1, Sh2, Sh4, Sh8, ShL, ShR, ShInBit, ShB, ShOut;			//Shifting Control Outputs
logic ASign;								//Shifting Control Inputs
wire LLI;								//LLI Control Output

ALUDecoder d(
	.AND ( AND ),
	.C ( C ),
	.CIn_Slice ( CIn_Slice ),
	.FAOut ( FAOut ),
	.LLI ( LLI ),
	.N ( N ),
	.NAND ( NAND ),
	.NOR ( NOR ),
	.NOT ( NOT ),
	.OR ( OR ),
	.Sh1 ( Sh1 ),
	.Sh2 ( Sh2 ),
	.Sh4 ( Sh4 ),
	.Sh8 ( Sh8 ),
	.ShB ( ShB ),
	.ShInBit ( ShInBit ),
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

// stimulus information follows
always @(OpCode)
begin
if (OpCode == 5'b0????)
	Faout
if (OpCode == 5'b?1?10)
	faout
if (OpCode == 5'b?1010)
	sub
if (OpCode == 5'b0?111)
	sub
if (OpCode == 5'b011??)
	sub
if (OpCode == 5'b010?1)
	sub
if (OpCode == 5'b1?10?)
	shout
if (OpCode == 5'b111?1)
	shout
if (OpCode == 5'b1100?)
	shout
if (OpCode == 5'b1?100)
	shr
if (OpCode == 5'b1110?)
	shr
if (OpCode == 5'b0?10?)
	usec
if (OpCode == 5'b111?1)
	sh1, sh2, sh4, sh8
if (OpCode == 5'b1110?)
	sh1, sh2, sh4. sh8
if (OpCode == 5'b10100)
	sh8
if (OpCode == 5'b11010)
	zeroa
if (OpCode == 5'b10000)
	and
if (OpCode == 5'b10001)
	or
if (OpCode == 5'b10011)
	xor
if (OpCode == 5'b10010)
	not
if (OpCode == 5'b10110)
	nand
if (OpCode == 5'b10111)
	nor
if (OpCode == 5'b11111)
	shl
if (OpCode == 5'b11100)
	shinsign
if (OpCode == 5'b10100)
	shb
if (OpCode == 5'b10101)
	lli
end

initial
  begin
    OpCode = 5'b11000; //Default to NOP
    imm4 = 0; Cin = 0; COut = 0; nZ = 0; LastCIn = 0; ASign = 0;

    #50 OpCode = 5'b00000; //LDW
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	FAOut, CIn_Slice, AND, OR, XOR, NOT, NAND, NOR, SUB, ZeroA, Sum, Sh1, Sh2, Sh4, Sh8, ShL, ShR, ShInBit, ShB, ShOut, LLI
	assert(FAOut == 1);
    #50 OpCode = 5'b00001; //POP
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	assert(FAOut == 1);
    #50 OpCode = 5'b00011; //ADDIB
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	assert(FAOut == 1);
    #50 OpCode = 5'b00010; //ADD
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	assert(FAOut == 1);
    #50 OpCode = 5'b00110; //ADDI
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	assert(FAOut == 1);
    #50 OpCode = 5'b00111; //CMP
    #50 $display("FAOut = %5b, CIn_Slice = %b, SUB = %b", FAOut, CIn_Slice, SUB); 
	assert(FAOut == 1);
        assert(SUB == 1);
    #50 OpCode = 5'b00101; //ADCI
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	assert(FAOut == 1);
        //UseC
    #50 OpCode = 5'b00100; //ADC
    #50 $display("FAOut = %5b, CIn_Slice = %b", FAOut, CIn_Slice); 
	assert(FAOut == 1);
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
  end

// probe information follows



//SIMVISION SCRIPT:ALUDecoder.tcl

endmodule
