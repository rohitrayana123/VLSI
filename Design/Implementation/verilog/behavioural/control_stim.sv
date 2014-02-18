module control_stim;

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

parameter CLK_PERIOD = 100;

logic       Ale;
logic       Enb;
logic [3:0] AluOp;    
logic [1:0] Op2Sel;   
logic       Op1Sel;   
logic       Rw;       
logic       AluEn;    
logic       SpEn;     
logic       SpWe;     
logic       LrEn;     
logic       LrWe;     
logic       PcWe;     
logic [1:0] PcSel;    
logic       PcEn;     
logic       IrWe;     
logic       WdSel;    
logic       ImmSel;   
logic       RegWe;    
logic       MemEn;    
logic [7:0] OpCode;
logic       Z;        
logic       Clock;    
logic       nReset;   

control control(
   .Ale           (Ale        ),
   .Enb           (Enb        ),
   .AluOp         (AluOp      ),            
   .Op2Sel        (Op2Sel     ),
   .Op1Sel        (Op1Sel     ),
   .Rw            (Rw         ),
   .AluEn         (AluEn      ),      
   .SpEn          (SpEn       ), 
   .SpWe          (SpWe       ),
   .LrEn          (LrEn       ),
   .LrWe          (LrWe       ),
   .PcWe          (PcWe       ),
   .PcSel         (PcSel      ),
   .PcEn          (PcEn       ),
   .IrWe          (IrWe       ),
   .WdSel         (WdSel      ),
   .ImmSel        (ImmSel     ),
   .RegWe         (RegWe      ),
   .MemEn         (MemEn      ),
   .OpCode        (OpCode     ),
   .Z             (Z          ),
   .Clock         (Clock      ),
   .nReset        (nReset     )
);

always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end

initial begin
         nReset = 0;
   #500  nReset = 1;
   
   #1000    OpCode = NOP;
   #1000    OpCode = ADD;
   #1000    OpCode = NOP;
end
endmodule
