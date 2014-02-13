///////////////////////////////////////////////////////////////////////
//
// code_mem module
//     This module is used to perform a simple program assembly
//
//
///////////////////////////////////////////////////////////////////////

`ifdef prog_file
  // already defined - do nothing
`else
  `define prog_file  "program.hex"
`endif

module code_mem();

timeunit 1ns;
timeprecision 100ps;

import opcodes::*;

logic [15:0] Data_stored [ 0 : 255 ];

  initial
    begin
      // DATA - variables stored in RAM
      localparam VAR_X = 12'd256;
      localparam VAR_Y = 12'd257;
      // DATA - i/o in i/o module
      localparam SWITCHES = 12'h800;
      localparam LEDS = 12'h801;
      // DATA - constants stored here in rom
      localparam CONST_0 = 12'd20;
      localparam CONST_1 = 12'd21;
      Data_stored[20] = {16'd0};
      Data_stored[21] = {16'd1};

      // CODE:
      Data_stored[0] = {LDA,SWITCHES};
      Data_stored[1] = {STA,VAR_X};

      Data_stored[2] = {SUB,CONST_1};	// .loop
      Data_stored[3] = {JMPZ,12'd9};	// If Accumulator = 0 then Jump .done
      Data_stored[4] = {STA,VAR_Y};
      Data_stored[5] = {ADD,VAR_X};
      Data_stored[6] = {STA,VAR_X};
      Data_stored[7] = {LDA,VAR_Y};
      Data_stored[8] = {JMP,12'd2};		// Jump .loop
      Data_stored[9] = {LDA,VAR_X};	// .done
      Data_stored[10] = {STA,LEDS};
      Data_stored[11] = {JMP,12'd99};	// Jump .end

      Data_stored[99] = {JMP,12'd99};	// .end

      $writememh( `prog_file, Data_stored );

    end


endmodule

