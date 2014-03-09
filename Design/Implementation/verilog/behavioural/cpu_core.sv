// Written by ajr2g10
module cpu_core(
  output wire  [15:0]   Data_out,
  output wire           nOE,
  output wire           nME,
  output wire           ALE,
  output wire           ENB, 
  output wire           SDO,
  input  wire  [15:0]   Data_in,
`ifndef nointerrupt
  input  wire           nIRQ, 
`endif
  input  wire           nWait,
  input  wire           Test, 
  input  wire           SDI, 
  input  wire           Clock, 
  input  wire           nReset,
  output wire 		RnW
);

timeunit 1ns; timeprecision 100ps;

opcodes::alu_functions_t  AluOp;  
wire [1:0]  Op1Sel;  
wire        Op2Sel;  
wire        AluEn;  
wire        LrEn;  
wire        LrWe; 
wire        LrSel;
wire        PcWe;  
wire [2:0]  PcSel;  
wire        PcEn;  
wire        IrWe;
wire        WdSel;  
wire        ImmSel;  
wire        RegWe; 
wire        MemEn;
wire [1:0]  Rs1Sel;
wire        CFlag;
wire [3:0]  Flags;
wire [7:0]  Opcode;  
wire        AluWe;
wire[1:0]	RwSel;
assign SDO = SDI; // No sim 

control control ( 
   .AluOp      (AluOp      ),    // Ouputs  
   .Op2Sel     (Op2Sel     ), 
   .Op1Sel     (Op1Sel     ),
   .AluEn      (AluEn      ),
   .LrEn       (LrEn       ),
   .LrWe       (LrWe       ),
   .LrSel      (LrSel      ),
   .PcWe       (PcWe       ), 
   .PcEn       (PcEn       ),
   .IrWe       (IrWe       ),
   .WdSel      (WdSel      ),
   .ImmSel     (ImmSel     ),
   .RegWe      (RegWe      ),
   .PcSel      (PcSel      ),
   .MemEn      (MemEn      ),
   .nWE        (RnW        ),//HSL: RnW - Read not Write - the signal to memory
   .nOE        (nOE        ),
   .nME        (nME        ),
   .ENB        (ENB        ),
   .ALE        (ALE        ),
   .Rs1Sel     (Rs1Sel     ),
   .RwSel		(RwSel),
   .CFlag      (CFlag      ),
   .Flags      (Flags      ),
   .OpcodeCondIn(Opcode     ),    // Inputs
	.SysBusOut		(SysBus),	// AJR - This should be an inout?
	.SysBusIn	(SysBus),		
`ifndef nowait
  	.nWait		(nWait),
`endif
   .AluWe      (AluWe      ),
   .Clock      (Clock      ),
   .nReset     (nReset     )
`ifndef nointerrupt 
,   .nIRQ	(nIRQ	)
`endif
);

datapath datapath ( 
   .SysBus     (Data_out    ),   // Output
   .Opcode     (Opcode     ),
   .Flags      (Flags      ),  
   .DataIn     (Data_in     ),
   .AluOp      (AluOp      ),   // Inputs 
   .PcSel      (PcSel      ),
   .Op1Sel     (Op1Sel     ),
   .Op2Sel     (Op2Sel     ),
   .AluEn      (AluEn      ),
   .LrEn       (LrEn       ),
   .LrWe       (LrWe       ),
   .LrSel      (LrSel      ),
   .PcWe       (PcWe       ),
   .PcEn       (PcEn       ),
   .IrWe       (IrWe       ),
   .WdSel      (WdSel      ),
   .ImmSel     (ImmSel     ),
   .RegWe      (RegWe      ),
   .MemEn      (MemEn      ),
   .Rs1Sel     (Rs1Sel     ),
   .RwSel		(RwSel),
   .CFlag      (CFlag      ),
   .AluWe      (AluWe      ),
   .Clock      (Clock      ),
   .nReset     (nReset     )
);


endmodule
