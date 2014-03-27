// structural model of regBlock_decoder extracted from regBlock_decoder.mag
// created by ext2svmod 5.5

module regBlock_decoder(
	output AluBin ,
	output [4:0] AluOp ,
	output [7:0] Rs1 ,
	output [7:0] Rs2 ,
	output [7:0] Rw ,
	input [1:0] AluOR ,
	input Cin ,
	input [15:11] Ir ,
	input [2:0] Rs1In ,
	input [2:0] Rs2In ,
	input [2:0] RwIn ,
	input We 
	);

timeunit 1ns;
timeprecision 10ps;


// include netlist information from regBlock_decoder.vnet

`include "regBlock_decoder.vnet"

endmodule
