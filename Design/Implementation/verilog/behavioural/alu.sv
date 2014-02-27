module alu(
  output logic [3:0]             Flags, 
  output logic [15:0]            Result,
  input        [15:0]            Op1,
  input        [15:0]            Op2,
  input opcodes::alu_functions_t AluOp,
  input wire CarryIn
  );

timeunit 1ns; timeprecision 100ps;

import opcodes::*;


logic Carry;
assign Flags[`FLAGS_Z] = (Result == 0);
assign Flags[`FLAGS_N] = Result[15];
assign Flags[`FLAGS_C] = Carry;
assign Flags[`FLAGS_V] = 0; //@todo sort overflow out
always_comb
begin
   	Carry = 0; //default case
   	case (AluOp)
      	FnA		: Result = Op1;
      	FnB		: Result = Op2;	// AJR - Need stright through for LUI,LLI - HSL surely LUI will need a byte shift up
  	FnADD		: {Carry, Result} = {1'b0,Op1} + {1'b0,Op2};
      	FnADC   	: {Carry, Result} = {1'b0,Op1} + {1'b0,Op2} + CarryIn; 
      	FnSUB		: {Carry, Result} = {1'b0,Op1} - {1'b0,Op2};
	FnSUC		: {Carry, Result} = {1'b0,Op1} - {1'b0,Op2} - (~CarryIn);
      	FnAND		: Result = Op1 & Op2;
      	FnOR	   	: Result = Op1 | Op2;
      	FnNOT		: Result = ~Op1;
	FnXOR		: Result = Op1 ^ Op2;
	FnNAND 		: Result = ~ ( Op1 & Op2 ); 
	FnNOR		: Result = ~ ( Op1 | Op2 );
      	FnLSL		: Result = Op1 << Op2;
      	FnLSR		: Result = Op1 >> Op2;
       	FnASR		: Result = Op1 >>> Op2;
	FnNEG		: Result = ~Op1 + 1;
 	FnNOP    	: Result = 0;		// AJR - I would like to keep this for testing
      	default  	: Result = Op1;
   	endcase
end
endmodule
