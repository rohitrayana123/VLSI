module alu_stim;

timeunit 1ns; timeprecision 10ps;

alu alu(                                           
   .Zflag(Zflag), 
   .Result(Result),
   .Op1(Op1),
   .Op1(Op2)
);

endmodule
