module cpu_core(
  output wire  [15:0]   DataOut,
  output wire           nOE,
  output wire           nME,
  output wire           ALE,
  output wire           ENB, 
  output wire           SDO,
  input  wire  [15:0]   DataIn,
  input  wire           nIrq, 
  input  wire           nWait,
  input  wire           Test, 
  input  wire           SDI, 
  input  wire           Clock, 
  input  wire           nReset
);

timeunit 1ns; timeprecision 100ps;

wire [4:0]  AluOp;  
wire [1:0]  Op2Sel;  
wire        Op1Sel;  
wire        Rw;  
wire        AluEn;  
wire        SpEn;  
wire        SpWe;  
wire        LrEn;  
wire        LrWe;  
wire        PcWe;  
wire [1:0]  PcSel;  
wire        PcEn;  
wire        IrWe;
wire        WdSel;  
wire        ImmSel;  
wire        RegWe; 
wire        MemEn;
wire [7:0]  Opcode;  
wire        Z;  


assign SDO = SDI; // No sim 

control control ( 
   .AluOp      (AluOp      ),    // Ouputs  
   .Op2Sel     (Op2Sel     ), 
   .Op1Sel     (Op1Sel     ), 
   .Rw         (Rw         ),
   .AluEn      (AluEn      ),
   .SpEn       (SpEn       ),
   .SpWe       (SpWe       ),      
   .LrEn       (LrEn       ),
   .LrWe       (LrWe       ),
   .PcWe       (PcWe       ), 
   .PcEn       (PcEn       ),
   .IrWe       (IrWe       ),
   .WdSel      (WdSel      ),
   .ImmSel     (ImmSel     ),
   .RegWe      (RegWe      ),
   .PcSel      (PcSel      ),
   .MemEn      (MemEn      ),
   .nWE        (nWE        ),
   .nOE        (nOE        ),
   .nME        (nME        ),
   .ENB        (ENB        ),
   .ALE        (ALE        ),
   .Opcode     (Opcode     ),    // Inputs
   .Z          (Z          ),
   .Clock      (nReset     ),
   .nReset     (Clock      )
);

datapath datapath ( 
   .SysBus     (DataOut    ),   // Output
   .Opcode     (Opcode     ),
   .Flags      (Flags      ),  
   .DataIn     (DataIn     ),
   .AluOp      (AluOp      ),   // Inputs 
   .PcSel      (PcSel      ),
   .Op1Sel     (Op1Sel     ),
   .Rw         (Rw         ),
   .AluEn      (AluEn      ),
   .SpEn       (SpEn       ),
   .SpWe       (SpWe       ),
   .LrEn       (LrEn       ),
   .LrWe       (LrWe       ),
   .PcWe       (PcWe       ),
   .PcEn       (PcEn       ),
   .IrWe       (IrWe       ),
   .WdSel      (WdSel      ),
   .ImmSel     (ImmSel     ),
   .RegWe      (RegWe      ),
   .MemEn      (MemEn      ),
   .Clock      (Clock      ),
   .nReset     (nReset     )
);


endmodule
