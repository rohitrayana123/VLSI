module alu(
  output logic Zflag, 
  output logic [15:0] Result,
  input  [15:0] ACC,
  input  [15:0] Mem,
  input  opcodes::alu_functions_t Function
  );

timeunit 1ns;
timeprecision 100ps;

import opcodes::*;

  assign Zflag = (ACC == 0);

  always_comb
    case (Function)
       FnMem		: Result = Mem;
       FnADD		: Result = ACC + Mem;
       FnSUB		: Result = ACC - Mem;
       FnAND		: Result = ACC & Mem;
       FnOR		   : Result = ACC | Mem;
       FnNOT		: Result = ~ACC;
       FnLSL		: Result = ACC << 1;
       FnLSR		: Result = ACC >> 1;
       default		: Result = ACC;
    endcase

endmodule
