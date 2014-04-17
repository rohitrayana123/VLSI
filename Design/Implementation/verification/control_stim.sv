module control_stim;

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

parameter CLK_PERIOD = 500;
parameter NUM_INSTRUCTIONS = 30;

logic                     	ALE;
logic                     	AluEn;
logic                     	AluWe; 
opcodes::AluOR_select_t		AluOR;
logic                     	CFlag;
logic                     	ENB;
opcodes::Imm_select_t		ImmSel;
logic                     	IrWe;
logic                     	LrEn;
opcodes::Lr_select_t      	LrSel;
logic                     	LrWe;
logic                     	MemEn;   
logic                     	nME;     
logic                     	nOE;
logic                     	nWE;	
opcodes::Op1_select_t     	Op1Sel;
opcodes::Op2_select_t     	Op2Sel; 		
logic                     	PcEn;
opcodes::pc_select_t      	PcSel;
logic                     	PcWe;
logic                     	RegWe;
opcodes::Rs1_select_t     	Rs1Sel;
opcodes::Rw_select_t		RwSel;
opcodes::Wd_select_t      	WdSel;
logic	[3:0]				StatusReg;
logic						StatusRegEn;
logic	[3:0] 				SysBus;
logic	                  	Clock;
logic	[3:0]             	Flags;
logic						nIRQ;
logic	                  	nReset;
logic						nWait;
logic	[7:0]             	OpcodeCondIn;  	


control control(
   .ALE				(ALE			),            		
   .AluEn          	(AluEn         	),
   .AluWe          	(AluWe         	),
   .AluOR          	(AluOR         	),      
   .CFlag          	(CFlag         	),
   .ENB            	(ENB           	),
   .ImmSel         	(ImmSel        	),
   .IrWe           	(IrWe          	),
   .LrEn           	(LrEn          	),
   .LrSel          	(LrSel         	),
   .LrWe           	(LrWe          	),
   .MemEn          	(MemEn         	),
   .nME            	(nME           	),
   .nOE            	(nOE           	),
   .nWE	        	(nWE	        ),
   .Op1Sel         	(Op1Sel       	),
   .Op2Sel 			(Op2Sel 		),
   .PcEn           	(PcEn          	),
   .PcSel	        (PcSel	      	),
   .PcWe           	(PcWe          	),
   .RegWe          	(RegWe         	),
   .Rs1Sel         	(Rs1Sel        	),
   .RwSel          	(RwSel         	),
   .WdSel          	(WdSel         	),
   .StatusReg		(StatusReg		),
   .StatusRegEn		(StatusRegEn	),
   .SysBus         	(SysBus        	),
   .Clock          	(Clock         	),
   .Flags			(Flags		  	),
   .nIRQ           	(nIRQ          	),
   .nReset         	(nReset        	),
   .nWait          	(nWait         	),
   .OpcodeCondIn   	(OpcodeCondIn  	)
);

// Clock gen
initial                          Clock = 1;
always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end

// Test signals
logic [15:0] Data_stored [0:2047];
Opcode_t Opcode;

assign Opcode = Opcode_t'(OpcodeCondIn[7:3]);

// Use input to infer state
state_t state;
stateSub_t stateSub;

always@(negedge nReset)	begin
	state = fetch;
	stateSub = cycle0;
end

