module control(
   output logic            Ale,
   output logic            Enb,
   output logic   [4:0]    AluOp, 
   output logic   [1:0]    Op2Sel, 
   output logic            Op1Sel, 
   output logic            Rw,
   output logic            AluEn,
   output logic            SpEn,
   output logic            SpWe,
   output logic            LrEn,
   output logic            LrWe,
   output logic            PcWe,
   output logic   [1:0]    PcSel,
   output logic            PcEn,
   output logic            IrWe,
   output logic            WdSel,
   output logic            ImmSel,
   output logic            RegWe,
   output logic            MemEn,
   input  wire    [7:0]    OpCode,
   input  wire             Z,
   input  wire             Clock,
   input  wire             nReset
);

timeunit 1ns; timeprecision 100ps;

enum {
   fetch,
   decode,
   execute
}  state;

enum {
   addrLatch,
   irGet       
}  fetchSub;
enum {
   doing,
   done        
}  executeSub;

always_ff@(posedge Clock or negedge nReset) begin
   // Major states
   if(!nReset) 
      state <= fetch; 
   else        
      case(state) 
         fetch    :  if(fetchSub == irGet)
                        state <= decode;
         decode   :  state <= execute;
         execute  :  if(executeSub == done)
                        state <= fetch;
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
   if(!nReset)
      executeSub <= doing;
   else
      if(state == execute)
         case(executeSub)
            doing       : executeSub <= done;
            done        : executeSub <= doing;
         endcase
end

always_comb begin
   Ale   <= 0;
   Enb   <= 0;
   PcEn  <= 0;
   IrWe  <= 0;
   RegWe <= 0;
   case(state) 
      fetch    :
         case(fetchSub)
            addrLatch   : begin
               Ale   <= 1;
               Enb   <= 1;
               PcEn  <= 1;
            end
            irGet       : begin
               IrWe  <= 1; 
            end
         endcase
      execute  :
         case(OpCode)
            0 : begin
               Op1Sel <= 1;
               Op2Sel <= 1;
               WdSel  <= 1;
               AluOp  <= 5'h1F;
            end 
         endcase
   endcase
end


endmodule
