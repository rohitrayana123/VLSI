module alu(
  output logic Zflag,
  output logic [15:0] Result,
  input [15:0] Reg, Mem,
  input [3:0] Function
  );

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

   assign Zflag = (Result == 0);

   always_comb
      case (Function)
         FnMem		: Result = Mem;
         FnADD		: Result = Reg + Mem;
         FnSUB		: Result = Reg - Mem;
         FnAND		: Result = Reg & Mem;
         FnOR		: Result = Reg | Mem;
         FnNOT		: Result = ~Reg;
         FnLSL		: Result = Reg << 1;
         FnLSR		: Result = Reg >> 1;
         default	: Result = Reg;
      endcase

endmodule
