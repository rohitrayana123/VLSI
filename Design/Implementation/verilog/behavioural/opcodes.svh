package opcodes;

// Define ALU Function Codes:
//
typedef 
  enum logic [3:0] { FnNOP, FnACC, FnMem, FnADD, FnSUB, FnAND, FnOR, FnNOT, FnLSL, FnLSR }
  alu_functions_t;

//Program Counter Selction Codes
typedef enum logic [1:0] {PcLr, PcSysbus, PcAluOut, Pc1 } pc_select_t;
typedef enum logic [1:0] {Op1Pc, Op1Rd1, Op1Sp } Op1_select_t;
// Define Opcodes:
//
//  these could be defined with a further enumerated type declaration
//  unfortunately this doesn't easily map to a situation where opcode lengths are variable
//
//localparam NOP		= 4'd0;
//localparam JMP		= 4'd1;
//localparam JMPZ		= 4'd2;
//localparam JMPNZ	= 4'd3;
//localparam LDA		= 4'd4;
//localparam ADD		= 4'd5;
//localparam SUB		= 4'd6;
//localparam AND		= 4'd7;
//localparam OR		= 4'd8;
//localparam NOT		= 4'd9;
//localparam LSL		= 4'd10;
//localparam LSR		= 4'd11;
//localparam STA		= 4'd15;

localparam NOP 			= 5'b00000;
localparam ADD 			= 5'b00100;
localparam ADDI 		= 5'b00101;
localparam ADDIB	 	= 5'b11000;
localparam ADC			= 5'b00110;
localparam ADCI			= 5'b00111;




endpackage
