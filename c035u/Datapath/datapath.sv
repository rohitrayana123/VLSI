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
	input [1:0] Op2Sel ,
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

wire [0:0] Aluout ;

// include netlist information from datapath.vnet

`include "datapath.vnet"

wire [15:0] Pc;
assign Pc = { \Datapath_slice_0[15]/Pc ,
\Datapath_slice_0[14]/Pc ,
\Datapath_slice_0[13]/Pc ,
\Datapath_slice_0[12]/Pc ,
\Datapath_slice_0[11]/Pc ,
\Datapath_slice_0[10]/Pc ,
\Datapath_slice_0[9]/Pc ,
\Datapath_slice_0[8]/Pc ,
\Datapath_slice_0[7]/Pc ,
\Datapath_slice_0[6]/Pc ,
\Datapath_slice_0[5]/Pc ,
\Datapath_slice_0[4]/Pc ,
\Datapath_slice_0[3]/Pc ,
\Datapath_slice_0[2]/Pc ,
\Datapath_slice_0[1]/Pc ,
\Datapath_slice_0[0]/Pc };
wire [15:0] AluOut;
//assign AluOut = {
// \Datapath_end_0[15]/AluOut ,
// \Datapath_end_0[14]/AluOut ,
// \Datapath_end_0[13]/AluOut ,
// \Datapath_end_0[12]/AluOut ,
// \Datapath_end_0[11]/AluOut ,
// \Datapath_end_0[10]/AluOut ,
// \Datapath_end_0[9]/AluOut ,
// \Datapath_end_0[8]/AluOut ,
// \Datapath_end_0[7]/AluOut ,
// \Datapath_end_0[6]/AluOut ,
// \Datapath_end_0[5]/AluOut ,
// \Datapath_end_0[4]/AluOut ,
// \Datapath_end_0[3]/AluOut ,
// \Datapath_end_0[2]/AluOut ,
// \Datapath_end_0[1]/AluOut ,
// \Datapath_end_0[0]/AluOut };
wire [15:0] reg0;
assign reg0 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg0 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg0 };
wire [15:0] reg1;
assign reg1 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg1 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg1 };
wire [15:0] reg2;
assign reg2 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg2 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg2 };
wire [15:0] reg3;
assign reg3 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg3 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg3 };
wire [15:0] reg4;
assign reg4 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg4 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg4 };
wire [15:0] reg5;
assign reg5 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg5 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg5 };
wire [15:0] reg6;
assign reg6 = {
\Datapath_slice_0[15]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[14]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[13]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[12]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[11]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[10]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[9]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[8]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[7]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[6]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[5]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[4]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[3]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[2]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[1]/regBlock_slice_0/Reg6 ,
\Datapath_slice_0[0]/regBlock_slice_0/Reg6 };

wire [15:0] nreg7;
assign nreg7 = {
\Datapath_slice_0[15]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[14]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[13]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[12]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[11]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[10]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[9]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[8]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[7]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[6]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[5]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[4]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[3]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[2]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[1]/regBlock_slice_0/scanreg_7/nQ ,
\Datapath_slice_0[0]/regBlock_slice_0/scanreg_7/nQ };
wire [15:0] reg7;
assign reg7 = ~nreg7;

wire [2:0] Rs1;
assign Rs1 = {
\slice17_0/Rs10 ,
\slice17_0/Rs11 ,
\slice17_0/Rs12 };

wire [2:0] Rw;
assign Rw = {
\slice17_0/Rw0 ,
\slice17_0/Rw1 ,
\slice17_0/Rw2 };

wire [15:0] AluRegOut;
assign AluRegOut = {
\Datapath_end_0[15]/AluRegOut ,
\Datapath_end_0[14]/AluRegOut ,
\Datapath_end_0[13]/AluRegOut ,
\Datapath_end_0[12]/AluRegOut ,
\Datapath_end_0[11]/AluRegOut ,
\Datapath_end_0[10]/AluRegOut ,
\Datapath_end_0[9]/AluRegOut ,
\Datapath_end_0[8]/AluRegOut ,
\Datapath_end_0[7]/AluRegOut ,
\Datapath_end_0[6]/AluRegOut ,
\Datapath_end_0[5]/AluRegOut ,
\Datapath_end_0[4]/AluRegOut ,
\Datapath_end_0[3]/AluRegOut ,
\Datapath_end_0[2]/AluRegOut ,
\Datapath_end_0[1]/AluRegOut ,
\Datapath_end_0[0]/AluRegOut };


wire [15:0] Rd2;
assign Rd2 = {
\Datapath_slice_0[15]/Rd2 ,
\Datapath_slice_0[14]/Rd2 ,
\Datapath_slice_0[13]/Rd2 ,
\Datapath_slice_0[12]/Rd2 ,
\Datapath_slice_0[11]/Rd2 ,
\Datapath_slice_0[10]/Rd2 ,
\Datapath_slice_0[9]/Rd2 ,
\Datapath_slice_0[8]/Rd2 ,
\Datapath_slice_0[7]/Rd2 ,
\Datapath_slice_0[6]/Rd2 ,
\Datapath_slice_0[5]/Rd2 ,
\Datapath_slice_0[4]/Rd2 ,
\Datapath_slice_0[3]/Rd2 ,
\Datapath_slice_0[2]/Rd2 ,
\Datapath_slice_0[1]/Rd2 ,
\Datapath_slice_0[0]/Rd2 };

wire [15:0] Rd1;
assign Rd1 = {
\Datapath_slice_0[15]/Rd1 ,
\Datapath_slice_0[14]/Rd1 ,
\Datapath_slice_0[13]/Rd1 ,
\Datapath_slice_0[12]/Rd1 ,
\Datapath_slice_0[11]/Rd1 ,
\Datapath_slice_0[10]/Rd1 ,
\Datapath_slice_0[9]/Rd1 ,
\Datapath_slice_0[8]/Rd1 ,
\Datapath_slice_0[7]/Rd1 ,
\Datapath_slice_0[6]/Rd1 ,
\Datapath_slice_0[5]/Rd1 ,
\Datapath_slice_0[4]/Rd1 ,
\Datapath_slice_0[3]/Rd1 ,
\Datapath_slice_0[2]/Rd1 ,
\Datapath_slice_0[1]/Rd1 ,
\Datapath_slice_0[0]/Rd1 };

wire [15:0]ImmProbe;
assign ImmProbe = {
\IrAA_0[7]/Imm ,
\IrAA_0[6]/Imm ,
\IrAA_0[5]/Imm ,
\IrAA_0[4]/Imm ,
\IrAA_0[3]/Imm ,
\IrAA_0[2]/Imm ,
\IrAA_0[1]/Imm ,
\IrAA_0[0]/Imm ,
\IrBA_0[2]/Imm ,
\IrBA_0[1]/Imm ,
\IrBA_0[0]/Imm ,
\IrBB_0[4]/Imm ,
\IrBB_0[3]/Imm ,
\IrBB_0[2]/Imm ,
\IrBB_0[1]/Imm ,
\IrBB_0[0]/Imm };

//wire [15:0] Op1;
//assign Op1 = { \Datapath_slice_0[7]/Op1 ,
// \Datapath_slice_0[6]/Op1 ,
// \Datapath_slice_0[5]/Op1 ,
// \Datapath_slice_0[4]/Op1 ,
// \Datapath_slice_0[3]/Op1 ,
// \Datapa


endmodule
