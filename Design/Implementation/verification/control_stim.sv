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


initial begin
	#1ns
	$readmemh(`prog_file,Data_stored);		
end

task ResetFetch;
	input logic [4:0] op;
	@(posedge Clock);	
	@(posedge Clock);	
	@(posedge Clock);	
	while(nWait == 0)		// Slow memory
		@(posedge Clock);	
	OpcodeCondIn[7:3] = op;
	@(posedge Clock);	
endtask

task DoFetch;
	input logic [4:0] op;
	@(posedge Clock);
	ResetFetch(op);	
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
  	
	// Standard operation
	ResetFetch(ADD);
	#CLK_PERIOD
	DoFetch(ADDI);	
	#CLK_PERIOD
	DoFetch(ADDIB);	
	#CLK_PERIOD
	DoFetch(ADC);	
	#CLK_PERIOD	
	DoFetch(NEG);	
	#CLK_PERIOD
	DoFetch(SUB);	
	#CLK_PERIOD
	DoFetch(SUBI);	
	#CLK_PERIOD
	DoFetch(SUBIB);	
	#CLK_PERIOD
	DoFetch(SUC);	
	#CLK_PERIOD	
	DoFetch(SUCI);
	#CLK_PERIOD
	DoFetch(CMP);	
	#CLK_PERIOD
	DoFetch(CMPI);	
	#CLK_PERIOD
	DoFetch(AND);	
	#CLK_PERIOD
	DoFetch(OR);	
	#CLK_PERIOD
	DoFetch(XOR);	
	#CLK_PERIOD
	DoFetch(NOT);	
	#CLK_PERIOD
	DoFetch(NAND);	
	#CLK_PERIOD
	DoFetch(NOR);	
	#CLK_PERIOD
	DoFetch(LSL);	
	#CLK_PERIOD
	DoFetch(LSR);	
	#CLK_PERIOD
	DoFetch(ASR);	
	#CLK_PERIOD
	DoFetch(LDW);	
	#CLK_PERIOD
	DoFetch(STW);	
	#CLK_PERIOD
	DoFetch(LUI);	
	#CLK_PERIOD
	DoFetch(LLI);	
	#CLK_PERIOD
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
