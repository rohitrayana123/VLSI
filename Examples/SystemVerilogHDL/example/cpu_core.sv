///////////////////////////////////////////////////////////////////////
//
// cpu_core module
//
///////////////////////////////////////////////////////////////////////


module cpu_core(
  output wire  [15:0] Data_out,
  output wire  ENB,
  output wire  nME, ALE, RnW, nOE, SDO,
  input [15:0] Data_in,
  input nIRQ, nWait,
  input Test, SDI, Clock, nReset
  );

timeunit 1ns;
timeprecision 100ps;

import opcodes::*;


wire alu_functions_t Function;
wire [3:0] Opcode;

//
// This system doesn't simulate the scan path
//
assign SDO = SDI;

//
// This system is built from two smaller modules
//

control Control ( Function, SelInc, LoadPC, LoadIR,
                TrisOperand, TrisPC, TrisAcc, TrisMem,
                ENB, nME, ALE, RnW, nOE,
		Opcode, Zflag, nWait, Clock, nReset );

datapath Datapath ( Data_out, Opcode, Zflag,
                Data_in, Function, SelInc, LoadPC, LoadIR, 
                TrisOperand, TrisPC, TrisAcc, TrisMem,
                Clock, nReset );


endmodule
