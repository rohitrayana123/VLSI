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
    													//CP(50)
    #100 nReset = 1;
    													//CP(150)
    //Testing mux outputs with direct connection to IR register
    #100 DataIn = 16'b1010110000000001; //LLI R0, #1
	 MemEn = 1; IrWe = 1;
													//CP(250)[>260]
    #60 assert(DataOut == DataIn) else begin errors++; $display("ERROR: SysBus incorrect"); end		
	assert(Ir == DataIn) else begin errors++; $display("ERROR: IR incorrect"); end
	assert(DataOut == DataIn) else begin errors++; $display("ERROR: SysBus incorrect"); end
    #50 assert(d.Rs1 == Ir[10:8]) else begin errors++; $display("ERROR: Rs1, op0"); end
	assert(d.Rs2 == Ir[4:2]) else begin errors++; $display("ERROR: Rs2, op0"); end
	assert(d.Rw == Ir[7:5]) else begin errors++; $display("ERROR: Rw, op0"); end
	assert(d.ImmProbe == { {8{Ir[7]}}, Ir[7:0]}) else begin errors++; $display("ERROR: Imm, op0"); end
    #50 Rs1Sel = 2'd1; RwSel = 2'd1; ImmSel = 2'd1;
    #50 assert(d.Rs1 == Ir[7:5]) else begin errors++; $display("ERROR: Rs1, op1"); end
	assert(d.Rs2 == Ir[4:2]) else begin errors++; $display("ERROR: Rs2, op1"); end
	assert(d.Rw == Ir[10:8]) else begin errors++; $display("ERROR: Rw, op1"); end
	assert(d.ImmProbe == { {11{Ir[4]}}, Ir[4:0]}) else begin errors++; $display("ERROR: Imm, op1"); end
    #50 Rs1Sel = 2'd2; RwSel = 2'd2;
    #50 assert(d.Rs1 == 3'b111) else begin errors++; $display("ERROR: Rs1, op2"); end
	assert(d.Rs2 == Ir[4:2]) else begin errors++; $display("ERROR: Rs2, op2"); end
	assert(d.Rw == 3'b111) else begin errors++; $display("ERROR: Rw, op2"); end
    //Testing operand select muxes
													//CP(550)[>560]
    #50 assert(d.Rd1 == 0) else begin errors++; $display("ERROR: Rd1, default val"); end			
	assert(d.Rd2 == 0) else begin errors++; $display("ERROR: Rd2, default val"); end
	assert(d.Operand1 == d.Rd1) else begin errors++; $display("ERROR: Operand1, op0"); end
	assert(d.Operand2 == d.ImmProbe) else begin errors++; $display("ERROR: Operand2, op0"); end
    #10 Op1Sel = 1; Op2Sel = 1;
    #50 assert(d.Operand1 == d.Pc) else begin errors++; $display("ERROR: Operand1, op1"); end
	assert(d.Operand2 == d.Rd2) else begin errors++; $display("ERROR: Operand2, op1"); end
    #10 Op2Sel = 2;
    #50 assert(d.Operand2 == 3'b000) else begin errors++; $display("ERRORS: Operand2, op2"); end
    //Testing ALU Basic operation
    #10 Op1Sel = 0; Op2Sel = 0; ImmSel = 0; AluWe = 1;
    #40 assert(d.AluOut == { 8'b0, d.ImmProbe[7:0] }) else begin errors++; $display("ERROR: AluOut, LLI, Imm"); end
													//CP(750)[>760]
    #30 assert(d.AluRegOut == d.AluOut) else begin errors++; $display("ERROR: AluRegOut"); end
    //Testing Link Register
    #10 MemEn = 0; AluEn = 1; IrWe = 0; LrWe = 1; 
													//CP(850)[>860]
    #90 assert(d.Lr == d.AluRegOut) else begin errors++; $display("ERROR: Lr, op0"); end
    #10 LrSel = 1;
													//CP(950)[>960]
    #90 assert(d.Lr == d.PcPlus1) else begin errors++; $display("ERROR: Lr, op1"); end
    //Testing Program Counter
    #10 LrWe = 0; PcWe = 1;
													//CP(1050)[>1060]
    #88 assert(d.Pc == d.PcPlus1) else begin errors++; $display("ERROR: Pc, op0"); end
    #12 PcSel = 1;
													//CP(1150)[>1160]
    #90 assert(d.Pc == d.AluRegOut) else begin errors++; $display("ERROR: Pc, op1"); end
    #10 PcSel = 2; 
													//CP(1250)[>1260]
    #90 assert(d.Pc == d.AluRegOut) else begin errors++; $display("ERROR: Pc, op2"); end
    #10 PcSel = 3; 
													//CP(1350)[>1360]
    #90 assert(d.Pc == d.Lr) else begin errors++; $display("ERROR: Pc, op3"); end
    #10 PcSel = 7; 
													//CP(1450)[>1460]
    #90 assert(d.Pc == 16'h0010) else begin errors++; $display("ERROR: Pc, op7"); end
    //Testing Write registers
    #10 RegWe = 1; PcWe = 0; 
	assert(d.WD == d.AluOut) else begin errors++; $display("ERROR: WD, op0"); end
													//CP(1550)[>1560]
    #90 assert(d.reg7 == d.AluOut) else begin errors++; $display("ERROR: reg7, op0"); end
    #10 WdSel = 1; 
    #50 assert(d.WD == DataOut) else begin errors++; $display("ERROR: WD, op1"); end
													//CP(1650)[>1660]
    #40 assert(d.reg7 == DataOut) else begin errors++; $display("ERROR: reg7, op1"); end
    //Testing AluOR
    #10 AluOR = 2; RegWe = 0; Op1Sel = 0; Op2Sel = 1;
    #110 assert(d.AluOut == (d.Operand1 + d.Operand2 + 1)) else begin errors++; $display("ERROR: AluOut, op1"); end
    #10 AluOR = 3;
    #60 assert(d.AluOut == (d.Operand1 - d.Operand2 - 1)) else begin errors++; $display("ERROR: AluOut, op3"); end
    //Testing Status Register to SysBus
    #10 StatusReg = 4'd5;
    #40 assert(DataOut == d.AluRegOut) else begin errors++; $display("ERROR: SysBus, Alu not driving"); end
    #10 AluEn = 0; StatusRegEn = 1;
    #40 assert(DataOut == StatusReg) else begin errors++; $display("ERROR: SysBus, SR not driving"); end

    #100 if(errors == 0)
		$display("ALL TESTS PASSED!");
	 else
		$display("%d TESTS FAILED!", errors);
	 $finish;
  end

//SIMVISION SCRIPT:datapath.tcl

endmodule
