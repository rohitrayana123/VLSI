// structural model of datapath extracted from datapath.mag
// created by ext2svmod 5.5

module datapath(
	output [15:0] DataOut ,
	output [3:0] Flags ,
	output [15:0] Ir ,
	output SDO ,
	input AluEn ,
	input [1:0] AluOR ,
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
	input [1:0] Op2Sel ,
	input PcEn ,
	input [2:0] PcSel ,
	input PcWe ,
	input RegWe ,
	input [1:0] Rs1Sel ,
	input [1:0] RwSel ,
	input SDI ,
	input [3:0] StatusReg ,
	input StatusRegEn ,
	input Test ,
	input WdSel 
	);

timeunit 1ns;
timeprecision 10ps;

wire [0:0] Aluout ;

// include netlist information from datapath.vnet

`include "datapath.vnet"

endmodule
