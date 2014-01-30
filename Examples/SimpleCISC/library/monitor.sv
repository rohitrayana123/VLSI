always @(posedge Clock)
   if ( Processor.Datapath.PC == 99 )
      begin
         $display("Terminating at instruction 99\n");
         @(posedge Clock);
         @(posedge Clock);
         $stop;
         $finish;
      end

// finish after `sim_time if not already terminated at instruction 99
initial
   begin
      `ifdef sim_time
      `else
         `define sim_time 500us
      `endif
      #`sim_time
      $display("Too long - giving up");
      $stop;
      $finish;
   end

   function [3:0][7:0] get_opmnemonic;
      input [11:0] opcode;
      case (opcode)
         NOP           : get_opmnemonic = "NOP";
         BA            : get_opmnemonic = "BA";
         BEQ           : get_opmnemonic = "BEQ";
         BNE           : get_opmnemonic = "BNE";
         LDX           : get_opmnemonic = "LDX";
         LDS           : get_opmnemonic = "LDS";
         LDA           : get_opmnemonic = "LDA";
         ADD           : get_opmnemonic = "ADD";
         SUB           : get_opmnemonic = "SUB";
         AND           : get_opmnemonic = "AND";
         OR            : get_opmnemonic = "OR";
         COM           : get_opmnemonic = "COM";
         LSL           : get_opmnemonic = "LSL";
         LSR           : get_opmnemonic = "LSR";
         STA           : get_opmnemonic = "STA";
         STX           : get_opmnemonic = "STX";
         STS           : get_opmnemonic = "STS";
         default        : get_opmnemonic = "****";
      endcase
   endfunction

   function [3:0][7:0]  get_mnemonic;
      input [15:0] instruction;
      get_mnemonic = get_opmnemonic(instruction[15:4]);
   endfunction

   logic [3:0][7:0] Mnemonic;
   assign Mnemonic = get_mnemonic(Processor.IR);


   function [6:0][7:0] get_fetch;
      input fetch;
      get_fetch = (fetch) ? "Fetch" : "";
   endfunction

   logic [6:0][7:0] Fetch;
   assign Fetch = get_fetch(Processor.Control.fetch);


   function [6:0][7:0] get_opfetch;
      input op_fetch;
      get_opfetch = (op_fetch) ? "OpFetch" : "";
   endfunction

   logic [6:0][7:0] OpFetch;
   assign OpFetch = get_opfetch(Processor.Control.op_fetch);


   function [6:0][7:0] get_execute;
      input execute;
      get_execute = (execute) ? "Execute" : "";
   endfunction

   logic [6:0][7:0] Execute;
   assign Execute = get_execute(Processor.Control.execute);

   function [4:0][7:0] get_wnr;
      input signal;
      case (signal)
         0	: get_wnr = "read";
         1	: get_wnr = "write";
         default	: get_wnr = "*ERR*";
      endcase
   endfunction

   logic [4:0][7:0] Memory_Operation;
   assign Memory_Operation = get_wnr(Processor.Mem_Write);

