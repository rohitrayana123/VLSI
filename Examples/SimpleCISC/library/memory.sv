module memory(
  inout [15:0] data,
  input [15:0] address,
  input write, clock
  );

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

logic [15:0] Data_stored [ 511:0 ];

   assign data = (!write) ? Data_stored [address] : 16'bz;

   always_ff @(posedge clock)
      if (write) Data_stored [address] <= #20 data;

   initial
      begin
         // DATA
         localparam VAR_X = 16'd150;
         localparam VAR_Y = 16'd151;
         Data_stored[VAR_X] = {16'd7};
         Data_stored[VAR_Y] = {16'dx};

         // CODE:
         Data_stored[0] = {LDA,DIRECT};
         Data_stored[1] = VAR_X;

         Data_stored[2] = {SUB,IMMEDIATE};	// .loop
         Data_stored[3] = 1;
         Data_stored[4] = {BEQ,PC_RELATIVE};	// If Acc = 0 then Jump .done
         Data_stored[5] = +11;
         Data_stored[6] = {STA,DIRECT};
         Data_stored[7] = VAR_Y;
         Data_stored[8] = {ADD,DIRECT};
         Data_stored[9] = VAR_X;
         Data_stored[10] = {STA,DIRECT};
         Data_stored[11] = VAR_X;
         Data_stored[12] = {LDA,DIRECT};
         Data_stored[13] = VAR_Y;
         Data_stored[14] = {BA,PC_RELATIVE};	// Jump .loop
         Data_stored[15] = -13;
         Data_stored[16] = {LDA,DIRECT};	// .done
         Data_stored[17] = VAR_X;
         Data_stored[18] = {BA,PC_RELATIVE};	// Jump .end
         Data_stored[19] = +80;

         Data_stored[99] = {BA,PC_RELATIVE};	// .end
         Data_stored[100] = -1;

      end

endmodule
