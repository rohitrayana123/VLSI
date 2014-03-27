module alu_stim;

timeunit 1ns; timeprecision 10ps;
import opcodes::*;

wire  [3:0]  	Flags;
wire  [15:0] 	Result; 
logic [15:0] 	Op1, Op2;
Opcode_t 	OpCode; 
logic 		CarryIn;
logic [3:0] 	ShAmount;

alu a (	.Flags	 (Flags),
		.Result  (Result),
		.Op1	 (Op1),
		.Op2	 (Op2),
		.OpCode  (OpCode),
		.CarryIn (CarryIn),
		.ShAmount(ShAmount));
int errors;

task checkOutputs;
	assert( Flags[`FLAGS_Z] == (Result == 0)) else begin errors++; $display("Error in FLAGS_Z, %b", Result); end
	assert( Flags[`FLAGS_N] == (Result[15])) else begin errors++; $display("Error in FLAGS_N"); end
	assert( Flags[`FLAGS_C] == a.Carry) else begin errors++; $display("Error in FLAGS_C"); end
	assert( Flags[`FLAGS_V] == ((~Op1[15] & ~Op2[15] & Result[15]) | ( Op1[15] & Op2[15] & ~Result[15]))) else begin errors++; $display("Error in FLAGS_V"); end

	case(OpCode)
		ADD,ADDI,ADDIB,BRANCH,INTERRUPT,POP, LDW,STW: 	assert({a.Carry,Result} == {1'b0, Op1} + {1'b0, Op2})
								 else begin errors++; $display("Error in Adding"); end
		ADC,ADCI: 					assert({a.Carry,Result} == {1'b0, Op1} + {1'b0, Op2} + CarryIn) 
								 else begin errors++; $display("Error in Add with carry"); end
		NEG: 						assert(Result == -Op1)
								 else begin errors++; $display("Error in NEG"); end
		SUB, SUBI,SUBIB,CMP,CMPI,PUSH: 			assert({a.Carry,Result} == {1'b0, Op1} - {1'b0, Op2})
								 else begin errors++; $display("Error in Subtraction"); end
		SUC, SUCI: 					assert({a.Carry, Result} == {1'b0,Op1} - {1'b0,Op2} - (CarryIn))
								 else begin errors++; $display("Error in Sub with carry"); end
		AND:						assert(Result == (Op1 & Op2))
								 else begin errors++; $display("Error in AND %b, %b, %b", Result, Op1, Op2); end
		OR: 						assert(Result == (Op1 | Op2))
								 else begin errors++; $display("Error in OR"); end
		XOR:						assert(Result == (Op1 ^ Op2))
								 else begin errors++; $display("Error in XOR"); end
		NOT:						assert(Result == (~Op1))  		
								 else begin errors++; $display("Error in NOT"); end
		NAND: 						assert(Result == ~(Op1 & Op2))  		
								 else begin errors++; $display("Error in NAND"); end
		NOR:						assert(Result == ~(Op1 | Op2)) 		
								 else begin errors++; $display("Error in NOR"); end
		LSL:						assert(Result == (Op1 << ShAmount))  		
								 else begin errors++; $display("Error in LSL"); end
		LSR:						assert(Result == (Op1 >> ShAmount)) 		
								 else begin errors++; $display("Error in LSR"); end
		ASR:						assert(Result == (Op1 >>> ShAmount))  		
								 else begin errors++; $display("Error in ASR"); end
		LUI:						assert(Result == {Op2[7:0], 8'b0})  		
								 else begin errors++; $display("Error in LUI"); end
		LLI:						assert(Result == {Op1[15:8], Op2[7:0]})
								 else begin errors++; $display("Error in LLI"); end
	endcase
endtask

always @(posedge Op1, Op2, OpCode, CarryIn, ShAmount)
	#50 checkOutputs;

initial
begin
	errors = 0;
	OpCode = ADD;
	Op1 = 0;
	Op2 = 0;
	CarryIn = 0;
	ShAmount = 0; 
	
	#500 Op1 = $random();
	     Op2 = $random();
	//Basic OpCode Tests
	#500 OpCode = ADD;
	#500 OpCode = ADDI;
	#500 OpCode = ADDIB;
	#500 OpCode = BRANCH;
	#500 OpCode = INTERRUPT;
	#500 OpCode = POP;
	#500 OpCode = LDW;
	#500 OpCode = STW;
	#500 OpCode = ADC;
	#500 CarryIn = 1;	//CarryIn tests
	#500 OpCode = ADCI;
	#500 CarryIn = 0;
	#500 OpCode = NEG;
	#500 OpCode = SUB;
	#500 OpCode = SUBI;
	#500 OpCode = SUBIB;
	#500 OpCode = CMP;
	#500 OpCode = CMPI;
	#500 OpCode = PUSH;
	#500 OpCode = SUC;
	#500 CarryIn = 1;	//CarryIn tests
	#500 OpCode = SUCI;
	#500 CarryIn = 0; 
	#500 OpCode = AND;
	#500 OpCode = OR;
	#500 OpCode = XOR;
	#500 OpCode = NAND;
	#500 OpCode = NOR;
	#500 OpCode = LSL;
	#500 ShAmount = 0;
	for ( int i = 0; i < 16; i++)	//Shift amount tests
		#500 ShAmount++;
	#500 OpCode = LSR;
	#500 ShAmount = 0;
	for ( int i = 0; i < 16; i++)	//Shift amount tests
		#500 ShAmount++;
	#500 OpCode = ASR;
	#500 ShAmount = 0;
	for ( int i = 0; i < 16; i++)	//Shift amount tests
		#500 ShAmount++;
	#500 OpCode = LUI;
	#500 OpCode = LLI;

	#500 OpCode = LLI;	//Make no change
	if(errors > 0)
		$display("Simulation FAILED");
	else
		$display("Simulation PASSED");
	#1000 $stop();
end

endmodule
