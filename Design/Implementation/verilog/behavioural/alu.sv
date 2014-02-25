module alu(
  output logic [3:0]             Flags, 
  output logic [15:0]            Result,
  input        [15:0]            Op1,
  input        [15:0]            Op2,
  input opcodes::alu_functions_t AluOp
  );

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

`define FLAGS_Z  0
`define FLAGS_C  1
`define FLAGS_V  2
`define FLAGS_N  3

logic Carry;
assign Flags[`FLAGS_Z] = (Result == 0);
assign Flags[`FLAGS_N] = Result[15];
assign Flags[`FLAGS_C] = Carry;
assign Flags[`FLAGS_V] = 0; //@todo sort overflow out
always_comb
begin
   Carry = 0; //default case
   case (AluOp)
      FnMEM		: Result = Op1;
      FnADD		: {Carry, Result} = {1'b0,Op1} + {1'b0,Op2};
      FnADC    : Result = Op1 + Op2 + 1; 
      FnSUB		: {Carry, Result} = {1'b0,Op1} - {1'b0,Op2};
      FnAND		: Result = Op1 & Op2;
      FnOR	   : Result = Op1 | Op2;
      FnNOT		: Result = ~Op1;
      FnLSL		: Result = Op1 << 1;
      FnLSR		: Result = Op1 >> 1;
 //     FnNOP    : Result = Op1;
      default  : Result = Op1;
   endcase
end
endmodule
