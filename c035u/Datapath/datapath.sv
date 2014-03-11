// structural model of datapath extracted from datapath.mag
// created by ext2svmod 5.5

module datapath(
	output [3:0] Flags ,
	output [15:0] Ir ,
	output SDO ,
	output [15:0] SysBus ,
	input AluEn ,
	input AluWe ,
	input CFlag ,
	input Clock ,
	input [15:0] DataIn ,
	input ImmSel ,
	input IrWe ,
	input LrEn ,
	input LrSel ,
	input LrWe ,
	input MemEn ,
	input nReset ,
	input Op1Sel ,
	input Op2Sel ,
	input PcEn ,
	input [1:0] PcSel ,
	input PcWe ,
	input RegWe ,
	input [1:0] Rs1Sel ,
	input [1:0] RwSel ,
	input SDI ,
	input Test ,
	input WdSel 
	);

timeunit 1ns;
timeprecision 10ps;


// include netlist information from datapath.vnet

`include "datapath.vnet"

wire [15:0] Pc;
assign Pc = {	\Datapath_slice_0[7]/Pc ,
		\Datapath_slice_0[6]/Pc ,
		\Datapath_slice_0[5]/Pc ,
		\Datapath_slice_0[4]/Pc ,
		\Datapath_slice_0[3]/Pc ,
		\Datapath_slice_0[2]/Pc ,
		\Datapath_slice_0[1]/Pc ,
		\Datapath_slice_0[0]/Pc };
wire [15:0] AluOut;
assign AluOut = {	\Datapath_end_0[7]/AluOut ,
			\Datapath_end_0[6]/AluOut ,
			\Datapath_end_0[5]/AluOut ,
			\Datapath_end_0[4]/AluOut ,
			\Datapath_end_0[3]/AluOut ,
			\Datapath_end_0[2]/AluOut ,
			\Datapath_end_0[1]/AluOut ,
			\Datapath_end_0[0]/AluOut };
wire [15:0] Op1;
assign Op1 = {	\Datapath_slice_0[7]/Op1 ,
		\Datapath_slice_0[6]/Op1 ,
		\Datapath_slice_0[5]/Op1 ,
		\Datapath_slice_0[4]/Op1 ,
		\Datapath_slice_0[3]/Op1 ,
		\Datapath_slice_0[2]/Op1 ,
		\Datapath_slice_0[1]/Op1 ,
		\Datapath_slice_0[0]/Op1 };

endmodule
