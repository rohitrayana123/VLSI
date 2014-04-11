// structural model of ALUDecoder_new extracted from ALUDecoder_new.mag
// created by ext2svmod 5.5

module ALUDecoder_new(
	output AND ,
	output C ,
	output CIn_slice ,
	output FAOut ,
	output LLI ,
	output N ,
	output NAND ,
	output NOR ,
	output NOT ,
	output OR ,
	output Sh1 ,
	output Sh2 ,
	output Sh4 ,
	output Sh8 ,
	output ShB ,
	output ShInBit ,
	output ShL ,
	output ShOut ,
	output ShR ,
	output SUB ,
	output V ,
	output XOR ,
	output Z ,
	output ZeroA ,
	input ASign ,
	input Cin ,
	input COut ,
	input [3:0] imm4 ,
	input LastCIn ,
	input nZ ,
	input [4:0] OpCode 
	);

timeunit 1ns;
timeprecision 10ps;

wire ABC ;
wire ABnC ;
wire AnBC ;
wire AnBnC ;
wire nA ;
wire nB ;
wire nC ;
wire nD ;
wire nE ;
wire ShSign ;
wire UseC ;

// include netlist information from ALUDecoder_new.vnet

`include "ALUDecoder_new.vnet"

endmodule
