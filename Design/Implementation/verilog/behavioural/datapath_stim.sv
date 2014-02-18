module datapath_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;

wire  [15:0]   SysBus, DataIn;     
wire  [7:0]    Opcode;     
wire           Z;      
logic [4:0]    AluOp;
logic [1:0]    Op2Sel;
logic          Op1Sel;
logic          Rw;
logic          WdSel;
logic          AluEn;
logic          SpEn;
logic          SpWe;
logic          LrEn;
logic          LrWe;
logic          PcWe;
logic [1:0]    PcSel;
logic          PcEn;
logic          IrWe;
logic          ImmSel;    
logic          RegWe;
logic          Clock;      
logic          nReset;     
logic 	       MemEn;
datapath dp(                                           
   .SysBus        (SysBus  ),    // Outputs from DUT
   .Opcode        (Opcode  ),
   .Z             (Z       ),
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


endmodule
