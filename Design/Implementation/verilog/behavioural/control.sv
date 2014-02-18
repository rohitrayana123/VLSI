module control(
   output logic                     Ale,
   output logic                     Enb,
   output opcodes::alu_functions_t  AluOp, 
   output logic   [1:0]             Op2Sel, 
   output logic                     Op1Sel, 
   output logic                     Rw,
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
   output logic                     MemEn,
   input  opcodes::pc_select_t      PcSel,
   input  wire    [7:0]             OpCode,
   input  wire                      Z,
   input  wire                      Clock,
   input  wire                      nReset
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

enum {
   fetch,
   decode,
   execute
}  state;

enum {
   addrLatch,
   irGet       
}  fetchSub;

always_ff@(posedge Clock or negedge nReset) begin
   // Major states
   if(!nReset) 
      state <= fetch; 
   else        
      case(state) 
         fetch    :  if(fetchSub == irGet)
                        state <= decode;
         decode   :  state <= execute;
         execute  :  state <= fetch;
         default  :  state <= fetch;
      endcase
   // Fetch
   if(!nReset) 
      fetchSub <= addrLatch;
   else     
      if(state == fetch)
         case(fetchSub)
            addrLatch   : fetchSub <= irGet;
            irGet       : fetchSub <= addrLatch;
            default     : fetchSub <= addrLatch;
         endcase
   // Execute 
   if(state == execute) begin
      state <= fetch;
      case(OpCode)
         NOP   :  state <= fetch;
         ADD   :  AluOp <= FnADD; 
         ADDI  :  AluOp <= FnADD; 
         ADDIB :  AluOp <= FnADD; 
         ADC   :  AluOp <= FnADD;  
         ADCI  :  AluOp <= FnADD; 
      endcase
   end
end

//always_comb begin
//   Ale   <= 0;
//   Enb   <= 0;
//   PcEn  <= 0;
//   IrWe  <= 0;
//   RegWe <= 0;
//   case(state) 
//      fetch    :
//         case(fetchSub)
//            addrLatch   : begin
//               Ale   <= 1;
//               Enb   <= 1;
//               PcEn  <= 1;
//            end
//            irGet       : begin
//               IrWe  <= 1; 
//            end
//         endcase
//      execute  :
//         case(OpCode)
//            NOP   :  begin
//                        
//                     end
//            ADD   :  begin 
//                        AluOp  <= FnADD;
//                     end
//            ADDI  :  begin
//                        AluOp  <= FnADD;
//                     end
//            ADDIB :  begin
//                        AluOp  <= FnADD;
//                     end
//            ADC   :  begin
//                        AluOp  <= FnADD;
//                     end
//            ADCI  :  begin
//                        AluOp  <= FnADD;
//                     end
//         endcase
//   endcase
//end


endmodule
