// stimulus file ALUSlice_stim.sv for ALUSlice
// created by ext2svmod 5.5
// ALU_Out from ALUEnable untested

module ALUSlice_stim;

timeunit 1ns;
timeprecision 10ps;

logic A, B;						//Operand Inputs, and sign output
logic SUB, ZeroA, CIn_Slice, nZ_prev, FAOut;		//Arith Inputs
wire COut, nZ, Sum;					//Arith Outputs
logic AND, OR, XOR, NOT, NAND, NOR;			//Logic Inputs
logic Sh8, Sh4, Sh2, Sh1, ShB, ShL, ShR, ShOut;		//Shift Inputs
logic Sh8H_L, Sh4D_L, Sh2C_L, Sh1_L_In; 		//Inter-bit Shift Left Inputs
wire Sh8Z_L, Sh4Z_L, Sh2A_L, Sh1_L_Out; 		//Shift inter-bit Left Outputs
logic Sh8H_R, Sh4C_R, Sh2B_R, Sh1_R_In; 		//Shift inter-bit Right Inputs
wire Sh8Z_R, Sh4Y_R, Sh2Z_R, Sh1_R_Out; 		//Shift inter-bit Right Outputs

ALUSlice a(
	.COut ( COut ),
	.nZ ( nZ ),
	.Sh1_L_Out ( Sh1_L_Out ),
	.Sh1_R_Out ( Sh1_R_Out ),
	.Sh2A_L ( Sh2A_L ),
	.Sh2Z_R ( Sh2Z_R ),
	.Sh4Y_R ( Sh4Y_R ),
	.Sh4Z_L ( Sh4Z_L ),
	.Sh8Z_L ( Sh8Z_L ),
	.Sh8Z_R ( Sh8Z_R ),
	.Sum ( Sum ),
	.A ( A ),
	.AND ( AND ),
	.B ( B ),
	.CIn_Slice ( CIn_Slice ),
	.FAOut ( FAOut ),
	.NAND ( NAND ),
	.NOR ( NOR ),
	.NOT ( NOT ),
	.nZ_prev ( nZ_prev ),
	.OR ( OR ),
	.Sh1 ( Sh1 ),
	.Sh1_L_In ( Sh1_L_In ),
	.Sh1_R_In ( Sh1_R_In ),
	.Sh2 ( Sh2 ),
	.Sh2B_R ( Sh2B_R ),
	.Sh2C_L ( Sh2C_L ),
	.Sh4 ( Sh4 ),
	.Sh4C_R ( Sh4C_R ),
	.Sh4D_L ( Sh4D_L ),
	.Sh8 ( Sh8 ),
	.Sh8H_R ( Sh8H_R ),
	.Sh8H_L ( Sh8H_L ),
	.ShB ( ShB ),
	.ShL ( ShL ),
	.ShOut ( ShOut ),
	.ShR ( ShR ),
	.SUB ( SUB ),
	.XOR ( XOR ),
	.ZeroA ( ZeroA )
	);

//Check Expected Arithmetic Operations
task checkArith;
	assert(a.FA_1 == (A & ~ZeroA));
	assert(a.FA_2 == B ^ SUB);
	assert(Sum == a.FA_1 ^ a.FA_2 ^ CIn_Slice);
	assert(a.LLI_In == Sum & FAOut);
	assert(COut == (a.FA_1&a.FA_2) | (CIn_Slice&(a.FA_1^a.FA_2)));
	assert(nZ == nZ_prev | Sum);
	if (ZeroA == 1)
		$write(" 0 ");
	else
		$write(" %b ", A);
	if (SUB == 1)
		$write("-");
	else
		$write("+");
	$write(" %b ", B);
	if (SUB == 1)
		$write("-");
	else
		$write("+");
	$write(" %b -> %b, %b     ::: %b\n", CIn_Slice, Sum, COut, a.LLI_In);
