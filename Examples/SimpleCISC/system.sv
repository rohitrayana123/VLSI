module system;

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

logic Clock, nReset;

processor Processor ( Clock, nReset);

always
  begin
     Clock = 0;
    #250
     Clock = 1;
    #500
     Clock = 0;
    #250
     Clock = 0;
  end

initial
  begin
     nReset = 0;
    #100
     nReset = 1;
  end

`include "monitor.sv"

endmodule
