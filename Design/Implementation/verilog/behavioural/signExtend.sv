module signExtend(
   output logic   [15:0]   DataOut,
   input          [7:0]    DataIn,
   input                   ImmSel
);
timeunit 1ns; timeprecision 10ps;
// Don't know what's happening here yet
assign DataOut = (ImmSel) ? {DataIn,8'h00} : {DataIn[7:3],11'h000};
endmodule
