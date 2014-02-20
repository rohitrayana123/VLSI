module memory(
  inout [15:0] data,
  input [15:0] address,
  input write, clock
  );

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

logic [15:0] Data_stored [ 511:0 ];

integer a, loop;

task next;
  a=a+1;
endtask

   assign data = (!write) ? Data_stored [address] : 16'bz;

   always_ff @(posedge clock)
      if (write) Data_stored [address] <= #20 data;

   initial
      begin
	 //		Variables & Arrays

         localparam VAR_A = 16'd150;
         localparam VAR_B = 16'd151;
         localparam TEMP = 16'd153;
 	 localparam ARRAY_1 = 16'd200;
	 localparam ARRAY_2 = 16'd210;
	 localparam ARRAY_3 = 16'd220;

         Data_stored[VAR_A] = 16'dx;
         Data_stored[VAR_B] = 16'dx;
         Data_stored[TEMP] = 16'dx;

         Data_stored[200] = 16'd6;
         Data_stored[201] = 16'd4;
         Data_stored[202] = 16'd5;
         Data_stored[203] = 0;
         Data_stored[204] = 16'dx;

         Data_stored[210] = 16'd9;
         Data_stored[211] = 16'd21;
         Data_stored[212] = 16'd3;
         Data_stored[213] = 0;
         Data_stored[214] = 16'dx;

         Data_stored[220] = 16'dx;
         Data_stored[221] = 16'dx;
         Data_stored[222] = 16'dx;
         Data_stored[223] = 16'dx;
         Data_stored[224] = 16'dx;

	 
         // 		Program
	 
	a=0;
	// 		S=500
	Data_stored[a] = {LDS,IMMEDIATE};		next;
	Data_stored[a] =500;				next;
	// 		X=0
	Data_stored[a] = {LDX,IMMEDIATE};		next;
	Data_stored[a] = 0;				next;

	//.loop		A=ARRAY_1[X]
	loop = a; 
	Data_stored[a] = {LDA,INDEXED};			next;
	Data_stored[a] = ARRAY_1;			next;
	Data_stored[a] = {STA,DIRECT};			next;
	Data_stored[a] = VAR_A;				next;

	// 		B=ARRAY_2[X]
	Data_stored[a] = {LDA,INDEXED};			next;
	Data_stored[a] = ARRAY_2;			next;
	Data_stored[a] = {STA,DIRECT};			next;
	Data_stored[a] = VAR_B;				next;

	//		If (Z=1) Branch .loop
	Data_stored[a] = {SUB,IMMEDIATE};		next;
	Data_stored[a] = 0;				next;
	Data_stored[a] = {BEQ,PC_RELATIVE};		next;
	Data_stored[a] = 99-a;				next;
	
	//		Acc = VAR_A & ~ VAR_B
	Data_stored[a] = {LDA, DIRECT};			next;
	Data_stored[a] = VAR_B;				next;
	Data_stored[a] = {COM, INHERENT};		next;
	Data_stored[a] = {AND, DIRECT};			next;
	Data_stored[a] = VAR_A;				next;
	Data_stored[a] = {STA, INDEXED};		next;
	Data_stored[a] = ARRAY_3; 			next;

	//		X=X+1
        Data_stored[a] = {STX,DIRECT};			next;
        Data_stored[a] = TEMP;				next;
        Data_stored[a] = {LDA,DIRECT};			next;
        Data_stored[a] = TEMP;				next;
        Data_stored[a] = {ADD,IMMEDIATE};		next;
        Data_stored[a] = 1;				next;
        Data_stored[a] = {STA,DIRECT};			next;
        Data_stored[a] = TEMP;				next;
        Data_stored[a] = {LDX,DIRECT};			next;
        Data_stored[a] = TEMP;				next;
	
	// 		Branch .loop
        Data_stored[a] = {BA,PC_RELATIVE};		next;
        Data_stored[a] = loop-a;			next;

	// .end	Branch .end
        Data_stored[99] = {BA,PC_RELATIVE};		next;
        Data_stored[100] = -16'd1;			next;
	 
      end

endmodule
