module memory(
  inout [15:0] data,
  input [11:0] address,
  input write, clock
  );

timeunit 1ns; timeprecision 10ps;

import  opcodes::*;

logic [15:0] Data_stored [ 255:0 ];

   assign data = (!write) ? Data_stored [address] : 16'bz;

   always_ff @(posedge clock)
      if (write) Data_stored [address] <= #20 data;

   initial
      begin
         // DATA
         localparam CONST_0	= 12'd20;
         localparam CONST_1	= 12'd21;
	 localparam VAR_A	= 12'd22;
	 localparam VAR_B	= 12'd23;
	 localparam VAR_P	= 12'd24;
         Data_stored[20] = {16'd0};	//CONST_0
         Data_stored[21] = {16'd1};	//CONST_1
         Data_stored[22] = {16'd5};	//VAR_A
         Data_stored[23] = {16'd5};	//VAR_B
         Data_stored[24] = {16'dx};	//VAR_P
	 
         // 		Program
	 
	 // 		P=0
         Data_stored[0] = {LDA,CONST_0};
         Data_stored[1] = {STA,VAR_P};
	 
	 // 		Load B
         Data_stored[2] = {LDA,VAR_B};
	 
	 // .loop	AND #1
         Data_stored[3] = {AND,CONST_1};
	 
	 //		JumpZ .noadd
         Data_stored[4] = {JMPZ,12'd8};
	 
	 //		P=P+A
         Data_stored[5] = {LDA,VAR_P};
         Data_stored[6] = {ADD,VAR_A};
         Data_stored[7] = {STA,VAR_P};
	 
	 // .noadd	A=A<<1
         Data_stored[8] = {LDA,VAR_A};
         Data_stored[9] = {LSL,12'd0};
         Data_stored[10] = {STA,VAR_A};
	 
	 //		B=B>>1
         Data_stored[11] = {LDA,VAR_B};
         Data_stored[12] = {LSR,12'd0};
         Data_stored[13] = {STA,VAR_B};
	 
	 //		JumpNZ .loop
         Data_stored[14] = {JMPNZ,12'd3};
	 
	 // 		Jump .end
         Data_stored[15] = {JMP,12'd99};

	 // .end	Jump .end
         Data_stored[99] = {JMP,12'd99};
	 
      end

endmodule
