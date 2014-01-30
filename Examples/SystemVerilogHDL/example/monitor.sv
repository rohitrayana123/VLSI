// This special monitor file is customized for the example cpu

// finish when the processor attempts to read an instruction from address 99
// 
//
//  (for your CPU you may need to change the termination address [99]
//   alternatively you may wish to delete this section altogether
//   and rely on the simulation termination for another reason
//  )
//
always @(posedge nME)
   if ( Address == 99 )
      begin
         $display("Terminating at address 99\n");
         @(posedge nME);
         $stop;
         $finish;
      end

// the logic, assignment and function declarations below
// provide text for display in the registers window of the
// simulation for the example processor
//
//  (for your CPU most of this will have to be customised)
//
logic [5:0][7:0] OpMnemonic_text;
logic [4:0][7:0] Function_text;
logic [7:0][7:0] AdMode_text;
logic [8:0][7:0] Zero_text;
logic [4:0][7:0] WR_text;
logic [12:0][7:0] Access_text;

assign OpMnemonic_text = get_opmnemonic(CPU.CPU_core.Opcode);
assign AdMode_text = get_admode(CPU.CPU_core.Opcode);
assign Function_text = get_alufunc(CPU.CPU_core.Function);
assign Zero_text = get_zero(CPU.CPU_core.Zflag);
assign WR_text = get_wr({!RnW, !nOE});
assign Access_text = get_access({!nSelRAM, !nSelLED, !nSelSwitch});

function [5:0][7:0] get_opmnemonic;
   input [3:0] opcode;
   case (opcode)
      NOP		: return "NOP";
      JMP		: return "JMP";
      JMPZ		: return "JMPZ";
      JMPNZ		: return "JMPNZ";
      LDA		: return "LDA";
      ADD		: return "ADD";
      SUB		: return "SUB";
      AND		: return "AND";
      OR		: return "OR";
      NOT		: return "NOT";
      LSL		: return "LSL";
      LSR		: return "LSR";
      STA		: return "STA";
      default	: return "*ERR*";
   endcase
endfunction

function [7:0][7:0] get_admode;
   input [3:0] opcode;
   case (opcode)
      NOP           : return "Inherent";
      JMP           : return "Absolute";
      JMPZ          : return "Absolute";
      JMPNZ         : return "Absolute";
      LDA           : return "Direct";
      ADD           : return "Direct";
      SUB           : return "Direct";
      AND           : return "Direct";
      OR            : return "Direct";
      NOT           : return "Inherent";
      LSL           : return "Inherent";
      LSR           : return "Inherent";
      STA           : return "Direct";
      default        : return "*ERR*";
   endcase
endfunction

function [4:0][7:0] get_alufunc;
   input [3:0] fncode;
   case (fncode)
      FnACC		: return " A";
      FnMem		: return " M";
      FnADD		: return " A+M";
      FnSUB		: return " A-M";
      FnAND		: return " A&M";
      FnOR		: return " A|M";
      FnNOT		: return " ~A";
      FnLSL		: return " A<<1";
      FnLSR		: return " A>>1";
      default	: return "*ERR*";
   endcase
endfunction

function [8:0][7:0] get_zero;
   input flag;
   case (flag)
      0	: return "ACC<>Zero";
      1	: return "ACC==Zero";
      default	: return "*ERR*";
   endcase
endfunction

function [4:0][7:0] get_wr;
   input [1:0] signal;
   case (signal)
      2'b10	: return "write";
      2'b01	: return "read";
      2'b00	: return "     ";
      default: return "*ERR*";
   endcase
endfunction

function [12:0][7:0] get_access;
   input [2:0] signal;
   case (signal)
      3'b100	: return "   RAM Access";
      3'b010	: return "   LED Access";
      3'b001	: return "Switch Access";
      3'b000	: return "     ";
      default: return "*ERR*";
   endcase
endfunction


function [8:1] itoa_4;
  input [3:0] val;
  if ( val < 10 )  
    return "0"+val;
  else if ( val >= 10 )
    return "A"-10+val;
  else
    return "X";
endfunction

function [3:0][7:0] itoa;
  input [15:0] val;
  return {itoa_4(val[15:12]),
          itoa_4(val[11:8]),
	  itoa_4(val[7:4]),
	  itoa_4(val[3:0])};
endfunction

function [11:0] get_operand;
   input [15:0] instruction;
   return instruction[11:0];
endfunction

function [5:0][7:0]  get_mnemonic;
   input [15:0] instruction;
   return get_opmnemonic(instruction[15:12]);
endfunction

function [7:0] get_digit_zero;
  input [15:0] number;
  return "0" + (number%10);
endfunction

function [7:0] get_digit;
  input [15:0] number;
  if ( number > 0 )
    return get_digit_zero(number);
  else
    return " ";
endfunction

function [10:0][7:0] disassemble;
  input [15:0] instruction;
  return {
    get_mnemonic(instruction)," ",
    get_digit(instruction[11:0]/1000),
    get_digit(instruction[11:0]/100),
    get_digit(instruction[11:0]/10),
    get_digit_zero(instruction[11:0])
  };
endfunction

reg [10:0][7:0] DisassemblyListing [ 255:0 ];
integer i;
initial
  begin
    #1 for ( i = 0; i < 256; i = i + 1 )
      DisassemblyListing[i] = disassemble(RAM.Data_stored[i]);
  end

