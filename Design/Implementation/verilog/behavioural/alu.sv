module alu(
  output logic [3:0]             Flags, 
  output logic [15:0]            Result,
  input        [15:0]            Op1,
  input        [15:0]            Op2,
  input opcodes::alu_functions_t AluOp
  );

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

assign Zflag = (Result == 0);

always_comb
   case (AluOp)
      FnMem		: Result = Op1;
      FnADD		: Result = Op1 + Op2;
      FnSUB		: Result = Op1 - Op2;
      FnAND		: Result = Op1 & Op2;
      FnOR	   : Result = Op1 | Op2;
      FnNOT		: Result = ~Op1;
      FnLSL		: Result = Op1 << 1;
      FnLSR		: Result = Op1 >> 1;
 //     FnNOP    : Result = Op1;
      default  : Result = Op1;
   endcase

endmodule
