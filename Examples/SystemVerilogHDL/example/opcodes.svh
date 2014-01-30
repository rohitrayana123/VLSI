package opcodes;

// Define ALU Function Codes:
//
typedef 
  enum logic [3:0] { FnACC, FnMem, FnADD, FnSUB, FnAND, FnOR, FnNOT, FnLSL, FnLSR }
  alu_functions_t;

// Define Opcodes:
//
//  these could be defined with a further enumerated type declaration
//  unfortunately this doesn't easily map to a situation where opcode lengths are variable
//
localparam NOP		= 4'd0;
localparam JMP		= 4'd1;
localparam JMPZ		= 4'd2;
localparam JMPNZ	= 4'd3;
localparam LDA		= 4'd4;
localparam ADD		= 4'd5;
localparam SUB		= 4'd6;
localparam AND		= 4'd7;
localparam OR		= 4'd8;
localparam NOT		= 4'd9;
localparam LSL		= 4'd10;
localparam LSR		= 4'd11;
localparam STA		= 4'd15;

endpackage
