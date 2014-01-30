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
	//		Variables

	localparam VAR_A = 16'd150;
	localparam VAR_B = 16'd151;
	localparam VAR_P = 16'd152;
	Data_stored[VAR_A] = 16'd5;
	Data_stored[VAR_B] = 16'd5;
	Data_stored[VAR_P] = 16'dx;
	 
	// 		Program
	 
	//		P=0
	Data_stored[0] = {LDA,IMMEDIATE};
	Data_stored[1] = 0;
	Data_stored[2] = {STA,DIRECT};
	Data_stored[3] = VAR_P;
	 
	// 		load B
	Data_stored[4] = {LDA,DIRECT};
	Data_stored[5] = VAR_B;

	// .loop	AND #1
	Data_stored[6] = {AND,IMMEDIATE};
	Data_stored[7] = 1;
	 
	//		If (Z == 1) Branch .noadd
	Data_stored[8] = {BEQ,PC_RELATIVE};
	Data_stored[9] = +7;
	 
	//		P=P+A
	Data_stored[10] = {LDA,DIRECT};
	Data_stored[11] = VAR_P;
	Data_stored[12] = {ADD,DIRECT};
	Data_stored[13] = VAR_A;
	Data_stored[14] = {STA,DIRECT};
	Data_stored[15] = VAR_P;
	 
	// .noadd	A=A<<1
	Data_stored[16] = {LDA,DIRECT};
	Data_stored[17] = VAR_A;
	Data_stored[18] = {LSL,INHERENT};
	Data_stored[19] = {STA,DIRECT};
	Data_stored[20] = VAR_A;
	 
	//		B=B>>1
	Data_stored[21] = {LDA,DIRECT};
	Data_stored[22] = VAR_B;
	Data_stored[23] = {LSR,INHERENT};
	Data_stored[24] = {STA,DIRECT};
	Data_stored[25] = VAR_B;
	 
	//		If (Z=0) Branch .loop
	Data_stored[26] = {BNE,PC_RELATIVE};
	Data_stored[27] = -21;

	//		Branch .end
	Data_stored[28] = {BA,PC_RELATIVE};
	Data_stored[29] = +70;

	// .end	Branch .end
	Data_stored[99] = {BA,PC_RELATIVE};
	Data_stored[100] = -1;
	 
      end

endmodule
