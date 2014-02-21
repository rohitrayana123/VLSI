module control(
   output opcodes::alu_functions_t  AluOp, 
   output logic   [1:0]             Op1Sel, 
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
assign Opcode = OpcodeCondIn[9:5];

enum {
   fetch,
   execute
}  state;

enum {
   latch1,
   latch2,
   latch3,
   latch4,
   irGet       
}  fetchSub;

always_ff@(posedge Clock or negedge nReset) begin
   // Major states
   if(!nReset) begin
      state <= #20 fetch; 
      fetchSub <= #20 latch1;
   end else begin 
      case(state) 
         fetch    :  if(fetchSub == irGet)   state <= #20 execute;
         execute  :  state <= #20 fetch;
         default  :  state <= #20 fetch;
      endcase
      // Fetch  
      if(state == fetch)
         case(fetchSub)
            latch1   : fetchSub <= #20 latch2;
            latch2   : fetchSub <= #20 latch3;
            latch3   : fetchSub <= #20 latch4;
            latch4   : fetchSub <= #20 irGet;
            irGet    : fetchSub <= #20 latch1;
            default  : fetchSub <= #20 latch1;
         endcase
      // Execute 
      if(state == execute) begin
         state <= #20 fetch;
         case(Opcode)
            NOP   :  AluOp <= #20 FnNOP;
            ADD   :  AluOp <= #20 FnADD; 
            ADDI  :  AluOp <= #20 FnADD; 
            ADDIB :  AluOp <= #20 FnADD; 
            ADC   :  AluOp <= #20 FnADD;  
            ADCI  :  AluOp <= #20 FnADD; 
         endcase
      end
   end
end

always_comb begin
   // Default outputs    
   Op2Sel   = 0; 
   Op1Sel   = 0; 
   AluEn    = 0;
   SpEn     = 0;
   SpWe     = 0;
   LrEn     = 0;
   LrWe     = 0;
   PcWe     = 0;
   PcEn     = 0;
   IrWe     = 0;
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
            latch1:begin
            // 	MemEn = 1;
		nME = 1; //Memory enable
		ALE = 1; //Address Latch
		PcEn  = 1; //output the PC to SysBus
		nOE   = 1; //don't want the memory to use the bus
		nWE = 1;
            end
            latch2:begin
               //MemEn = 1;
              	nWE   = 1;
               	nOE   = 1;
		PcEn  = 1;
            end 
            latch3:begin
                nWE   = 1;
               //nOE   = 1;//want to output on the bus to 
		ENB  = 1;
		MemEn = 1; //outside onto sysbus
		IrWe = 1; //want to write to Ir
            end
            latch4:begin
		//nME = 1;
		MemEn = 1;
		ENB = 1;
               nWE   = 1;
		IrWe  = 1;
            end 
            irGet:begin
               MemEn = 1;
               ENB   = 1; // Pad to read in
               IrWe  = 1; // Write to IR
            end
         endcase
   endcase
end


endmodule