initial begin
	#1ns
	$readmemh(`prog_file,Data_stored);		
end


// More for gate level but check always something
always@(posedge Clock) begin
	if(
		(ALE 				== 1'bX) ||
		(AluEn 				== 1'bX) ||	 
		(AluOR[0] 			== 1'bX) || 
		(AluOR[1] 			== 1'bX) || 
		(CFlag 				== 1'bX) || 
		(ENB				== 1'bX) || 
		(ImmSel				== 1'bX) || 
		(IrWe				== 1'bX) || 
		(LrEn				== 1'bX) || 
		(LrWe				== 1'bX) || 
		(MemEn				== 1'bX) ||
		(Op1Sel				== 1'bX) ||			
		(Op2Sel[0]			== 1'bX) ||			
		(Op2Sel[1]			== 1'bX) ||
		(PcEn				== 1'bX) ||
		(PcSel				== 1'bX) ||
		(PcWe				== 1'bX) ||
		(RegWe				== 1'bX) ||
		(Rs1Sel[0]			== 1'bX) ||
		(Rs1Sel[1]			== 1'bX) ||
		(RwSel[0]			== 1'bX) ||
		(RwSel[1]			== 1'bX) ||
		(StatusReg[0]		== 1'bX) ||
		(StatusReg[1]		== 1'bX) ||
		(StatusReg[2]		== 1'bX) ||
		(StatusReg[3]		== 1'bX) ||
		(StatusRegEn		== 1'bX) ||
		(WdSel				== 1'bX) ||
		(nME				== 1'bX) ||
		(nOE				== 1'bX) ||
		(nWE				== 1'bX) ) 
	begin
		$display("ERROR: Unkown output on rising clock edge");
		fail;
	end
end

task SyncOutput;
	input logic                     	test_ALE;
	input logic                     	test_AluEn;
	input logic                     	test_AluWe; 
	input opcodes::AluOR_select_t		test_AluOR;
	input logic                     	test_ENB;
	input opcodes::Imm_select_t			test_ImmSel;
	input logic                     	test_IrWe;
	input logic                     	test_LrEn;
	input opcodes::Lr_select_t      	test_LrSel;
	input logic                     	test_LrWe;
	input logic                     	test_MemEn;   
	input logic                     	test_nME;     
	input logic                     	test_nOE;
	input logic                     	test_nWE;	
	input opcodes::Op1_select_t     	test_Op1Sel;
	input opcodes::Op2_select_t     	test_Op2Sel; 		
	input logic                     	test_PcEn;
	input opcodes::pc_select_t      	test_PcSel;
	input logic                     	test_PcWe;
	input logic                     	test_RegWe;
	input opcodes::Rs1_select_t     	test_Rs1Sel;
	input opcodes::Rw_select_t			test_RwSel;
	input opcodes::Wd_select_t      	test_WdSel;	
	input logic							test_StatusRegEn;
	if(ALE 	!= test_ALE) begin
		$display("ERROR: ALE");
		fail;
	end
	if(AluEn != test_AluEn) begin
		$display("ERROR: AluEn");
		fail;
	end
	if(AluWe != test_AluWe) begin
		$display("ERROR: AluWe");
		fail;
	end
	if(AluOR != test_AluOR) begin
		$display("ERROR: AluOR");
		fail;
	end
	if(ENB != test_ENB) begin
		$display("ERROR: ENB");
		fail;
	end
	if(ImmSel != test_ImmSel) begin
		$display("ERROR: ImmSel");
		fail;
	end
	if(IrWe != test_IrWe) begin
		$display("ERROR: IrWe");
		fail;
	end
	if(LrEn != test_LrEn) begin
		$display("ERROR: LrEn");
		fail;
	end
	if(LrWe != test_LrWe) begin
		$display("ERROR: LrWe");
		fail;
	end
	if(MemEn != test_MemEn) begin
		$display("ERROR: MemEn");
		fail;
	end
	if(Op1Sel != test_Op1Sel) begin
		$display("ERROR: Op1Sel");
		fail;
	end
	if(Op2Sel != test_Op2Sel) begin
		$display("ERROR: Op2Sel");
		fail;
	end
	if(PcEn != test_PcEn) begin
		$display("ERROR: PcEn");
		fail;
	end
	if(PcSel != test_PcSel) begin
		$display("ERROR: PcSel");
		fail;
	end
	if(PcWe != test_PcWe) begin
		$display("ERROR: PcWe");
		fail;
	end
	if(RegWe != test_RegWe) begin
		$display("ERROR: RegWe");
		fail;
	end
	if(Rs1Sel != test_Rs1Sel) begin
		$display("ERROR: Rs1Sel");
		fail;
	end
	if(RwSel != test_RwSel) begin
		$display("ERROR: RwSel");
		fail;
	end
	if(StatusRegEn != test_StatusRegEn) begin
		$display("ERROR: StatusRegEn");
		fail;
	end
	if(WdSel != test_WdSel) begin
		$display("ERROR: WdSel");
		fail;
	end
	if(nME != test_nME) begin
		$display("ERROR: nME");
		fail;
	end
	if(nOE != test_nOE) begin
		$display("ERROR: nOE");
		fail;
	end
	if(nWE != test_nWE) begin
		$display("ERROR: nWE");
		fail;
	end
endtask


task DoFetch;
	input logic [4:0] op;
	@(posedge Clock);	
	stateSub = cycle1;	
	@(posedge Clock);
	stateSub = cycle2;
	@(posedge Clock);
	stateSub = cycle3;
	while(nWait == 0)		// Slow memory
		@(posedge Clock);	
	OpcodeCondIn[7:3] = op;
	@(posedge Clock);
	state = execute;
	stateSub = cycle4;
endtask



initial begin
	integer i;
         	nReset 	= 0;
   			Flags	= 0;
			nIRQ	= 1;
			nWait 	= 1;
			OpcodeCondIn = 0;
			SysBus = 0;
	#5000  	nReset 	= 1;  
  	
	
	DoFetch(ADD);
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("ADD - OK");
	
	
	DoFetch(ADDI);		
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("ADDI - OK");


	DoFetch(ADDIB);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Rd,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("ADDIB - OK");


	DoFetch(ADC);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);	
	state = fetch;
	stateSub = cycle0;
	$display("ADC - OK");


	DoFetch(ADCI);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("ADCI - OK");
	
	
	DoFetch(NEG);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("NEG - OK");


	DoFetch(SUB);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;

	$display("SUB - OK");


	DoFetch(SUBI);		
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("SUBI - OK");


	DoFetch(SUBIB);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Rd,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("SUBIB - OK");


	DoFetch(SUC);	
	@(posedge Clock);	
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("SUC - OK");


	DoFetch(SUCI);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("SUCI - OK");


	DoFetch(CMP);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,0,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("CMP - OK");


	DoFetch(CMPI);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,0,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("CMPI - OK");


	DoFetch(AND);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("AND - OK");


	DoFetch(OR);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("OR - OK");


	DoFetch(XOR);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("XOR - OK");


	DoFetch(NOT);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("NOT - OK");


	DoFetch(NAND);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("NAND - OK");


	DoFetch(NOR);		
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Rd2,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("NOR - OK");


	DoFetch(LSL);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("LSL - OK");


	DoFetch(LSR);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("LSR - OK");


	DoFetch(ASR);	
	@(posedge Clock);
	SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("ASR - OK");


	DoFetch(LDW);	
	@(posedge Clock);
	$display("	LDW - 0");
	SyncOutput(0,1,1,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,0,Pc1,0,0,Rs1Ra,RwRd,WdAlu,0);	
	stateSub = cycle0;
	@(posedge Clock);
	$display("	LDW - 1");
	SyncOutput(1,1,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,1,1,Op1Rd1,Op2Imm,0,Pc1,0,0,Rs1Ra,RwRd,WdAlu,0);
	stateSub = cycle1;
	@(posedge Clock);
	$display("	LDW - 2");
	SyncOutput(0,1,1,nOR,0,ImmLong,0,0,LrSys,0,0,0,1,1,Op1Rd1,Op2zero,0,Pc1,0,0,Rs1Rd,RwRd,WdAlu,0);
	stateSub = cycle2;	
	@(posedge Clock);
	$display("	LDW - 3");
	SyncOutput(0,0,0,nOR,1,ImmLong,0,0,LrSys,0,1,0,0,1,Op1Rd1,Op2Imm,0,Pc1,1,1,Rs1Ra,RwRd,WdSys,0);
	stateSub = cycle3;
	@(posedge Clock);
	$display("	LDW - 4");
	SyncOutput(0,0,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,1,Op1Rd1,Op2Imm,1,Pc1,0,0,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("LDW - OK");


	DoFetch(STW);		
	@(posedge Clock);
	$display("	STW - 0");
	SyncOutput(0,1,1,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,0,Pc1,0,0,Rs1Ra,RwRd,WdAlu,0);	
	stateSub = cycle0;
	@(posedge Clock);
	$display("	STW - 1");
	SyncOutput(1,1,10,nOR,0,ImmShort,0,0,LrSys,0,0,1,1,1,Op1Rd1,Op2Imm,0,Pc1,0,0,Rs1Ra,RwRd,WdAlu,0);
	stateSub = cycle1;
	@(posedge Clock);
	$display("	STW - 2");
	SyncOutput(0,1,1,nOR,0,ImmLong,0,0,LrSys,0,0,0,1,1,Op1Rd1,Op2zero,0,Pc1,0,0,Rs1Rd,RwRd,WdAlu,0);
	stateSub = cycle2;	
	@(posedge Clock);
	$display("	STW - 3");
	SyncOutput(0,1,0,nOR,0,ImmLong,0,0,LrSys,0,0,0,1,0,Op1Rd1,Op2zero,0,Pc1,1,0,Rs1Ra,RwRd,WdAlu,0);
	stateSub = cycle3;
	@(posedge Clock);
	$display("	LDW - 4");
	SyncOutput(0,1,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,1,0,Op1Rd1,Op2zero,0,Pc1,0,0,Rs1Ra,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;	
	$display("STW - OK");
	

	DoFetch(LUI);		
	@(posedge Clock);
	SyncOutput(0,1,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,0,Pc1,1,1,Rs1Rd,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("LUI - OK");


	DoFetch(LLI);		
	@(posedge Clock);
	SyncOutput(0,1,0,nOR,0,ImmLong,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,0,Pc1,1,1,Rs1Rd,RwRd,WdAlu,0);
	state = fetch;
	stateSub = cycle0;
	$display("LLI - OK");

	pass;
end

task fail;
   $display();
   $display("  !!!!!!!!!!!!!!!!!!!!!!!!");
   $display("  !!!      FAIL        !!!");
   $display("  !!!!!!!!!!!!!!!!!!!!!!!!");
   $stop;
endtask

task pass;
   $display();
   $display("  ***********************");
   $display("  **       PASS        **");
   $display("  ***********************");
   $stop;
endtask
endmodule
