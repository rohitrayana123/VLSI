// structural model of datapath extracted from datapath.mag
// created by ext2svmod 5.5
// Written by Henry Lovett hl13g10
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

wire [15:0] Lr;
assign Lr = { \Datapath_slice_0[15]/Pc_slice_0/Lr ,
\Datapath_slice_0[14]/Pc_slice_0/Lr ,
\Datapath_slice_0[13]/Pc_slice_0/Lr ,
\Datapath_slice_0[12]/Pc_slice_0/Lr ,
\Datapath_slice_0[11]/Pc_slice_0/Lr ,
\Datapath_slice_0[10]/Pc_slice_0/Lr ,
\Datapath_slice_0[9]/Pc_slice_0/Lr ,
\Datapath_slice_0[8]/Pc_slice_0/Lr ,
\Datapath_slice_0[7]/Pc_slice_0/Lr ,
\Datapath_slice_0[6]/Pc_slice_0/Lr ,
\Datapath_slice_0[5]/Pc_slice_0/Lr ,
\Datapath_slice_0[4]/Pc_slice_0/Lr ,
\Datapath_slice_0[3]/Pc_slice_0/Lr ,
\Datapath_slice_0[2]/Pc_slice_0/Lr ,
\Datapath_slice_0[1]/Pc_slice_0/Lr ,
\Datapath_slice_0[0]/Pc_slice_0/Lr };
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
wire [15:0] PcPlus1;
assign PcPlus1 = { \Datapath_slice_0[15]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[14]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[13]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[12]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[11]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[10]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[9]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[8]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[7]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[6]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[5]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[4]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[3]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[2]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[1]/Pc_slice_0/Pc1 ,
\Datapath_slice_0[0]/Pc_slice_0/Pc1 };
wire [15:0] Operand1;
assign Operand1 = {
 \Datapath_slice_0[15]/A ,
 \Datapath_slice_0[14]/A ,
 \Datapath_slice_0[13]/A ,
 \Datapath_slice_0[12]/A ,
 \Datapath_slice_0[11]/A ,
 \Datapath_slice_0[10]/A ,
 \Datapath_slice_0[9]/A ,
 \Datapath_slice_0[8]/A ,
 \Datapath_slice_0[7]/A ,
 \Datapath_slice_0[6]/A ,
 \Datapath_slice_0[5]/A ,
 \Datapath_slice_0[4]/A ,
 \Datapath_slice_0[3]/A ,
 \Datapath_slice_0[2]/A ,
 \Datapath_slice_0[1]/A ,
 \Datapath_slice_0[0]/A };
wire [15:0] Operand2;
assign Operand2 = {
 \Datapath_slice_0[15]/B ,
 \Datapath_slice_0[14]/B ,
 \Datapath_slice_0[13]/B ,
 \Datapath_slice_0[12]/B ,
 \Datapath_slice_0[11]/B ,
 \Datapath_slice_0[10]/B ,
 \Datapath_slice_0[9]/B ,
 \Datapath_slice_0[8]/B ,
 \LLIcell_L_0[7]/B ,
 \LLIcell_L_0[6]/B ,
 \LLIcell_L_0[5]/B ,
 \LLIcell_L_0[4]/B ,
 \LLIcell_L_0[3]/B ,
 \LLIcell_L_0[2]/B ,
 \LLIcell_L_0[1]/B ,
 \LLIcell_L_0[0]/B };
wire [15:0] AluOut;
assign AluOut = {
 Flags[3] ,
 \LLIcell_U_0[6]/ALUOut ,
 \LLIcell_U_0[5]/ALUOut ,
 \LLIcell_U_0[4]/ALUOut ,
 \LLIcell_U_0[3]/ALUOut ,
 \LLIcell_U_0[2]/ALUOut ,
 \LLIcell_U_0[1]/ALUOut ,
 \LLIcell_U_0[0]/ALUOut ,
 \LLIcell_L_0[7]/ALUOut ,
 \LLIcell_L_0[6]/ALUOut ,
 \LLIcell_L_0[5]/ALUOut ,
 \LLIcell_L_0[4]/ALUOut ,
 \LLIcell_L_0[3]/ALUOut ,
 \LLIcell_L_0[2]/ALUOut ,
 \LLIcell_L_0[1]/ALUOut ,
 \LLIcell_L_0[0]/ALUOut };
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
 \slice17_0/Rs1In2 ,
 \slice17_0/Rs1In1 ,
 \slice17_0/Rs1In0 };

wire [2:0] Rs2;
assign Rs2 = {
 Ir[4] ,
 Ir[3] ,
 Ir[2] };

wire [2:0] Rw;
assign Rw = {
\slice17_0/Rw2 ,
\slice17_0/Rw1 ,
\slice17_0/Rw0 };

wire [15:0] WD;
assign WD = {
\Datapath_slice_0[15]/WData ,
\Datapath_slice_0[14]/WData ,
\Datapath_slice_0[13]/WData ,
\Datapath_slice_0[12]/WData ,
\Datapath_slice_0[11]/WData ,
\Datapath_slice_0[10]/WData ,
\Datapath_slice_0[9]/WData ,
\Datapath_slice_0[8]/WData ,
\Datapath_slice_0[7]/WData ,
\Datapath_slice_0[6]/WData ,
\Datapath_slice_0[5]/WData ,
\Datapath_slice_0[4]/WData ,
\Datapath_slice_0[3]/WData ,
\Datapath_slice_0[2]/WData ,
\Datapath_slice_0[1]/WData ,
\Datapath_slice_0[0]/WData };

wire [15:0] AluRegOut;
assign AluRegOut = {
 \Datapath_end_high_0[11]/AluRegOut ,
 \Datapath_end_high_0[10]/AluRegOut ,
 \Datapath_end_high_0[9]/AluRegOut ,
 \Datapath_end_high_0[8]/AluRegOut ,
 \Datapath_end_high_0[7]/AluRegOut ,
 \Datapath_end_high_0[6]/AluRegOut ,
 \Datapath_end_high_0[5]/AluRegOut ,
 \Datapath_end_high_0[4]/AluRegOut ,
 \Datapath_end_high_0[3]/AluRegOut ,
 \Datapath_end_high_0[2]/AluRegOut ,
 \Datapath_end_high_0[1]/AluRegOut ,
 \Datapath_end_high_0[0]/AluRegOut ,
 \Datapath_end_low_0[3]/AluRegOut ,
 \Datapath_end_low_0[2]/AluRegOut ,
 \Datapath_end_low_0[1]/AluRegOut ,
 \Datapath_end_low_0[0]/AluRegOut };


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

//Add AluOR[1:0]

endmodule
