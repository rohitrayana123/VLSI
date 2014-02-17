module cpu_core(
  output wire  [15:0]   DataOut,
  output wire           Enb,
  output wire           nMe, 
  output wire           Ale, 
  output wire           RnW, 
  output wire           nOe, 
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
wire        IrEn;
wire        IrWe;
wire        WdSel;  
wire        ImmSel;  
wire        RegWe; 
wire        MemEn;
wire [7:0]  IrControl;  
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
   .PcSel      (PcSel      ),
   .PcEn       (PcEn       ),
   .IrEn       (IrEn       ),
   .IrWe       (IrWe       ),
   .WdSel      (WdSel      ),
   .ImmSel     (ImmSel     ),
   .RegWe      (RegWe      ),
   .MemEn      (MemEn      ),
   .IrControl  (IrControl  ),    // Inputs
   .Z          (Z          ),
   .Clock      (nReset     ),
   .nReset     (Clock      )
);

datapath datapath ( 
   .SysBus     (DataOut    ),   // Output
   .IrControl  (IrControl  ),
   .Z          (Z          ),  
   .DataIn     (DataIn     ),
   .AluOp      (AluOp      ),   // Inputs 
   .Op2Sel     (Op2Sel     ),
   .Op1Sel     (Op1Sel     ),
   .Rw         (Rw         ),
   .AluEn      (AluEn      ),
   .SpEn       (SpEn       ),
   .SpWe       (SpWe       ),
   .LrEn       (LrEn       ),
   .LrWe       (LrWe       ),
   .PcWe       (PcWe       ),
   .PcSel      (PcSel      ),
   .PcEn       (PcEn       ),
   .IrEn       (IrEn       ),
   .IrWe       (IrWe       ),
   .WdSel      (WdSel      ),
   .ImmSel     (ImmSel     ),
   .RegWe      (RegWe      ),
   .MemEn      (MemEn      ),
   .Clock      (Clock      ),
   .nReset     (nReset     )
);


endmodule
