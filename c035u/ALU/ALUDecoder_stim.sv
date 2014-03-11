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

logic ENABLECHECKS;							//Testbench Variable

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

//Assertions to ensure only the intended set of control signals are active for each OpCode
always @(OpCode)
begin
if (ENABLECHECKS == 1);
begin
	if ((OpCode == 5'b0????)|(OpCode == 5'b?1?10))
		assert(FAOut == 1);
	else
		assert(FAOut == 0);
	if ((OpCode == 5'b?1010)|(OpCode == 5'b0?111)|(OpCode == 5'b011??)|(OpCode == 5'b010?1))
		assert(SUB == 1);
	else
		assert(SUB == 0);
	if ((OpCode == 5'b1?10?)|(OpCode == 5'b111?1)|(OpCode == 5'b1100?))
		assert(ShOut == 1);
	else
		assert(ShOut == 0);
	if ((OpCode == 5'b1?100)|(OpCode == 5'b1110?))
		assert(ShR == 1);
	else
		assert(ShR == 0);
	if (OpCode == 5'b0?10?)
		assert(CIn_Slice == (Cin^SUB));//Check!!
	else
		assert(CIn_Slice == SUB);
	if ((OpCode == 5'b111?1)|(OpCode == 5'b1110?))
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
	if ((OpCode == 5'b111?1)|(OpCode == 5'b1110?))
		assert(Sh8 == imm4[4]);
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
	if (OpCode == 5'b11111)
		assert(ShL == 1);
	else
		assert(ShL == 0);
	if (OpCode == 5'b11100)
		assert(ShInBit == 1);
	else
		assert(ShInBit == 0);
	if (OpCode == 5'b10100)
		assert(ShB == 1);
	else
		assert(ShB == 0);
	if (OpCode == 5'b10101)
		assert(LLI == 1);
	else
		assert(LLI == 0);
end
end

initial
  begin
    imm4 = 0; Cin = 0; COut = 0; nZ = 0; LastCIn = 0; ASign = 0;
    OpCode = 5'b11000; //Default to NOP
    #10 ENABLECHECKS = 1;

	//Basic Adding Tests
    #50 $display("LDW"); OpCode = 5'b00000; //LDW
    #50 $display("POP"); OpCode = 5'b00001; //POP
    #50 $display("ADDIB"); OpCode = 5'b00011; //ADDIB
    #50 $display("ADD"); OpCode = 5'b00010; //ADD
    #50 $display("ADDI"); OpCode = 5'b00110; //ADDI
    #50 $display("CMP"); OpCode = 5'b00111; //CMP
    #50 $display("ADCI"); OpCode = 5'b00101; //ADCI
    #50 $display("ADC"); OpCode = 5'b00100; //ADC

	//Basic Subtraction Tests
    #50 $display("STW"); OpCode = 5'b00100; //STW
    #50 $display("PUSH"); OpCode = 5'b00100; //PUSH
    #50 $display("SUBIB"); OpCode = 5'b00100; //SUBIB
    #50 $display("SUB"); OpCode = 5'b00100; //SUB
    #50 $display("SUBI"); OpCode = 5'b00100; //SUBI
    #50 $display("CMPI"); OpCode = 5'b00100; //CMPI
    #50 $display("SUCI"); OpCode = 5'b00100; //SUCI
    #50 $display("SUC"); OpCode = 5'b00100; //SUC
	//Carry in Tests

	//Basic Shifting Tests
    #50 $display("NOP"); OpCode = 5'b00100; //NOP
    #50 $display("NEG"); OpCode = 5'b00100; //NEG
    #50 $display("'D'"); OpCode = 5'b00100; //'D'
    #50 $display("LSL"); OpCode = 5'b00100; //LSL
    #50 $display("LSR"); OpCode = 5'b00100; //LSR
    #50 $display("ASR"); OpCode = 5'b00100; //ASR
	//Shifting Amount Tests

	//Shifting Bit In Tests

	//Basic Logic Tests
    #50 $display("AND"); OpCode = 5'b00100; //AND
    #50 $display("OR"); OpCode = 5'b00100; //OR
    #50 $display("XOR"); OpCode = 5'b00100; //XOR
    #50 $display("NOT"); OpCode = 5'b00100; //NOT
    #50 $display("NAND"); OpCode = 5'b00100; //NAND
    #50 $display("NOR"); OpCode = 5'b00100; //NOR

	//Basic Loading Tests
    #50 $display("LLI"); OpCode = 5'b00100; //LLI
    #50 $display("LUI"); OpCode = 5'b00100; //LUI

	//Basic Flag Tests

    #50 $finish;
  end

//SIMVISION SCRIPT:ALUDecoder.tcl

endmodule
