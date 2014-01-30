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

   // status interpretation

   function [5:0][7:0] get_mnemonic;
      input [3:0] opcode;
      case (opcode)
         NOP		: get_mnemonic = "NOP";
         JMP		: get_mnemonic = "JMP";
         JMPZ		: get_mnemonic = "JMPZ";
         JMPNZ		: get_mnemonic = "JMPNZ";
         LDA		: get_mnemonic = "LDA";
         ADD		: get_mnemonic = "ADD";
         SUB		: get_mnemonic = "SUB";
         AND		: get_mnemonic = "AND";
         OR		: get_mnemonic = "OR";
         NOT		: get_mnemonic = "NOT";
         LSL		: get_mnemonic = "LSL";
         LSR		: get_mnemonic = "LSR";
         STA		: get_mnemonic = "STA";
         default	: get_mnemonic = "*ERR*";
      endcase
   endfunction

   logic [5:0][7:0] Mnemonic;
   assign Mnemonic = get_mnemonic(Processor.Control.Opcode);

   function [5:0][7:0]  extract_mnemonic;
      input [15:0] instruction;
      extract_mnemonic = get_mnemonic(instruction[15:12]);
   endfunction

   function [4:0][7:0] get_alufunc;
      input [3:0] fncode;
      case (fncode)
         FnACC		: get_alufunc = " A";
         FnMem		: get_alufunc = " M";
         FnADD		: get_alufunc = " A+M";
         FnSUB		: get_alufunc = " A-M";
         FnAND		: get_alufunc = " A&M";
         FnOR		: get_alufunc = " A|M";
         FnNOT		: get_alufunc = " ~A";
         FnLSL		: get_alufunc = " A<<1";
         FnLSR		: get_alufunc = " A>>1";
         default	: get_alufunc = "*ERR*";
      endcase
   endfunction

   logic [4:0][7:0] ALU_Function;
   assign ALU_Function = get_alufunc(Processor.Datapath.Function);

   function [11:0] get_operand;
      input [15:0] instruction;
      get_operand = instruction[11:0];
   endfunction

   function [8:0][7:0] get_zero;
      input flag;
      case (flag)
         0	: get_zero = "ACC<>Zero";
         1	: get_zero = "ACC==Zero";
         default	: get_zero = "*ERR*";
      endcase
   endfunction

   logic [8:0][7:0] Zero_String;
   assign Zero_String = get_zero(Processor.Zflag);

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

   function [7:0] get_digit_zero;
      input [15:0] number;
      get_digit_zero = "0" + (number%10);
   endfunction
   function [7:0] get_digit;
      input [15:0] number;
      if ( number > 0 )
        get_digit = get_digit_zero(number);
      else
        get_digit = " ";
   endfunction

   function [9:0][7:0] disassemble;
      input [15:0] instruction;
      disassemble = {
        get_mnemonic(instruction[15:12]),
        get_digit(instruction[11:0]/1000),
        get_digit(instruction[11:0]/100),
        get_digit(instruction[11:0]/10),
        get_digit_zero(instruction[11:0])
      };
   endfunction

   logic [9:0][7:0] InstructionText;
   assign InstructionText = disassemble(Processor.Datapath.IR);


   logic [9:0][7:0] DisassemblyListing [ 255:0 ];
   integer i;
   initial
      begin
         #1ns for ( i = 0; i < 256; i = i + 1 )
	   DisassemblyListing[i] = disassemble(Processor.Memory.Data_stored[i]);
      end


