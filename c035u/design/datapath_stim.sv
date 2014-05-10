// stimulus file datapath_stim.sv for datapath
// created by ext2svmod 5.5

module datapath_stim;

timeunit 1ns;
timeprecision 10ps;

logic AluEn ;
logic [1:0] AluOR ;
logic AluWe ;
logic CFlag ;
logic Clock ;
logic [15:0] DataIn ;
logic ImmSel ;
logic IrWe ;
logic LrEn ;
logic LrSel ;
logic LrWe ;
logic MemEn ;
logic nReset ;
logic Op1Sel ;
logic [1:0] Op2Sel ;
logic PcEn ;
logic [2:0] PcSel ;
logic PcWe ;
logic RegWe ;
logic [1:0] Rs1Sel ;
logic [1:0] RwSel ;
logic SDI ;
logic [3:0] StatusReg ;
logic StatusRegEn ;
logic Test ;
logic WdSel ;

wire [15:0] DataOut ;
wire [3:0] Flags ;
wire [15:0] Ir ;
wire SDO ;

datapath d(
	.DataOut ( DataOut ),
	.Flags ( Flags ),
	.Ir ( Ir ),
	.SDO ( SDO ),
	.AluEn ( AluEn ),
	.AluOR ( AluOR ),
	.AluWe ( AluWe ),
	.CFlag ( CFlag ),
	.Clock ( Clock ),
	.DataIn ( DataIn ),
	.ImmSel ( ImmSel ),
	.IrWe ( IrWe ),
	.LrEn ( LrEn ),
	.LrSel ( LrSel ),
	.LrWe ( LrWe ),
	.MemEn ( MemEn ),
	.nReset ( nReset ),
	.Op1Sel ( Op1Sel ),
	.Op2Sel ( Op2Sel ),
	.PcEn ( PcEn ),
	.PcSel ( PcSel ),
	.PcWe ( PcWe ),
	.RegWe ( RegWe ),
	.Rs1Sel ( Rs1Sel ),
	.RwSel ( RwSel ),
	.SDI ( SDI ),
	.StatusReg ( StatusReg ),
	.StatusRegEn ( StatusRegEn ),
	.Test ( Test ),
	.WdSel ( WdSel )
	);

// stimulus information follows
int errors;

always
	#50 Clock = ~Clock;

