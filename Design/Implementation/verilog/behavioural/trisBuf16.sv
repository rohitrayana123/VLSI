module trisBuf16(
   input wire  [15:0]   dataIn,
   input wire           en,
   output wire [15:0]   dataOut
);
timeunit 1ns; timeprecision 10ps;
assign dataOut = (en) ? dataIn : 16'hZZZZ;   // 16 bit tristate
endmodule
