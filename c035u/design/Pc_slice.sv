// structural model of Pc_slice extracted from Pc_slice.mag
// created by ext2svmod 5.5

module Pc_slice(
	output Pc ,
	output PcIncCout ,
	output SysBus ,
	input ALU ,
	input LrEn ,
	input LrSel ,
	input LrWe ,
	input PcEn ,
	input PcIncCin ,
	input PCI_Value ,
	input [2:0] PcSel ,
	input PcWe ,
	input Clock ,
	input nReset ,
	input Test
	);

timeunit 1ns;
timeprecision 10ps;

wire Lr ;
wire Pc1 ;

// include netlist information from Pc_slice.vnet

`include "Pc_slice.vnet"
assign pc.\mux2_4/Clock = Clock ;
assign pc.\mux2_4/nReset = nReset ;
assign pc.\mux2_4/Test = Test ;

endmodule
