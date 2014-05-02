//Written by Henry Lovett (hl13g10)
module cpu(
  inout [15:0] Data,
  output wire  nME, ALE, RnW, nOE, SDO,
  input        nIRQ, nWait, Clock, nReset, Test, SDI
  );

timeunit 1ns;
timeprecision 100ps;

// include netlist information from cpu.vnet

`include "cpu.vnet"

import opcodes::*;
Opcode_t OpCode;
wire [4:0] Op;
assign OpCode = Opcode_t'(Op);
assign Op = {
\teamR4_0/datapath_0/Ir[15] ,
\teamR4_0/datapath_0/Ir[14] ,
\teamR4_0/datapath_0/Ir[13] ,
\teamR4_0/datapath_0/Ir[12] ,
\teamR4_0/datapath_0/Ir[11] };

state_t state;
wire [1:0] st;
assign st = {
\teamR4_0/control_0/state[1] ,
\teamR4_0/control_0/state[0] };
assign state = state_t'(st);

stateSub_t stateSub;
wire[2:0] sst;
assign sst = {
\teamR4_0/control_0/stateSub[2] ,
\teamR4_0/control_0/stateSub[1] ,
~\teamR4_0/control_0/stateSub[0] };
assign stateSub = stateSub_t'(sst);

wire [15:0] Ir;
assign Ir = { \teamR4_0/datapath_0/Ir[15] ,
\teamR4_0/datapath_0/Ir[14] ,
\teamR4_0/datapath_0/Ir[13] ,
\teamR4_0/datapath_0/Ir[12] ,
\teamR4_0/datapath_0/Ir[11] ,
\teamR4_0/datapath_0/Ir[10] ,
\teamR4_0/datapath_0/Ir[9] ,
\teamR4_0/datapath_0/Ir[8] ,
\teamR4_0/datapath_0/Ir[7] ,
\teamR4_0/datapath_0/Ir[6] ,
\teamR4_0/datapath_0/Ir[5] ,
\teamR4_0/datapath_0/Ir[4] ,
\teamR4_0/datapath_0/Ir[3] ,
\teamR4_0/datapath_0/Ir[2] ,
\teamR4_0/datapath_0/Ir[1] ,
\teamR4_0/datapath_0/Ir[0] };
wire [15:0] Pc;
assign Pc = { \teamR4_0/datapath_0/Datapath_slice_0[15]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/Pc ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/Pc };
wire [15:0] Operand1;
assign Operand1 = {
 \teamR4_0/datapath_0/Datapath_slice_0[15]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[14]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[13]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[12]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[11]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[10]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[9]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[8]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[7]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[6]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[5]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[4]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[3]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[2]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[1]/A ,
 \teamR4_0/datapath_0/Datapath_slice_0[0]/A };
wire [15:0] Operand2;
assign Operand2 = {
 \teamR4_0/datapath_0/Datapath_slice_0[15]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[14]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[13]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[12]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[11]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[10]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[9]/B ,
 \teamR4_0/datapath_0/Datapath_slice_0[8]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[7]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[6]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[5]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[4]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[3]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[2]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[1]/B ,
 \teamR4_0/datapath_0/LLIcell_L_0[0]/B };
//wire [15:0] AluOut;
//assign AluOut = {
// \teamR4_0/datapath_0/LLIcell_U_0[7]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[6]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[5]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[4]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[3]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[2]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[1]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_U_0[0]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[7]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[6]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[5]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[4]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[3]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[2]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[1]/ALUOut ,
// \teamR4_0/datapath_0/LLIcell_L_0[0]/ALUOut };
wire [15:0] reg0;
assign reg0 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg0 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg0 };
wire [15:0] reg1;
assign reg1 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg1 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg1 };
wire [15:0] reg2;
assign reg2 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg2 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg2 };
wire [15:0] reg3;
assign reg3 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg3 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg3 };
wire [15:0] reg4;
assign reg4 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg4 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg4 };
wire [15:0] reg5;
assign reg5 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg5 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg5 };
wire [15:0] reg6;
assign reg6 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/Reg6 ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/Reg6 };

wire [15:0] nreg7;
assign nreg7 = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/regBlock_slice_0/scanreg_7/nQ ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/regBlock_slice_0/scanreg_7/nQ };
wire [15:0] reg7;
assign reg7 = ~nreg7;

wire[15:0] PcIn;
assign PcIn = {
\teamR4_0/datapath_0/Datapath_slice_0[15]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[14]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[13]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[12]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[11]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[10]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[9]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[8]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[7]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[6]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[5]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[4]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[3]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[2]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[1]/Pc_slice_0/PcIn ,
\teamR4_0/datapath_0/Datapath_slice_0[0]/Pc_slice_0/PcIn 
};
//
//wire [2:0] Rs1;
//assign Rs1 = {
//\teamR4_0/datapath_0/slice17_0/Rs10 ,
//\teamR4_0/datapath_0/slice17_0/Rs11 ,
//\teamR4_0/datapath_0/slice17_0/Rs12 };
//
//wire [2:0] Rw;
//assign Rw = {
//\teamR4_0/datapath_0/slice17_0/Rw0 ,
//\teamR4_0/datapath_0/slice17_0/Rw1 ,
//\teamR4_0/datapath_0/slice17_0/Rw2 };
//
//wire [15:0] AluRegOut;
//assign AluRegOut = {
//\Datapath_end_0[15]/AluRegOut ,
//\Datapath_end_0[14]/AluRegOut ,
//\Datapath_end_0[13]/AluRegOut ,
//\Datapath_end_0[12]/AluRegOut ,
//\Datapath_end_0[11]/AluRegOut ,
//\Datapath_end_0[10]/AluRegOut ,
//\Datapath_end_0[9]/AluRegOut ,
//\Datapath_end_0[8]/AluRegOut ,
//\Datapath_end_0[7]/AluRegOut ,
//\Datapath_end_0[6]/AluRegOut ,
//\Datapath_end_0[5]/AluRegOut ,
//\Datapath_end_0[4]/AluRegOut ,
//\Datapath_end_0[3]/AluRegOut ,
//\Datapath_end_0[2]/AluRegOut ,
//\Datapath_end_0[1]/AluRegOut ,
//\Datapath_end_0[0]/AluRegOut };
//
//
//wire [15:0] Rd2;
//assign Rd2 = {
//\Datapath_slice_0[15]/Rd2 ,
//\Datapath_slice_0[14]/Rd2 ,
//\Datapath_slice_0[13]/Rd2 ,
//\Datapath_slice_0[12]/Rd2 ,
//\Datapath_slice_0[11]/Rd2 ,
//\Datapath_slice_0[10]/Rd2 ,
//\Datapath_slice_0[9]/Rd2 ,
//\Datapath_slice_0[8]/Rd2 ,
//\Datapath_slice_0[7]/Rd2 ,
//\Datapath_slice_0[6]/Rd2 ,
//\Datapath_slice_0[5]/Rd2 ,
//\Datapath_slice_0[4]/Rd2 ,
//\Datapath_slice_0[3]/Rd2 ,
//\Datapath_slice_0[2]/Rd2 ,
//\Datapath_slice_0[1]/Rd2 ,
//\Datapath_slice_0[0]/Rd2 };
//
//wire [15:0] Rd1;
//assign Rd1 = {
//\Datapath_slice_0[15]/Rd1 ,
//\Datapath_slice_0[14]/Rd1 ,
//\Datapath_slice_0[13]/Rd1 ,
//\Datapath_slice_0[12]/Rd1 ,
//\Datapath_slice_0[11]/Rd1 ,
//\Datapath_slice_0[10]/Rd1 ,
//\Datapath_slice_0[9]/Rd1 ,
//\Datapath_slice_0[8]/Rd1 ,
//\Datapath_slice_0[7]/Rd1 ,
//\Datapath_slice_0[6]/Rd1 ,
//\Datapath_slice_0[5]/Rd1 ,
//\Datapath_slice_0[4]/Rd1 ,
//\Datapath_slice_0[3]/Rd1 ,
//\Datapath_slice_0[2]/Rd1 ,
//\Datapath_slice_0[1]/Rd1 ,
//\Datapath_slice_0[0]/Rd1 };
//
//wire [15:0]ImmProbe;
//assign ImmProbe = {
//\IrAA_0[7]/Imm ,
//\IrAA_0[6]/Imm ,
//\IrAA_0[5]/Imm ,
//\IrAA_0[4]/Imm ,
//\IrAA_0[3]/Imm ,
//\IrAA_0[2]/Imm ,
//\IrAA_0[1]/Imm ,
//\IrAA_0[0]/Imm ,
//\IrBA_0[2]/Imm ,
//\IrBA_0[1]/Imm ,
//\IrBA_0[0]/Imm ,
//\IrBB_0[4]/Imm ,
//\IrBB_0[3]/Imm ,
//\IrBB_0[2]/Imm ,
//\IrBB_0[1]/Imm ,
//\IrBB_0[0]/Imm };

endmodule
