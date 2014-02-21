package opcodes;

// Define ALU Function Codes:
//
typedef 
  enum logic [3:0] { FnNOP, FnACC, FnMem, FnADD, FnSUB, FnAND, FnOR, FnNOT, FnLSL, FnLSR }
  alu_functions_t;

//Program Counter Selction Codes
typedef enum logic [1:0] {PcLr, PcSysbus, PcAluOut, Pc1 } pc_select_t;
typedef enum logic [1:0] {Op1Pc, Op1Rd1, Op1Sp } Op1_select_t;
typedef enum logic [2:0] {	BR  = 3'b000, 
				BNE = 3'b110, 
				BE  = 3'b111, 
				BLT = 3'b100, 
				BGE = 3'b101, 
				BWL = 3'b011, 
				RET = 3'b010, 
				JMP = 3'b001 
				} Branch_t;
// Define Opcodes:
//
//  these could be defined with a further enumerated type declaration
//  unfortunately this doesn't easily map to a situation where opcode lengths are variable
//

localparam NOP 			= 5'b00000; //Type A
localparam ADD 			= 5'b00100; //Type A
localparam ADDI 		= 5'b00101; //Type A
localparam ADDIB	 	= 5'b11000; //Type B
localparam ADC			= 5'b00110; //Type A
localparam ADCI			= 5'b00111; //Type A
localparam NEG                  = 5'b01000; //Type A
localparam SUB                  = 5'b01001; //Type A
localparam SUBI                 = 5'b01010; //Type A
localparam SUBIB                = 5'b11001; //Type B
localparam SUC                  = 5'b01011; //Type A
localparam SUCI                 = 5'b01100; //Type A
localparam CMP                  = 5'b01101; //Type A
localparam AND                  = 5'b10000; //Type A
localparam OR                   = 5'b10001; //Type A
localparam XOR                  = 5'b10010; //Type A
localparam NOT                  = 5'b10011; //Type A
localparam NAND                 = 5'b10100; //Type A
localparam NOR                  = 5'b10101; //Type A
localparam LSL                  = 5'b00001; //Type A
localparam LSR                  = 5'b00010; //Type A
localparam ASR                  = 5'b00011; //Type A
localparam LDW                  = 5'b11101; //Type C
localparam STW                  = 5'b11101; //Type C
localparam LUI                  = 5'b11010; //Type B
localparam LLI                  = 5'b11011; //Type B
localparam BRANCH               = 5'b11111; //Type D
localparam PUSH                 = 5'b11100; //Type E
localparam POP                  = 5'b11100; //Type E

endpackage
