module control(
  output logic [3:0] Function,
  output logic UpdateZ,
  output logic EnableACC, LoadACC, EnableX, LoadX, EnableS, LoadS,
  output logic EnablePC, LoadPC, IncPC, SelPC, LoadIR, LoadMAR, EnableReg,
  output logic Mem_Write,
  input [15:0] IR,
  input ZReg, Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

import opcodes::*;

logic [1:0] state;

logic [1:0] phase;
logic fetch, op_fetch, execute;

logic [11:0] Opcode;
logic [3:0] inst_type;
logic [1:0] src_field, dest_field;
logic [3:0] alu_field;
logic [3:0] addressing_mode;

logic Branch;

//
// Define state machine
//
  always_ff @(posedge Clock, negedge nReset)
     if (!nReset)
        state <= 0;
     else
        if (state == 1)
           state <= #20 2;
        else if ((state == 2) &&
	        ((addressing_mode == DIRECT) || (addressing_mode == INDEXED)))
            state <= #20 3;
        else // execute cycle
            state <= #20 1;

//
// Divide instruction into fields
//
   assign Opcode  = IR[15:4];
   assign inst_type  = IR[15:12];
   assign src_field  = IR[11:10];
   assign dest_field  = IR[9:8];
   assign alu_field  = IR[7:4];
   assign addressing_mode  = IR[3:0];

//
// Decode phase control signals
//
   assign fetch = ( state == 1 );
   assign op_fetch = ( state == 2 ) && (addressing_mode != INHERENT);
   assign execute = (( state == 2 ) && (addressing_mode == INHERENT)) ||
                    (( state == 2 ) && (addressing_mode == IMMEDIATE)) ||
                    (( state == 2 ) && (addressing_mode == PC_RELATIVE)) ||
                     ( state == 3 );

//
// Generate memory write signal
//
   assign Mem_Write = (inst_type == store_inst) & (execute);

//
// Generate tri-state contol signals for RegBus and DataBus
//
   assign EnableACC = !EnableX &&  !EnableS &&  !EnablePC;
   assign EnableX   = (execute && (src_field == Xn)) ||
                      (op_fetch && (addressing_mode == INDEXED));
   assign EnableS   = execute && (src_field == Sn);
   assign EnablePC  = execute && (src_field == PCn);

   assign EnableReg = Mem_Write;
    
//
// Generate ALU control
//
   assign Function = (execute && (inst_type == alu_inst))? alu_field :
                    (execute && (inst_type == load_inst))? alu_field :
                    (op_fetch && (addressing_mode == DIRECT)) ? FnMem :
                    FnADD;

//
// Identify successful control transfers and PC increment
//
   assign Branch = (execute) && ((Opcode ==BA) ||
                               ((Opcode ==BEQ) && (ZReg == 1)) ||
                               ((Opcode ==BNE) && (ZReg == 0)));

   assign IncPC   = ((fetch) || (op_fetch)) && !Branch;

//
// Generate Address multiplexor control signal
//
   assign SelPC = (fetch) || (op_fetch);

//
// Generate Register Load Signals
//
   assign UpdateZ = (execute && (inst_type == alu_inst));

   assign LoadACC = execute && (dest_field == ACCn) &&
                     ((inst_type == alu_inst) || (inst_type == load_inst));
   assign LoadX   = execute && (dest_field == Xn) &&
                     ((inst_type == alu_inst) || (inst_type == load_inst));
   assign LoadS   = execute && (dest_field == Sn) &&
                     ((inst_type == alu_inst) || (inst_type == load_inst));
   assign LoadIR  = fetch;
   assign LoadMAR = (op_fetch) &&
             ((addressing_mode == DIRECT) || (addressing_mode == INDEXED));
   assign LoadPC  = Branch;

endmodule