endtask
//Check Expected Shifting Operations
task checkShift;
    assert(a.LLI_In == Sh1);
    if (ShL == 1)
    begin
	assert(Sh8Z_L == (A&~ShB) | (B&ShB));
	assert(Sh4Z_L == (Sh8 | (~Sh8 & (A&~ShB) | (B&ShB))));
	assert(Sh2A_L == (Sh4 | (~Sh4 & Sh8) | (~Sh4 & ~Sh8 & (A&~ShB) | (B&ShB))));
	assert(Sh1_L_Out == (Sh2 | (~Sh2 & Sh4) | (~Sh2 & ~Sh4 & Sh8) | (~Sh2 & ~Sh4 & ~Sh8 & (A&~ShB) | (B&ShB))));
    end
    else if (ShR == 1)
    begin
	assert(Sh8Z_R == (A&~ShB) | (B&ShB));
	assert(Sh4Y_R == (Sh8 | (~Sh8 & (A&~ShB) | (B&ShB))));
	assert(Sh2Z_R == (Sh4 | (~Sh4 & Sh8) | (~Sh4 & ~Sh8 & (A&~ShB) | (B&ShB))));
	assert(Sh1_R_Out == (Sh2 | (~Sh2 & Sh4) | (~Sh2 & ~Sh4 & Sh8) | (~Sh2 & ~Sh4 & ~Sh8 & (A&~ShB) | (B&ShB))));
    end
	$display("%b |  %b   %b   %b   | %b%b%b%b ||  %b%b%b%b   || %b%b%b%b", A, ShL, ShR, ShB, Sh8, Sh4, Sh2, Sh1, Sh8Z_L, Sh4Z_L, Sh2A_L, Sh1_L_Out, Sh8Z_R, Sh4Y_R, Sh2Z_R, Sh1_R_Out);
endtask

