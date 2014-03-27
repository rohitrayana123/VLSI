module trisBuf16(
   input wire  [15:0]   DataIn,
   input wire           En,
   output wire [15:0]   DataOut
);
timeunit 1ns; timeprecision 10ps;
assign DataOut = (En) ? DataIn : 16'hZZZZ;   // 16 bit tristate
endmodule
