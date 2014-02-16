module datapath(
  output wire  [15:0]   SysBus,
  output logic [3:0]    Opcode,
  output logic          Zflag,
  input        [15:0]   Data_in,
  input        [1:0]    Op2Sel,
  input                 Op1Sel,
  input                 Rw,
  input                 Clock,
  input                 nReset,
  input  opcodes::alu_functions_t Function
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

wire  [15:0]   AluRes;
logic [15:0]   Op1;
logic [15:0]   Op2;
wire  [15:0]   SignExtend;
logic [15:0]   AluOut;
logic [15:0]   PC;
logic [15:0]   SP;


regBlock regBlock(                        // Register block instance                         
   .Rd1     (Rd1     ),
   .Rd2     (Rd2     ),
   .WData   (WData   ),
   .Rs1     (Rs1     ),
   .Rs2     (Rs2     ),
   .Rw      (Rw      ),
   .Clock   (Clock   ),
   .We      (We      )
);

always_comb begin                         // Control ALU data input
   case(Op1Sel)                           // 2input mux
      0        :  Op1 = Rd1;
      default  :  Op1 = SP;
   endcase
   case(Op2Sel)                           // 3 input mux
      0        :  Op2 = SignExtend;
      1        :  Op2 = SignExtend << 2;
      default  :  Op2 = Rd2; 
   endcase
end

alu alu(                                  // Combo ALU only
   .Zflag   (Zflag   ), 
   .Result  (AluRes  ),
   .Op1     (Op1     ),
   .Op2     (Op2     )
);

always_ff@(posedge Clock or negedge nReset) begin
   if(!nReset)
      AluOut <= 0;
   else
      AluOut <= AluRes;
end



endmodule
