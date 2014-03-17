//Written by mw20g10
module aluDecode( 
  	output 	opcodes::alu_functions_t	AluOp,
   	input 	opcodes::Opcode_t 			OpCode
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

// This is a reduction mapping
always_comb begin
	case (OpCode)
		ADD			: AluOp = FnADD;
		ADDI		: AluOp = FnADD;
		ADDIB		: AluOp = FnADD;
		ADC			: AluOp = FnADC; 
		ADCI		: AluOp = FnADC;
        NEG  		: AluOp = FnNEG;
		SUB    		: AluOp = FnSUB;
		SUBI   		: AluOp = FnSUB;
		SUBIB  		: AluOp = FnSUB; 
		SUC    		: AluOp = FnADC;
		SUCI   		: AluOp = FnADC;
		CMP    		: AluOp = FnSUB;
		CMPI   		: AluOp = FnSUB;
		AND    		: AluOp = FnAND;
        OR     		: AluOp = FnOR;
		XOR    		: AluOp = FnXOR;
		NOT    		: AluOp = FnNOR;
		NAND   		: AluOp = FnNAND;
		NOR    		: AluOp = FnNOT;
		LSL    		: AluOp = FnLSL;
		LSR    		: AluOp = FnLSR;
		ASR    		: AluOp = FnASR;
		LDW   		: AluOp = FnADD;
        STW    		: AluOp = FnADD;
		LUI    		: AluOp = FnLUI;
		LLI	  		: AluOp = FnLLI;
		BRANCH 		: AluOp = FnADD;
		INTERRUPT	: AluOp = FnADD;
		PUSH		: AluOp = FnSUB;
		POP			: AluOp = FnADD;
	endcase
end
endmodule
