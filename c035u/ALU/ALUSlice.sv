// structural model of ALUSlice extracted from ALUSlice.mag
// created by ext2svmod 5.5

module ALUSlice(
	output ALUOut ,
	output COut ,
	output nZ ,
	output Sh1_L_Out ,
	output Sh1_R_Out ,
	output Sh2A_L ,
	output Sh2Z_R ,
	output Sh4A_L ,
	output Sh4Z_R ,
	output Sh8A_L ,
	output Sh8Z_R ,
	output Sum ,
	input A ,
	input AND ,
	input B ,
	input CIn_Slice ,
	input FAOut ,
	input NAND ,
	input NOR ,
	input NOT ,
	input nZ_prev ,
	input OR ,
	input Sh1 ,
	input Sh1_L_In ,
	input Sh1_R_In ,
	input Sh2 ,
	input Sh2B_R ,
	input Sh2C_L ,
	input Sh4 ,
	input Sh4C_R ,
	input Sh4D_L ,
	input Sh8 ,
	input Sh8D_R ,
	input Sh8E_L ,
	input ShB ,
	input ShL ,
	input ShOut ,
	input ShR ,
	input SUB ,
	input XOR ,
	input ZeroA 
	);

timeunit 1ns;
timeprecision 10ps;

wire FA_1 ;
wire FA_2 ;

// include netlist information from ALUSlice.vnet

`include "ALUSlice.vnet"

endmodule
