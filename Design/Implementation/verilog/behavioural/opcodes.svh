// Written by hl13g10 
package opcodes;

// Define ALU Function Codes:
//
//typedef 
//  enum logic [4:0] { 	
//	  		FnA, 
//			FnB, 
//			FnADD, 
//			FnADC, 
//			FnSUB, 
//			FnSUC,
//			FnNEG,
//			FnAND, 
//			FnOR,
//			FnXOR,
//			FnNOT,
//			FnNAND,
//			FnNOR, 
//			FnLSL, 
//			FnLSR,
//			FnASR,
//			FnLUI,
//			FnINC,
//			FnDEC,
//			FnLLI
//}
//  alu_functions_t;

//Location of flags in the array
`define FLAGS_Z  0
`define FLAGS_C  1
`define FLAGS_V  2
`define FLAGS_N  3

//Interrupt Sub codes
`define INT_RETI	0
`define INT_ENAI	1
`define INT_DISI	2
`define INT_LDF		3
`define INT_STF		4


//Program Counter Selction Codes
typedef enum logic [1:0]	{	nOR 		= 2'b00, 
								addOR 		= 2'b10, 
								subOR 		= 2'b11		} 	AluOR_select_t;
typedef enum logic [2:0] 	{	PcLr 		= 3'b011,
								PcSysbus 	= 3'b010, 
								PcAluOut 	= 3'b001, 
								Pc1 		= 3'b000, 
								PcInt 		= 3'b111 	} 	pc_select_t;
typedef enum logic  		{	Op1Pc 		= 1'b1, 
								Op1Rd1		= 1'b0 		} 	Op1_select_t;
typedef enum logic 	[1:0]	{	Op2Rd2		= 2'b01, 
								Op2Imm		= 2'b00,
								Op2zero		= 2'b10		} 	Op2_select_t;
typedef enum logic 			{	ImmShort	= 1'b1, 
								ImmLong		= 1'b0		} 	Imm_select_t;
typedef enum logic 			{	WdSys		= 1'b1, 
								WdAlu		= 1'b0		} 	Wd_select_t;
typedef enum logic  [1:0]	{	Rs1Rd		= 2'b00, 
								Rs1Ra		= 2'b01,
								Seven		= 2'b10		} 	Rs1_select_t;
typedef enum logic			{	LrPc		= 1'b1, 
								LrSys		= 1'b0		}	Lr_select_t;		
typedef enum logic  [1:0]	{	RwSeven		= 2'b10,
								RwRa		= 2'b00,
								RwRd 		= 2'b01		}	Rw_select_t;
typedef enum logic 			{	FlagAlu		= 1'b1,
								FlagSys 	= 1'b0		}		Flag_select_t;
typedef enum logic [2:0] 	{	BR  		= 3'b000, 
								BNE 		= 3'b110, 
								BE  		= 3'b111, 
								BLT 		= 3'b100, 
								BGE 		= 3'b101, 
								BWL 		= 3'b011, 
								RET 		= 3'b010, 
								JMP 		= 3'b001 	} Branch_t;
// Define Opcodes:
//
//  these could be defined with a further enumerated type declaration
//  unfortunately this doesn't easily map to a situation where opcode lengths are variable
//
typedef enum logic [4:0] { 					ADD 		= 5'b00010, 
								ADDI 		= 5'b00110, 
								ADDIB		= 5'b00011, 
								ADC		= 5'b00100, 
								ADCI		= 5'b00101, 
								NEG  		= 5'b11010, 
								SUB    		= 5'b01010, 
								SUBI   		= 5'b01110, 
								SUBIB  		= 5'b01011, 
								SUC    		= 5'b01100, 
								SUCI   		= 5'b01101, 
								CMP    		= 5'b00111, 
								CMPI   		= 5'b01111, 
								AND    		= 5'b10000, 
								OR     		= 5'b10001, 
								XOR    		= 5'b10011, 
								NOT    		= 5'b10010, 
								NAND   		= 5'b10110, 
								NOR    		= 5'b10111, 
								LSL    		= 5'b11111, 
								LSR    		= 5'b11101, 
								ASR    		= 5'b11100, 
								LDW   		= 5'b00000, 
								STW    		= 5'b01000, 
								LUI    		= 5'b10100, 
								LLI	  	= 5'b10101, 
								BRANCH 	 	= 5'b11110,	
								INTERRUPT 	= 5'b11001,
								PUSH		= 5'b01001,
								POP		= 5'b00001	} Opcode_t;


typedef enum logic [1:0] {
   fetch,
   execute,
   interrupt 
}  state_t;
typedef enum logic [2:0] { 	
	cycle0	= 3'b000,
   	cycle1	= 3'b001,
   	cycle2	= 3'b011,
   	cycle3	= 3'b010,
   	cycle4	= 3'b110
}  	stateSub_t;


endpackage
