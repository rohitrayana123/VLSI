module datapath(
  inout [15:0]DataBus,
  output wire [11:0] AddressBus,
  output logic [3:0] Opcode,
  output logic Zflag,
  input  [3:0] Function,
  input SelInc, LoadPC, LoadIR, TrisOperand, TrisPC, TrisAcc,
  input Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

logic [15:0] IR, ACC;
logic [11:0] PC;
logic [11:0] Operand, PC_mux_output;

wire [15:0] ALU_output;

//
// ALU Instance
//
   alu ALU ( Zflag, ALU_output, ACC, DataBus, Function);

//
// Divide instruction into Opcode and Operand
//
   assign Opcode  = IR[15:12];
   assign Operand = IR[11:0];

//
// Drive AddressBus and DataBus as required
//
   assign AddressBus = (TrisOperand) ? Operand : 12'bz;
   assign AddressBus = (TrisPC)      ? PC      : 12'bz;

   assign DataBus  = (TrisAcc) ? ACC : 16'bz;

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
            if (LoadIR) IR <= #20 DataBus;
            if (LoadPC) PC <= #20 PC_mux_output;
	 end
endmodule
