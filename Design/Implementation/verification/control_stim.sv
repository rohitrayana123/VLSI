module control_stim;

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

parameter CLK_PERIOD = 500;


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
wire	[15:0] 				SysBus;
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



// Dead states
//always @(posedge Clock) begin
//	if((control.state == fetch) && (control.stateSub == cycle4)) fail;
//end


initial begin
	integer i;

         	nReset 	= 0;
   			Flags	= 0;
			nIRQ	= 1;
			nWait 	= 1;
			OpcodeCondIn = 0;
	#5470  	nReset 	= 1; 
   
	i = 0;
	DoFetch(1,OpcodeCondIn);
	@(posedge Clock);
	DoFetch(2,OpcodeCondIn);
   	@(posedge Clock);
	DoFetch(3,OpcodeCondIn);
	@(posedge Clock);
	DoFetch(4,OpcodeCondIn);
	@(posedge Clock);
	DoFetch(5,OpcodeCondIn);
	pass;
end

task DoFetch;
	input integer instruct;
	output logic [7:0] op;
	@(posedge Clock);
	//	if(	(control.state != fetch)	||
	//	 	(control.stateSub != cycle0)
	//		) fail;
    @(posedge Clock); // Cycle1 
//		if(	(control.state != fetch)	||
//		 	(control.stateSub != cycle1)
//			) fail;
    @(posedge Clock); // Cycle2 
//		if(	(control.state != fetch)	||
//		 	(control.stateSub != cycle2)
//			) fail;
    @(posedge Clock); // Cycle3 		
//		if(	(control.state != fetch)	||
//		 	(control.stateSub != cycle3)
//			) fail;
		// Opcode is now present
    op = Data_stored[instruct][15:8]; 
endtask


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
