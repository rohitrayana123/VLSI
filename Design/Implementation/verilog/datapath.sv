module datapath(
  output wire  [15:0] SysBus,
  output logic [3:0] Opcode,
  output logic Zflag,
  input  [15:0] Data_in,
  input  opcodes::alu_functions_t Function,
  input  SelInc, LoadPC, LoadIR, TrisOperand, TrisPC, TrisAcc, TrisMem,
  input  Clock, nReset
  );

timeunit 1ns;
timeprecision 100ps;

import opcodes::*;

logic [15:0] IR, ACC;
logic [11:0] PC;
logic [11:0] Operand, PC_mux_output;

wire  [15:0] ALU_output;

//
// ALU Instance
//
   alu ALU ( Zflag, ALU_output, ACC, SysBus, Function);

//
// Divide instruction into Opcode and Operand
//
   assign Opcode  = IR[15:12];
   assign Operand = IR[11:0];

//
// Drive SysBus as required
// (Operand and PC values are "zero extended" to give 16 bits)
//
   assign SysBus = (TrisOperand) ? {4'b0,Operand} : 'z;
   assign SysBus = (TrisPC)      ? {4'b0,PC}      : 'z;
   assign SysBus = (TrisAcc)     ? ACC            : 'z;
   assign SysBus = (TrisMem)     ? Data_in        : 'z;

//
// Multiplexor for PC update
//
   assign PC_mux_output = (SelInc) ? PC + 1 : Operand;

//
// Update Registers as required
//
   always_ff @(posedge Clock, negedge nReset)
      if (!nReset)
         begin
            ACC <= 0;
            IR  <= 0; // NOP
            PC  <= 0;
	 end
      else
         begin
            ACC <= #20 ALU_output;
            if (LoadIR) IR <= #20 SysBus;
            if (LoadPC) PC <= #20 PC_mux_output;
	 end
endmodule
