///////////////////////////////////////////////////////////////////////
//
// code_mem module
//     This module is used to perform a simple program assembly
//
//
///////////////////////////////////////////////////////////////////////

`include "opcodes.sv"
`ifdef prog_file
  // already defined - do nothing
`else
  `define prog_file  "program.hex"
`endif

module code_mem();

reg [15:0] Data_stored [ 0 : 255 ];

initial
   begin
      //
      // multiply program for simple processor
      //

      // Define locations of I/O devices 2048,2049
      `define SWITCHES  12'd2048
      `define LEDS      12'd2049

      // Define locations of variables 256-258
      `define VAR_Op1      12'd256
      `define VAR_Op2      12'd257
      `define VAR_Res      12'd258

      // Define locations of constants 50-52
      `define CONST_0   12'd50
      `define CONST_1   12'd51
      `define CONST_255 12'd52
      Data_stored[50] = {16'd0};
      Data_stored[51] = {16'd1};
      Data_stored[52] = {16'd255};

      // CODE:
      Data_stored[0] = {`LDA,`SWITCHES};  // copy low byte to Operand1
      Data_stored[1] = {`AND,`CONST_255};
      Data_stored[2] = {`STA,`VAR_Op1};

      Data_stored[3] = {`LDA,`SWITCHES};  // copy high byte to Operand2
      Data_stored[4] = {`LSR,12'd0};
      Data_stored[5] = {`LSR,12'd0};
      Data_stored[6] = {`LSR,12'd0};
      Data_stored[7] = {`LSR,12'd0};
      Data_stored[8] = {`LSR,12'd0};
      Data_stored[9] = {`LSR,12'd0};
      Data_stored[10] = {`LSR,12'd0};
      Data_stored[11] = {`LSR,12'd0};
      Data_stored[12] = {`STA,`VAR_Op2};

      Data_stored[13] = {`LDA,`CONST_0};  // copy zero to Result
      Data_stored[14] = {`STA,`VAR_Res};

      // .loop
      Data_stored[15] = {`LDA,`VAR_Op2};  // Acc <- Op2
      Data_stored[16] = {`JMPZ,12'd23};   // If Acc = 0 then Jump .done

      Data_stored[17] = {`SUB,`CONST_1};  // decrement Operand2
      Data_stored[18] = {`STA,`VAR_Op2};

      Data_stored[19] = {`LDA,`VAR_Res};  // Result <- Result + Operand1
      Data_stored[20] = {`ADD,`VAR_Op1};
      Data_stored[21] = {`STA,`VAR_Res};
    
      Data_stored[22] = {`JMP,12'd15};    // Jump .loop

      // .done
      Data_stored[23] = {`LDA,`VAR_Res};  // copy Result to LEDs
      Data_stored[24] = {`STA,`LEDS};

      Data_stored[25] = {`JMP,12'd99};    // Jump .end

      // .end
      Data_stored[99] = {`JMP,12'd99};    // Jump .end

      $writememh( `prog_file, Data_stored );

   end


endmodule

