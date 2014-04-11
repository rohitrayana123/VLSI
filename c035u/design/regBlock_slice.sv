// structural model of regBlock_slice extracted from regBlock_slice.mag
// created by ext2svmod 5.5

module regBlock_slice(
	output Rd1 ,
	output Rd2 ,
	input [7:0] Rs1 ,
	input [7:0] Rs2 ,
	input [7:0] Rw ,
	input WData 
	);

timeunit 1ns;
timeprecision 10ps;

wire Reg0 ;
wire Reg1 ;
wire Reg2 ;
wire Reg3 ;
wire Reg4 ;
wire Reg5 ;
wire Reg6 ;
wire Reg7Out ;

// include netlist information from regBlock_slice.vnet

`include "regBlock_slice.vnet"

endmodule
