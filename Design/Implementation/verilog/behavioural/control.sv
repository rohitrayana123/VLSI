module control(
   output opcodes::alu_functions_t  AluOp, 
   output opcodes::Op1_select_t     Op1Sel, 
   output logic                     Op2Sel, 
   output logic                     AluEn,
   output logic                     SpEn,
   output logic                     SpWe,
   output logic                     LrEn,
   output logic                     LrWe,
   output logic                     PcWe,
   output logic                     PcEn,
   output logic                     IrWe,
   output logic                     WdSel,
   output logic                     ImmSel,
   output logic                     RegWe,
   output opcodes::pc_select_t      PcSel,
   output logic                     MemEn,   // Pad control 
   output logic                     nWE,     // To memory map
   output logic                     nOE,
   output logic                     nME,
   output logic                     ENB,
   output logic                     ALE,
   output logic                     CFlag,
   output logic                     LrSel,
   output logic                     Rs1Sel,
   output logic                     AluWe,
   input  wire    [9:0]             OpcodeCondIn,
   input  wire    [3:0]             Flags,
   input  wire                      Clock,
   input  wire                      nReset
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

Opcode_t Opcode;

assign Opcode = OpcodeCondIn[7:3]; // This assignment is a violation of SystemVerilog strong typing rules for enumeration datatypes.

enum {
   fetch,
   execute
}  state;
enum {
   fet1,
   fet2,
   fet3,
   fet4       
}  fetchSub;
enum {
   exe1,
   exe2,
   exe3,
   exe4
}  executeSub;

always_ff@(posedge Clock or negedge nReset) begin
   // Major states
   if(!nReset) begin
      state <= #20 fetch;
      fetchSub <= #20 fet1;
      executeSub <= #20 exe1;
   end else begin 
      // Fetch  
      if(state == fetch)
         case(fetchSub)
            fet1: fetchSub <= #20 fet2;
            fet2: fetchSub <= #20 fet3;
            fet3: fetchSub <= #20 fet4;
            fet4: begin
                     state <= #20 execute;
                     fetchSub <= #20 fet1;
                     executeSub <= #20 exe1;
                  end
            default: fetchSub <= #20 fet1;
         endcase
      // Execute     
      if(state == execute) begin
         state <= #20 fetch;
         case(executeSub)
            exe1: case(Opcode)
                     ADD,
                     ADDI,
                     ADDIB,
                     ADC,
                     ADCI: state <= #20 fetch;
                     STW: executeSub <= exe2;
                  endcase
            exe2: case(Opcode)
                     STW: executeSub <= exe3;
                  endcase
            exe3: case(Opcode)
                     STW: executeSub <= exe4;
                  endcase
            exe4: case(Opcode)
                     STW: state <= fetch;
                  endcase
         endcase
      end
   end
end

always_comb begin
   // Default outputs   
   AluOp    = FnNOP;
   AluWe    = 0;
   Op2Sel   = 0; 
   Op1Sel   = Op1Rd1; 
   AluEn    = 0;
   SpEn     = 0;
   SpWe     = 0;
   LrEn     = 0;
   LrWe     = 0;
   LrSel    = 0;
   PcWe     = 0;
   PcEn     = 0;
   IrWe     = 0;
   Rs1Sel   = 0;
   WdSel    = 0;
   ImmSel   = 0;
   RegWe    = 0;
   MemEn    = 0;
   nWE      = 0;
   nOE      = 0;
   nME      = 0;
   ENB      = 0;
   ALE      = 0;
   case(state)
      fetch : 
         case(fetchSub)
            fet1: begin ALE = 1; nME = 1; nWE  = 1; nOE  = 1; PcEn  = 1; end 
            fet2: begin nWE = 1; MemEn = 1; end
            fet3: begin MemEn = 1; ENB = 1; nWE   = 1; end 
            fet4: begin nME = 1; nWE = 1; MemEn = 1; IrWe  = 1; end
         endcase
      execute: begin
         case(executeSub)
            exe1: begin    // Single cycle ops
               nME = 1;    // Memory enable
		         PcEn = 1;   // output the PC to SysBus
               case(Opcode)
                  ADD:  begin
                           AluOp = FnADD;
                           Op1Sel = Op1Rd1;
                           Op2Sel = 1;
                           RegWe = 1;
                           PcWe = 1;
                           PcSel = Pc1;
                        end
                  ADDI: begin
                           AluOp = FnADD;
                           Op1Sel = Op1Rd1;
                           ImmSel = 1;
                           RegWe = 1;
                           PcWe = 1;
                           PcSel = Pc1;
                        end
                  ADDIB:begin
                           AluOp = FnADD;
                           Op1Sel = Op1Rd1;
                           ImmSel = 1;
                           Rs1Sel = 1;
                           RegWe = 1;
                           PcWe = 1;
                           PcSel = Pc1;
                        end
                  ADC:  begin
                           AluOp = FnADC;
                           Op1Sel = Op1Rd1;
                           RegWe = 1;
                           PcWe = 1;
                           PcSel = Pc1;
                        end
                  ADCI:  begin
                           AluOp = FnADC;
                           Op1Sel = Op1Rd1;
                           RegWe = 1;
                           PcWe = 1;
                           PcSel = Pc1;
                        end
                  STW:  begin
                           
                        end
               endcase
            end
         exe2: begin
               
            end
         exe3: begin
            end
         exe4: begin
            end
         endcase
      end
   endcase
end
endmodule