initial
  begin
    AluEn = 0; AluOR = 0; AluWe = 0; CFlag = 0; Clock = 0; DataIn = 0; ImmSel = 0; IrWe = 0; LrEn = 0; LrSel = 0; LrWe = 0; MemEn = 0; nReset = 0; 
    Op1Sel = 0; Op2Sel = 0; PcEn = 0; PcSel = 0; PcWe = 0; RegWe = 0; Rs1Sel = 0; RwSel = 0; SDI = 0; StatusReg = 0; StatusRegEn = 0; Test = 0; WdSel = 0;
    StatusReg = 4'd5;
    //d.reg0 = 16'd2; d.reg1 = 16'd4; d.reg2 = 16'd6; d.reg3 = 16'd8; d.reg4 = 16'd10; d.reg5 = 16'd12; d.reg6 = 16'd14; d.reg7 = 16'd16;
   													//CP(50)
    #100 nReset = 1;
    													//CP(150)
	$display("DataIn = ADD R1, R2, R4 = 0001000101010000");
    //Testing mux outputs with direct connection to IR register
	$display("===IR Multiplexors Testing===");
	$display("DataOut          Ir               | DataIn");
    //#100 DataIn = 16'b1010110000000001; //LLI R0, #1 
    #100 DataIn = 16'b0001000101010000; //ADD R1, R2, R4
	 MemEn = 1; IrWe = 1;
													//CP(250)[>260]
    #60 $display("%b %b | %b", DataOut, Ir, DataIn);
	assert(DataOut == DataIn) else begin errors++; $display("ERROR: SysBus incorrect"); end		
	assert(Ir == DataIn) else begin errors++; $display("ERROR: IR incorrect"); end
	assert(DataOut == DataIn) else begin errors++; $display("ERROR: SysBus incorrect"); end
	$display("Rs1 Rw Imm | Ir   (reg add)   | Rs1 Rs2 Rw  Imm");
	$display("  Select   |      dddaaabbb   |               ");
    #50 $display(" %d  %d   %d  | %b | %b %b %b %b", Rs1Sel, RwSel, ImmSel, Ir, d.Rs1, d.Rs2, d.Rw, d.ImmProbe[7:0]);
	$display("           |                  | ddd bbb aaa");
	assert(d.Rs1 == Ir[10:8]) else begin errors++; $display("ERROR: Rs1, op0"); end
	assert(d.Rs2 == Ir[4:2]) else begin errors++; $display("ERROR: Rs2, op0"); end
	assert(d.Rw == Ir[7:5]) else begin errors++; $display("ERROR: Rw, op0"); end
	assert(d.ImmProbe == { {8{Ir[7]}}, Ir[7:0]}) else begin errors++; $display("ERROR: Imm, op0"); end
    #50 Rs1Sel = 2'd1; RwSel = 2'd1; ImmSel = 2'd1;
    #50 $display(" %d  %d   %d  | %b | %b %b %b %b", Rs1Sel, RwSel, ImmSel, Ir, d.Rs1, d.Rs2, d.Rw, d.ImmProbe[7:0]);
	$display("           |                  | aaa bbb ddd");
	assert(d.Rs1 == Ir[7:5]) else begin errors++; $display("ERROR: Rs1, op1"); end
	assert(d.Rs2 == Ir[4:2]) else begin errors++; $display("ERROR: Rs2, op1"); end
	assert(d.Rw == Ir[10:8]) else begin errors++; $display("ERROR: Rw, op1"); end
	assert(d.ImmProbe == { {11{Ir[4]}}, Ir[4:0]}) else begin errors++; $display("ERROR: Imm, op1"); end
    #50 Rs1Sel = 2'd2; RwSel = 2'd2;
    #50 $display(" %d  %d   %d  | %b | %b %b %b %b", Rs1Sel, RwSel, ImmSel, Ir, d.Rs1, d.Rs2, d.Rw, d.ImmProbe[7:0]);
	$display("           |                  |  7  bbb  7 ");
	assert(d.Rs1 == 3'b111) else begin errors++; $display("ERROR: Rs1, op2"); end
	assert(d.Rs2 == Ir[4:2]) else begin errors++; $display("ERROR: Rs2, op2"); end
	assert(d.Rw == 3'b111) else begin errors++; $display("ERROR: Rw, op2"); end
    //Testing operand select muxes
	$display("===Operand Selection Testing===");							//CP(550)[>560]
	$display("Op1 Op2 | Rd1  Imm  Pc   Rd2  | Operand1 Operand2");
    #50 $display(" %d   %d  | %h %h %h %h | %h     %h    ", Op1Sel, Op2Sel, d.Rd1, d.ImmProbe, d.Pc, d.Rd2, d.Operand1, d.Operand2);
	$display("        |                     | Rd1      Imm   ");
	assert(d.Rd1 == 0) else begin errors++; $display("ERROR: Rd1, default val"); end			
	assert(d.Rd2 == 0) else begin errors++; $display("ERROR: Rd2, default val"); end
	assert(d.Operand1 == d.Rd1) else begin errors++; $display("ERROR: Operand1, op0"); end
	assert(d.Operand2 == d.ImmProbe) else begin errors++; $display("ERROR: Operand2, op0"); end
    #10 Op1Sel = 1; Op2Sel = 1;
    #50 $display(" %d   %d  | %h %h %h %h | %h     %h    ", Op1Sel, Op2Sel, d.Rd1, d.ImmProbe, d.Pc, d.Rd2, d.Operand1, d.Operand2);
	$display("        |                     | Pc       Rd2   ");
	assert(d.Operand1 == d.Pc) else begin errors++; $display("ERROR: Operand1, op1"); end
	assert(d.Operand2 == d.Rd2) else begin errors++; $display("ERROR: Operand2, op1"); end
    #10 Op2Sel = 2;
    #50 $display(" %d   %d  | %h %h %h %h | %h     %h    ", Op1Sel, Op2Sel, d.Rd1, d.ImmProbe, d.Pc, d.Rd2, d.Operand1, d.Operand2);
	$display("        |                     |          0   ");
	assert(d.Operand2 == 3'b000) else begin errors++; $display("ERRORS: Operand2, op2"); end
    //Testing ALU Basic operation
	$display("===ALU Output Testing===");
	$display("Operand1 Operand2 | AluOut AluRegOut");
    #10 Op1Sel = 0; Op2Sel = 0; ImmSel = 0; AluWe = 1;
    #40 $display("%d     %d   | %d   %d     ", d.Operand1, d.Operand2, d.AluOut, d.AluRegOut);
	$display("                  | R2 + R4");
	assert(d.AluOut == d.Operand1 + d.Operand2) else begin errors++; $display("ERROR: AluOut, ADD, R2 R4"); end
													//CP(750)[>760]
    #30 $display("%d     %d   | %d   %d     ", d.Operand1, d.Operand2, d.AluOut, d.AluRegOut);
	$display("                  |        AluOut");
	assert(d.AluRegOut == d.AluOut) else begin errors++; $display("ERROR: AluRegOut"); end
    //Testing Link Register
	$display("===LR Connections Testing===");
	$display("LrSel | AluRegOut Pc+1 | Lr");
    #10 MemEn = 0; AluEn = 1; IrWe = 0; LrWe = 1; 
													//CP(850)[>860]
    #90 $display("%d     | %h      %h | %h", LrSel, d.AluRegOut, d.PcPlus1, d.Lr);
	$display("      |                | Alu");
	assert(d.Lr == d.AluRegOut) else begin errors++; $display("ERROR: Lr, op0"); end
    #10 LrSel = 1;
													//CP(950)[>960]
    #90 $display("%d     | %h      %h | %h", LrSel, d.AluRegOut, d.PcPlus1, d.Lr);
	$display("      |                | Pc+1");
	assert(d.Lr == d.PcPlus1) else begin errors++; $display("ERROR: Lr, op1"); end
    //Testing Program Counter
	$display("===PC Connections Testing===");
	$display("PcSel | Pc+1 ALU SysBus LR  | PC");
    #10 LrWe = 0; PcWe = 1; AluEn = 0; StatusRegEn = 1;
													//CP(1050)[>1060]
    #88 $display("%d     | %h %h %h %h | %h", PcSel, d.PcPlus1, d.AluRegOut, DataOut, d.Lr, d.Pc);
	$display("      |                     | Pc+1");
	assert(d.Pc == d.PcPlus1) else begin errors++; $display("ERROR: Pc, op0"); end
    #12 PcSel = 1;
													//CP(1150)[>1160]
    #90 $display("%d     | %h %h %h %h | %h", PcSel, d.PcPlus1, d.AluRegOut, DataOut, d.Lr, d.Pc);
	$display("      |                     | ALU");
	assert(d.Pc == d.AluRegOut) else begin errors++; $display("ERROR: Pc, op1"); end
    #10 PcSel = 2; 
													//CP(1250)[>1260]
    #90 $display("%d     | %h %h %h %h | %h", PcSel, d.PcPlus1, d.AluRegOut, DataOut, d.Lr, d.Pc);
	$display("      |                     | SysBus");
	assert(d.Pc == DataOut) else begin errors++; $display("ERROR: Pc, op2"); end
    #10 PcSel = 3; 
													//CP(1350)[>1360]
    #90 $display("%d     | %h %h %h %h | %h", PcSel, d.PcPlus1, d.AluRegOut, DataOut, d.Lr, d.Pc);
	$display("      |                     | LR");
	assert(d.Pc == d.Lr) else begin errors++; $display("ERROR: Pc, op3"); end
    #10 PcSel = 7; 
													//CP(1450)[>1460]
    #90 $display("%d     | %h %h %h %h | %h", PcSel, d.PcPlus1, d.AluRegOut, DataOut, d.Lr, d.Pc);
	$display("      |                     | const 0x0010");
	assert(d.Pc == 16'h0010) else begin errors++; $display("ERROR: Pc, op7"); end
    //Testing Write registers
	$display("===Writing GPRs Testing===");
	$display("WdSel | AluOut SysBus | WD     reg7");
    #10 RegWe = 1; PcWe = 0; 
	$display("%d     | %h   %h   | %h   %h", WdSel, d.AluOut, DataOut, d.WD, d.reg7);
	$display("      |               | AluOut");
	assert(d.WD == d.AluOut) else begin errors++; $display("ERROR: WD, op0"); end
													//CP(1550)[>1560]
    #90 $display("%d     | %h   %h   | %h   %h", WdSel, d.AluOut, DataOut, d.WD, d.reg7);
	$display("      |               |        AluOut");
	assert(d.reg7 == d.AluOut) else begin errors++; $display("ERROR: reg7, op0"); end
    #10 WdSel = 1; 
    #50 $display("%d     | %h   %h   | %h   %h", WdSel, d.AluOut, DataOut, d.WD, d.reg7);
	$display("      |               | SysBus");
	assert(d.WD == DataOut) else begin errors++; $display("ERROR: WD, op1"); end
													//CP(1650)[>1660]
    #150 $display("%d     | %h   %h   | %h   %h", WdSel, d.AluOut, DataOut, d.WD, d.reg7);
	$display("      |               |        SysBus");
	assert(d.reg7 == DataOut) else begin errors++; $display("ERROR: reg7, op1"); end
    //Testing AluOR
	$display("===ALU Override Testing===");
	$display("AluOR | OpCode Operand1 Operand2 | AluOut");
    #100 AluOR = 1; RegWe = 0; Op1Sel = 0; Op2Sel = 1;
    #110 $display("%d     | %b %d    %d     | %d", AluOR, Ir[15:11], d.Operand1, d.Operand2, d.AluOut);
	 $display("      |                          | func.");
	assert(d.AluOut == d.Operand1 + d.Operand2) else begin errors++; $display("ERROR: AluOut, op1"); end
    #10 AluOR = 2;
    #60 $display("%d     | %b %d    %d     | %d", AluOR, Ir[15:11], d.Operand1, d.Operand2, d.AluOut);
	$display("      |                          | op1 + op2 + 1");
	assert(d.AluOut == (d.Operand1 + d.Operand2 + 1)) else begin errors++; $display("ERROR: AluOut, op3"); end
    #10 AluOR = 3;
    #60 $display("%d     | %b %d    %d     | %d", AluOR, Ir[15:11], d.Operand1, d.Operand2, d.AluOut);
	$display("      |                          | op1 - op2 - 1");
	assert(d.AluOut == (d.Operand1 - d.Operand2 - 1)) else begin errors++; $display("ERROR: AluOut, op3"); end
    //Testing Status Register to SysBus
	$display("===Status Register Testing===");
	$display("AluEn SREn | AluOut SR   | DataOut");
    #10 AluEn = 1; StatusRegEn = 0;
    #40 $display("%b     %b    | %h   %h    | %h", AluEn, StatusRegEn, d.AluRegOut, StatusReg, DataOut);
	$display("           |             | ALU");
	assert(DataOut == d.AluRegOut) else begin errors++; $display("ERROR: SysBus, Alu not driving"); end
    #10 AluEn = 0; StatusRegEn = 1;
    #40 $display("%b     %b    | %h   %h    | %h", AluEn, StatusRegEn, d.AluRegOut, StatusReg, DataOut);
	$display("           |             | SR");
	assert(DataOut == StatusReg) else begin errors++; $display("ERROR: SysBus, SR not driving"); end

    #100 if(errors == 0)
		$display("ALL TESTS PASSED!");
	 else
		$display("%d TESTS FAILED!", errors);
	 $finish;
  end

//SIMVISION SCRIPT:datapath.tcl

endmodule