//Cell Stimulus
initial
  begin
    A = 0; B = 0;
    SUB = 0; ZeroA = 0; CIn_Slice = 0; nZ_prev = 0; FAOut = 0; 
    AND = 0; OR = 0; XOR = 0; NOT = 0; NAND = 0; NOR = 0;
    Sh8 = 0; Sh4 = 0; Sh2 = 0; Sh1 = 0; ShB = 0; ShL = 0; ShR = 0; ShOut = 0; 
    Sh8H_L = 0; Sh4D_L = 0; Sh2C_L = 0; Sh1_L_In = 0;
    Sh8H_R = 0; Sh4C_R = 0; Sh2B_R = 0; Sh1_R_In = 0;

	//Arithmetic Testing
    $display("---ARITH TESTS---");
    $display(" A   B   Cin  S  Cout  ::: LLI_In");
    #50 FAOut = 1;
    #50 checkArith;
    #50 B = 1;
    #50 checkArith;
    #50 A = 1;
    #50 checkArith;
    #50 B = 0;
    #50 checkArith;
    #50 CIn_Slice = 1;
    #50 checkArith;
    #50 A = 0; 
    #50 checkArith;
    #50 B = 1;
    #50 checkArith;
    #50 A = 1;
    #50 checkArith;
    $display("");
    $display(" A   B  ~Cin  S ~Borrow::: LLI_In");
    #50 SUB = 1; A = 0; B = 0; CIn_Slice = 0;
    #50 checkArith;
    #50 B = 1;
    #50 checkArith;
    #50 A = 1;
    #50 checkArith;
    #50 B = 0;
    #50 checkArith;
    #50 CIn_Slice = 1;
    #50 checkArith;
    #50 A = 0; 
    #50 checkArith;
    #50 B = 1;
    #50 checkArith;
    #50 A = 1;
    #50 checkArith;
    $display("");
    $display(" 0   B  ~Cin  S ~Borrow::: LLI_In");
    #50 ZeroA = 1;
    #50 checkArith;
    #50 B = 0;
    #50 checkArith;
    #50 CIn_Slice = 0;
    #50 checkArith;
    #50 B = 1;
    #50 checkArith;
    $display("");
    $display(" 0   B   Cin  S  Cout  ::: LLI_In");
    #50 SUB = 0; CIn_Slice = 1; A = 1; B = 1;
    #50 checkArith;
    #50 B = 0;
    #50 checkArith;
    #50 CIn_Slice = 0;
    #50 checkArith;
    #50 B = 1;
    #50 checkArith;

	//Logic Testing
    $display("---LOGICAL TESTS---");
    $display("  A   B    LLI_In");
    #50 FAOut = 0; AND = 1;
    #50 assert(a.LLI_In == (A&B)); $display("  %b & %b  = %b", A, B, a.LLI_In);
    #50 B = 0; 
    #50 assert(a.LLI_In == (A&B)); $display("  %b & %b  = %b", A, B, a.LLI_In);
    #50 A = 0;
    #50 assert(a.LLI_In == (A&B)); $display("  %b & %b  = %b", A, B, a.LLI_In);
    #50 B = 1;
    #50 assert(a.LLI_In == (A&B)); $display("  %b & %b  = %b", A, B, a.LLI_In);
    #50 AND = 0; OR = 1; 
    #50 assert(a.LLI_In == (A|B)); $display("  %b | %b  = %b", A, B, a.LLI_In);
    #50 A = 1; 
    #50 assert(a.LLI_In == (A|B)); $display("  %b | %b  = %b", A, B, a.LLI_In);
    #50 B = 0;
    #50 assert(a.LLI_In == (A|B)); $display("  %b | %b  = %b", A, B, a.LLI_In);
    #50 A = 0;
    #50 assert(a.LLI_In == (A|B)); $display("  %b | %b  = %b", A, B, a.LLI_In);
    #50 OR = 0; XOR = 1; 
    #50 assert(a.LLI_In == (A^B)); $display("  %b ^ %b  = %b", A, B, a.LLI_In);
    #50 B = 1; 
    #50 assert(a.LLI_In == (A^B)); $display("  %b ^ %b  = %b", A, B, a.LLI_In);
    #50 A = 1;
    #50 assert(a.LLI_In == (A^B)); $display("  %b ^ %b  = %b", A, B, a.LLI_In);
    #50 B = 0;
    #50 assert(a.LLI_In == (A^B)); $display("  %b ^ %b  = %b", A, B, a.LLI_In);
    #50 XOR = 0; NOT = 1;
    #50 assert(a.LLI_In == (~A)); $display("~ %b      = %b", A, a.LLI_In);
    #50 A = 0; 
    #50 assert(a.LLI_In == (~A)); $display("~ %b      = %b", A, a.LLI_In);
    #50 NOT = 0; NAND = 1;
    #50 assert(a.LLI_In == (~(A&B))); $display("~(%b & %b) = %b", A, B, a.LLI_In);
    #50 A = 1; 
    #50 assert(a.LLI_In == (~(A&B))); $display("~(%b & %b) = %b", A, B, a.LLI_In);
    #50 B = 1;
    #50 assert(a.LLI_In == (~(A&B))); $display("~(%b & %b) = %b", A, B, a.LLI_In);
    #50 A = 0;
    #50 assert(a.LLI_In == (~(A&B))); $display("~(%b & %b) = %b", A, B, a.LLI_In);
    #50 NAND = 0; NOR = 1;
    #50 assert(a.LLI_In == (~(A|B))); $display("~(%b | %b) = %b", A, B, a.LLI_In);
    #50 B = 0;
    #50 assert(a.LLI_In == (~(A|B))); $display("~(%b | %b) = %b", A, B, a.LLI_In);
    #50 A = 1;
    #50 assert(a.LLI_In == (~(A|B))); $display("~(%b | %b) = %b", A, B, a.LLI_In);
    #50 B = 1;
    #50 assert(a.LLI_In == (~(A|B))); $display("~(%b | %b) = %b", A, B, a.LLI_In);

	//Shifting Testing
    $display("---SHIFTING TESTS---");
    $display("All shift inputs are held high");
    $display("A | Control Sigs | imm4 || OutLeft || OutRight");
    $display("  | ShL ShR ShB  |      ||         ||");
    #50 NOR = 0; ShOut = 1; A = 0; B = 0;
    #50 assert(a.LLI_In == 0);
    #50 Sh8H_L = 1; Sh4D_L = 1; Sh2C_L = 1; Sh1_L_In = 1; //Feed 1's in inter-bit signals
	Sh8H_R = 1; Sh4C_R = 1; Sh2B_R = 1; Sh1_R_In = 1;
    #50 checkShift;
    #50 ShL = 1; //turn on left shifting
    #50 checkShift;
    #50 Sh1 = 1;
    #50 checkShift;
    #50 Sh2 = 1;
    #50 checkShift;
    #50 Sh4 = 1;
    #50 checkShift;
    #50 Sh8 = 1;
    #50 checkShift;
    #50 A = 1;
    #50 checkShift;

    #50 A = 0; Sh1 = 0; Sh2 = 0; Sh4 = 0; Sh8 = 0; ShL = 0; //Reset inputs
	ShR = 1; //turn on right shifting
    #50 checkShift;
    #50 Sh1 = 1;
    #50 checkShift;
    #50 Sh2 = 1;
    #50 checkShift;
    #50 Sh4 = 1;
    #50 checkShift;
    #50 Sh8 = 1;
    #50 checkShift;
    #50 A = 1;
    #50 checkShift;

    #50 A = 0; Sh1 = 0; Sh2 = 0; Sh4 = 0; Sh8 = 0; ShR = 0; //Reset inputs
    	ShL = 1; ShB = 1;//Turn on left shifting and shift B input
    #50 checkShift;
    #50 Sh1 = 1;
    #50 checkShift;
    #50 Sh2 = 1;
    #50 checkShift;
    #50 Sh4 = 1;
    #50 checkShift;
    #50 Sh8 = 1;
    #50 checkShift;
    #50 B = 1;
    #50 checkShift;

    #500 $finish;

  end

//SIMVISION SCRIPT:ALUSlice.tcl

endmodule
