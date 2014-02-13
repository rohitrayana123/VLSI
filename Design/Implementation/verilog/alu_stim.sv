module alu_stim;

timeunit 1ns; timeprecision 10ps;

alu alu(                                           
   .Zflag(Zflag), 
   .Result(Result),
   .ACC(ACC),
   .Mem(Mem)
);

endmodule
