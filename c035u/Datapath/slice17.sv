// structural model of slice17 extracted from slice17.mag
// created by ext2svmod 5.5

module slice17(
	output AND ,
	output CIn_slice ,
	output FAOut ,
	output [3:0] Flags ,
	output LLI ,
	output NAND ,
	output NOR ,
	output NOT ,
	output OR ,
	output [7:0] Rs1 ,
	output [7:0] Rs2 ,
	output [7:0] Rw ,
	output SDO ,
	output Sh1 ,
	output Sh2 ,
	output Sh4 ,
	output Sh8 ,
	output ShB ,
	output ShiftIn ,
	output ShL ,
	output ShOut ,
	output ShR ,
	output SUB ,
	output XOR ,
	output ZeroA ,
	input [1:0] AluOR ,
	input ASign ,
	input Cin ,
	input Clock ,
	input COut ,
	input [15:0] Ir ,
	input LastCIn ,
	input nReset ,
	input nZ ,
	input RegWe ,
	input [1:0] Rs1Sel ,
	input [1:0] RwSel ,
	input SDI ,
	input Test 
	);

timeunit 1ns;
timeprecision 10ps;

wire Rs10 ;
wire Rs11 ;
wire Rs12 ;
wire Rw0 ;
wire Rw1 ;
wire Rw2 ;

// include netlist information from slice17.vnet

`include "slice17.vnet"

wire [4:0]ALUOpCode;
wire ALUCin;
assign ALUOpCode = {	AOp0 ,
			AOp1 ,
			AOp2 ,
			AOp3 ,
			AOp4 };
assign ALUCin = ACin ;

endmodule
