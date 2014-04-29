// structural model of Datapath_slice extracted from Datapath_slice.mag
// created by ext2svmod 5.5

module Datapath_slice(
	output A ,
	output COut ,
	output nZ ,
	output PcIncCout ,
	output Sh1_L_Out ,
	output Sh1_R_Out ,
	output Sh2A_L ,
	output Sh2Z_R ,
	output Sh4Y_R ,
	output Sh4Z_L ,
	output Sh8Z_L ,
	output Sh8Z_R ,
	output Sum ,
	output SysBus ,
	input AluOut ,
	input AND ,
	input CIn_Slice ,
	input FAOut ,
	input Imm ,
	input LrEn ,
	input LrSel ,
	input LrWe ,
	input NAND ,
	input NOR ,
	input NOT ,
	input nZ_prev ,
	input Op1Sel ,
	input [1:0] Op2Sel ,
	input OR ,
	input PcEn ,
	input PcIncCin ,
	input [2:0] PcSel ,
	input PcWe ,
	input [7:0] Rs1 ,
	input [7:0] Rs2 ,
	input [7:0] Rw ,
	input Sh1 ,
	input Sh1_L_In ,
	input Sh1_R_in ,
	input Sh2 ,
	input Sh2B_R ,
	input Sh2C_L ,
	input Sh4 ,
	input Sh4C_R ,
	input Sh4D_L ,
	input Sh8 ,
	input Sh8H_L ,
	input Sh8H_R ,
	input ShB ,
	input ShL ,
	input ShOut ,
	input ShR ,
	input SUB ,
	input WdSel ,
	input XOR ,
	input ZeroA, 
	input Clock,
	input nReset 
	);

timeunit 1ns;
timeprecision 10ps;

wire WData ;
wire B ;
wire Pc ;
wire Rd1 ;
wire Rd2 ;

`include "Datapath_slice.vnet"

wire [7:0] Regs ;
wire Reg7 ;
assign Reg7 = ~ \regBlock_slice_0/scanreg_7/nQ ;
assign Regs = { Reg7 ,
		\regBlock_slice_0/Reg6 ,
		\regBlock_slice_0/Reg5 ,
		\regBlock_slice_0/Reg4 ,
		\regBlock_slice_0/Reg3 ,
		\regBlock_slice_0/Reg2 ,
		\regBlock_slice_0/Reg1 ,
		\regBlock_slice_0/Reg0 };
//logic Clock ;
//assign Clock = \mux2_3/Clock ;
//logic nReset = \mux2_3/nReset ;

// include netlist information from Datapath_slice.vnet



endmodule
