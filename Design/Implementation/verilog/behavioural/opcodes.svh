package opcodes;

// Define ALU Function Codes:
//
typedef 
  enum logic [4:0] { 	FnNOP, //HSL - I don't see the point in this
			FnA, 
			FnB, 
			FnADD, 
			FnADC, 
			FnSUB, 
			FnSUC,
			FnNEG,
			FnAND, 
			FnOR,
			FnXOR,
			FnNOT,
			FnNAND,
			FnNOR, 
			FnLSL, 
			FnLSR,
			FnASR,
			FnLUI,
			FnLLI
}
  alu_functions_t;
//Location of flags in the array
`define FLAGS_Z  0
`define FLAGS_C  1
`define FLAGS_V  2
`define FLAGS_N  3


//Program Counter Selction Codes
typedef enum logic [1:0] 	{PcLr, PcSysbus, PcAluOut, Pc1 } 	pc_select_t;
typedef enum logic [1:0] 	{Op1Pc, Op1Rd1, Op1Sp } 			Op1_select_t;
typedef enum logic 			{Op2Rd2=1, Op2Imm=0} 				Op2_select_t;
typedef enum logic 			{ImmShort=1, ImmLong=0} 			Imm_select_t;
typedef enum logic 			{WdSys=1, WdAlu=0} 					Wd_select_t;
typedef enum logic			{Rs1Rd=1, Rs1Ra=0} 					Rs1_select_t;
typedef enum logic			{LrPc=1, LrSys=0}					Lr_select_t;		
typedef enum logic [2:0] 	{	
				BR  = 3'b000, 
				BNE = 3'b110, 
				BE  = 3'b111, 
				BLT = 3'b100, 
				BGE = 3'b101, 
				BWL = 3'b011, 
				RET = 3'b010, 
				JMP = 3'b001 
				} Branch_t;
typedef enum logic [1:0]	{
				PUSH		= 2'b10,
				PUSH_LINK 	= 2'b11,
				POP			= 2'b00,
				POP_LINK	= 2'b01
				} Stack_t;
// Define Opcodes:
//
//  these could be defined with a further enumerated type declaration
//  unfortunately this doesn't easily map to a situation where opcode lengths are variable
//
typedef enum logic [4:0] { 
NOP 			= 5'b00000, //Type A
ADD 			= 5'b00100, //Type A
ADDI 			= 5'b00101, //Type A
ADDIB	 		= 5'b11000, //Type B
ADC			= 5'b00110, //Type A
ADCI			= 5'b00111, //Type A
NEG                  	= 5'b01000, //Type A
SUB                  	= 5'b01001, //Type A
SUBI                 	= 5'b01010, //Type A
SUBIB                	= 5'b11001, //Type B
SUC                  	= 5'b01011, //Type A
SUCI                 	= 5'b01100, //Type A
CMP                  	= 5'b01101, //Type A
CMPI                 	= 5'b01110, //Type A
AND                  	= 5'b10000, //Type A
OR                   	= 5'b10001, //Type A
XOR                  	= 5'b10010, //Type A
NOT                  	= 5'b10011, //Type A
NAND                 	= 5'b10100, //Type A
NOR                  	= 5'b10110, //Type A
LSL                  	= 5'b00001, //Type A
LSR                  	= 5'b00010, //Type A
ASR                  	= 5'b00011, //Type A
LDW              	= 5'b10101, //Type C
STW                  	= 5'b11101, //Type C
LUI                  	= 5'b11010, //Type B
LLI                  	= 5'b11011, //Type B
BRANCH               	= 5'b11111, //Type D
PUSH_POP             	= 5'b11100 //Type E
//POP                  	= 5'b11100 //Type E
} Opcode_t;
endpackage
