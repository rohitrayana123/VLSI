// structural model of Pc_Block extracted from Pc_Block.mag
// created by ext2svmod 5.5

module Pc_Block(
	output PcIncCout ,
	output Scan ,
	input Clock ,
	input LrEn ,
	input LrSel ,
	input LrWe ,
	input nReset ,
	input PcIncCin ,
	input [1:0] PcSel ,
	input Test 
	);

timeunit 1ns;
timeprecision 10ps;


// include netlist information from Pc_Block.vnet

`include "Pc_Block.vnet"

endmodule
