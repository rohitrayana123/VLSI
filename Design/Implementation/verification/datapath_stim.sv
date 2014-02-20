module datapath_stim;

timeunit 1ns; timeprecision 10ps;
import opcodes::*;
parameter CLK_PERIOD = 100;

wire  [15:0]   SysBus, DataIn;     
wire  [7:0]    Opcode;     
wire  [3:0]    Flags;  
logic [4:0]    AluOp;
logic [1:0]    Op2Sel;
pc_select_t PcSel;
logic Op1Sel, Rw, WdSel, AluEn, SpEn, SpWe, LrEn, LrWe, PcWe, PcEn, IrWe, ImmSel, RegWe, Clock, nReset, MemEn;
datapath dp(                                           
   .SysBus        (SysBus  ),    // Outputs from DUT
   .Opcode        (Opcode  ),
   .Flags         (Flags   ),
   .AluOp         (AluOp   ),    // Inputs to DUT
   .Op2Sel        (Op2Sel  ),
   .Op1Sel        (Op1Sel  ),
   .Rw            (Rw      ),
   .WdSel         (WdSel   ),
   .AluEn         (AluEn   ),
   .SpEn          (SpEn    ),
   .SpWe          (SpWe    ),
   .LrEn          (LrEn    ),
   .LrWe          (LrWe    ),
   .PcWe          (PcWe    ),
   .PcSel         (PcSel   ),
   .PcEn          (PcEn    ),
   .IrWe          (IrWe    ),
   .ImmSel        (ImmSel  ),
   .RegWe         (RegWe   ),
   .Clock         (Clock   ),
   .nReset        (nReset  ),
   .DataIn	  (DataIn  ),
   .MemEn	  (MemEn   )
);

always begin   #(CLK_PERIOD/2) Clock = 0;
               #(CLK_PERIOD/2) Clock = 1;         
end

initial 
begin
	nReset = 1;
	#CLK_PERIOD nReset = 0;
	#CLK_PERIOD nReset = 1;
end

//test routine
initial
begin
//	DataIn = 0;
	AluOp  = 0;
	Op2Sel = 0; 
	PcSel  = 0;
	Op1Sel = 0; 
	Rw     = 0; 
	AluEn  = 0; 
	SpEn   = 0; 
	SpWe   = 0; 
	LrEn   = 0;  
	LrWe   = 0;  
	PcWe   = 0; 
	PcEn   = 0;
	IrWe   = 0; 
	WdSel  = 0; 
	ImmSel = 0; 
	RegWe  = 0; 
	MemEn  = 0; 
	#1000 $stop();
end
endmodule
