module control_stim;

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

parameter CLK_PERIOD = 100;

opcodes::alu_functions_t 	AluOp;    
opcodes::Op2_select_t		Op2Sel;   
opcodes::Op1_select_t     Op1Sel;          
logic       					AluEn;         
logic       					LrEn;     
logic       					LrWe;
opcodes::Lr_select_t		LrSel;
opcodes::Rs1_select_t		Rs1Sel;
opcodes::Wd_select_t		WdSel;
ogic       					PcWe;     
opcodes::pc_select_t 		PcSel;    
logic       					PcEn;     
logic       					IrWe;     
logic       					WdSel;    
opcodes::Imm_select_t		ImmSel;   
logic       					RegWe;    
logic       					MemEn;
logic       					nWE;
logic       					nOE;
logic       					nME;
logic       					ENB;
logic       					ALE;
logic							CFlag;
logic							AleWe;
logic [7:0] 					OpcodeCondIn;
logic       					Clock;    
logic       					nReset;   

control control(
   .AluOp         	(AluOp      	),            
   .Op2Sel        	(Op2Sel     	),
   .Op1Sel        	(Op1Sel     	),
   .AluEn         	(AluEn      	),      
   .LrEn          	(LrEn       	),
   .LrWe          	(LrWe       	),
   .PcWe          	(PcWe       	),
   .PcSel         	(PcSel      	),
   .PcEn          	(PcEn       	),
   .IrWe          	(IrWe       	),
   .WdSel         	(WdSel      	),
   .ImmSel        	(ImmSel     	),
   .RegWe         	(RegWe      	),
   .MemEn         	(MemEn      	),
   .nWE           	(nWE        	),
   .nOE           	(nOE        	),
   .nME           	(nME        	),
   .ENB           	(ENB        	),
   .ALE           	(ALE        	),
   .CFlag			(CFlag),
   .LrSel			(LrSel),
   .Rs1Sel			(Rs1Sel),
   .AluWe			(AluWe),
   .OpcodeCondIn  	(OpcodeCondIn	),
   .Clock         	(Clock      	),
   .nReset        	(nReset     	)
);

initial                          Clock = 1;
always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end

logic [9:0] prog [7:0];

initial begin
	integer i;

   	prog[1] = ADD;
   	prog[2] = ADDI;
   	prog[3] = ADDIB;
   	prog[4] = ADC;
   	prog[5] = ADCI;


         	nReset = 0;
   	#500  	nReset = 1; 
   	for(i=0;i<20;i=i+1) begin
      	// Test fetch phase
      	@(posedge Clock) if(!((MemEn == 1)&&(ALE == 0))) fail;
      	@(posedge Clock) if(!((MemEn == 1)&&(ALE == 1)&&(nWE == 1)&&(nOE == 1))) fail;
      	@(posedge Clock) if(!((MemEn == 0)&&(ALE == 0)&&(nWE == 1)&&(nOE == 1))) fail;
      	@(posedge Clock) if(!((MemEn == 0)&&(ALE == 0)&&(nWE == 1)&&(nOE == 0))) fail;
      	@(posedge Clock) if(!(IrWe == 1)) fail;
   
      	// Opcode is now present
      	Opcode = prog[i];

      	// Test Execute phase
      	@(posedge Clock);
   
   	end
   	$stop;
end

task fail;
   $display();
   $display("  !!!!!!!!!!!!!!!!!!!!!!!!");
   $display("  !!!      FAIL        !!!");
   $display("  !!!!!!!!!!!!!!!!!!!!!!!!");
   $stop;
endtask
endmodule
