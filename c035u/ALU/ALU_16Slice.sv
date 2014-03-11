// structural model of ALU_16Slice extracted from ALU_16Slice.mag
// created by ext2svmod 5.5

module ALU_16Slice(
	output [15:0] ALUOut ,
	output CIn_Slice ,
	output COut ,
	output nZ ,
	output SDO ,
	output Sum ,
	input [15:0] A ,
	input ALUEnable ,
	input AND ,
	input [15:0] B ,
	input CIn ,
	input Clock ,
	input FAOut ,
	input LLI ,
	input NAND ,
	input NOR ,
	input NOT ,
	input nReset ,
	input OR ,
	input Sh1 ,
	input Sh2 ,
	input Sh4 ,
	input Sh8 ,
	input ShB ,
	input ShL ,
	input ShOut ,
	input ShR ,
	input ShSignIn ,
	input Sign ,
	input SUB ,
	input Test ,
	input XOR ,
	input ZeroA 
	);

timeunit 1ns;
timeprecision 10ps;


// include netlist information from ALU_16Slice.vnet

`include "ALU_16Slice.vnet"

endmodule
