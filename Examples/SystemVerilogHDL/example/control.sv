module control(
  output opcodes::alu_functions_t Function,
  output logic SelInc, LoadPC, LoadIR, TrisOperand, TrisPC, TrisAcc, TrisMem,
  output logic ENB, nME, ALE, RnW, nOE,
  input [3:0] Opcode,
  input Zflag, nWait, Clock, nReset
  );

timeunit 1ns;
timeprecision 100ps;

import opcodes::*;

enum logic {Fetch=0, Execute=1} state;

//
// Gray code counting sequence for sub-state (0 1 3 2)
// this ensures no glitches on the memory timing signals
// and allows for a very simple implementation in hardware
//

enum logic  [1:0] {Addr_Setup=0, Addr_Hold=1, Data_Setup=3, Data_Hold=2} sub_state;

wire Branch, IncPC, Mem_Write;

//
// Define state machine
//    All instructions complete in exactly 8 clock cycles
//    state is Fetch or Execute
//    sub_state controls memory cycle
//
   always_ff @(posedge Clock, negedge nReset)
      if (!nReset)
         begin
            state     <= Fetch; // Fetch == 0
            sub_state <= Addr_Setup; // Addr_Setup == 0
         end
      else
         begin

            if ( sub_state == Data_Hold )
	       if ( state == Fetch )
	          state <= #20 Execute;
               else // Execute
	          state <= #20 Fetch;

	    case (sub_state)
	       Addr_Setup:  sub_state <= #20 Addr_Hold;
	       Addr_Hold:   sub_state <= #20 Data_Setup;
	       Data_Setup:  if (nWait == 1) sub_state <= #20 Data_Hold;
	       Data_Hold:   sub_state <= #20 Addr_Setup;
            endcase

         end

//
// Identify memory write and generate memory control signals
//
   assign Mem_Write = (Opcode == STA) && (state == Execute);

   assign nME	=  ( sub_state == Addr_Setup ) ||
		   ( sub_state == Data_Hold );
   assign ALE	=  ( sub_state == Addr_Setup );
   assign RnW	=  ( sub_state == Addr_Setup ) ||
		   ( sub_state == Addr_Hold ) || ~Mem_Write;
   assign nOE	=  ( sub_state == Addr_Setup ) ||
		   ( sub_state == Addr_Hold ) || Mem_Write;
   assign ENB	=  ~nOE;

//
// Generate tri-state contol signals for SysBus
//    SysBus is driven by exactly one driver in each cycle
//
   assign TrisOperand	=  ( state == Execute ) &&
			   (( sub_state == Addr_Setup ) ||
			   ( sub_state == Addr_Hold ));
   assign TrisPC	=  (state == Fetch) &&
			   (( sub_state == Addr_Setup ) ||
			   ( sub_state == Addr_Hold ));
   assign TrisAcc	=  (( sub_state == Data_Setup ) && Mem_Write) ||
			   ( sub_state == Data_Hold );
   assign TrisMem	=  ( sub_state == Data_Setup ) && ~Mem_Write;

//
// Generate ALU control
//
   assign Function =
     ((state == Execute) && (sub_state == Data_Setup) && (nWait == 1)) ?
				decodeFn(Opcode) : FnACC;

//
// Identify successful control transfers and PC increment
//
   assign Branch =
     (state == Execute) && ( sub_state == Data_Setup) && (nWait == 1) &&
   			((Opcode ==JMP) ||
			 ((Opcode ==JMPZ) && (Zflag == 1)) ||
			 ((Opcode ==JMPNZ) && (Zflag == 0))
			);

   assign IncPC = ((state == Fetch) && ( sub_state == Data_Hold ));

//
// Generate PC update multiplexor control signal
//
   assign SelInc = IncPC;

//
// Generate Register Load Signals
//
   assign LoadIR =
     ((state == Fetch) && (sub_state == Data_Setup) && (nWait == 1));
   assign LoadPC = IncPC || Branch;

//
// Decode Opcode to create ALU Function code
//
   function alu_functions_t decodeFn;
      input [3:0] opcode;
      case (opcode)
         LDA		: return FnMem;
         ADD		: return FnADD;
         SUB		: return FnSUB;
         AND		: return FnAND;
         OR		: return FnOR;
         NOT		: return FnNOT;
         LSL		: return FnLSL;
         LSR		: return FnLSR;
         default	: return FnACC;
      endcase
   endfunction

endmodule
