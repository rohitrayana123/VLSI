module control(
  output logic [3:0] Function,
  output logic SelInc, LoadPC, LoadIR, TrisOperand, TrisPC, TrisAcc,
  output Mem_Write,
  input [3:0] Opcode,
  input Zflag, Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

enum logic { FETCH = 0, EXECUTE = 1 } state;

logic Branch, IncPC;

//
// Define state machine
//
   always_ff @(posedge Clock, negedge nReset)
      if (!nReset)
         state <= FETCH;
      else
         if (state == FETCH)
            state <= #20 EXECUTE;
         else // EXECUTE
            state <= #20 FETCH;

//
// Generate memory write signal
//
   assign Mem_Write = (Opcode == STA) && (state == EXECUTE);

//
// Generate tri-state contol signals for AddressBus and DataBus
//
   assign TrisOperand = (state == EXECUTE);
   assign TrisPC      = (state == FETCH);

   assign TrisAcc     = (Opcode == STA) && (state == EXECUTE);

//
// Generate ALU control
//
   assign Function = (state == EXECUTE) ?
				decodeFn(Opcode) : FnACC;

//
// Identify successful control transfers and PC increment
//
   assign Branch = (state == EXECUTE) &&
   			((Opcode ==JMP) ||
			 ((Opcode ==JMPZ) && (Zflag == 1)) ||
			 ((Opcode ==JMPNZ) && (Zflag == 0))
			);

   assign IncPC  = (state == FETCH);

//
// Generate PC update multiplexor control signal
//
   assign SelInc = IncPC;

//
// Generate Register Load Signals
//
   assign LoadIR = (state == FETCH);
   assign LoadPC = IncPC || Branch;

//
// Decode Opcode to create ALU Function code
//
   function [3:0] decodeFn;
      input [3:0] opcode;
      case (opcode)
         LDA		: decodeFn = FnMem;
         ADD		: decodeFn = FnADD;
         SUB		: decodeFn = FnSUB;
         AND		: decodeFn = FnAND;
         OR		: decodeFn = FnOR;
         NOT		: decodeFn = FnNOT;
         LSL		: decodeFn = FnLSL;
         LSR		: decodeFn = FnLSR;
         default	: decodeFn = FnACC;
      endcase
   endfunction

endmodule
