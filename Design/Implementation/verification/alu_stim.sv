module alu_stim;

timeunit 1ns; timeprecision 10ps;
import opcodes::*;

wire  [3:0]  Flags;
wire  [15:0] Result; 
logic [15:0] Op1, Op2;
alu_functions_t AluOp;
logic CarryIn;

alu instance1 (.*);
int errors;
initial
begin
	errors = 0;
	AluOp = FnA;
	Op1 = 0;
	Op2 = 0;
	CarryIn = 0;
	
	//Test aluops in turn
	AluOp = FnA;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == Op1 ) else begin errors++; $display("Error in FnA"); end

	AluOp = FnB;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == Op2 ) else begin errors++; $display("Error in FnB"); end

	AluOp = FnADD;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == (Op1 + Op2)) else begin errors++; $display("Error in FnADD"); end

	AluOp = FnADC;
	

	AluOp = FnSUB;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == (Op1 - Op2) ) else begin errors++; $display("Error in FnSUB"); end

	AluOp = FnSUC;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == (Op1 - Op2 + 1)) else begin errors++; $display("Error in FnSUC"); end


	AluOp = FnNEG;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == -Op1) else begin errors++; $display("Error in FnNEG"); end

	AluOp = FnAND;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == (Op1 & Op2) ) else begin errors++; $display("Error in FnAND"); end

	AluOp = FnOR;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == (Op1 | Op2) ) else begin errors++; $display("Error in FnOR"); end

	AluOp = FnXOR;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == (Op1 ^ Op2) ) else begin errors++; $display("Error in FnXOR"); end

	AluOp = FnNOT;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == ~Op1) else begin errors++; $display("Error in FnNOT"); end

	AluOp = FnNAND;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == ~(Op1 & Op2)) else begin errors++; $display("Error in FnNAND"); end

	AluOp = FnNOR;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == ~(Op1 | Op2) ) else begin errors++; $display("Error in FnNOR"); end

	AluOp = FnLSL;
	for ( Op2 = 0; Op2 < 17; Op2++)
	begin
		Op1 = $random();
		#1000 assert( Result == (Op1 << Op2) ) else begin errors++; $display("Error in FnLSL"); end
	end

	AluOp = FnLSR;
	for ( Op2 = 0; Op2 < 17; Op2++)
	begin
		Op1 = $random();
		#1000 assert( Result == (Op1 >> Op2) ) else begin errors++; $display("Error in FnLSR"); end
	end


	AluOp = FnASR;
	for ( Op2 = 0; Op2 < 17; Op2++)
	begin
		Op1 = $random();
		#1000 assert( Result == (Op1 >>> Op2) ) else begin errors++; $display("Error in FnASR"); end
	end
	
	AluOp = FnLUI;
	Op1 = $random();
	Op2 = $random();
	#1000 assert( Result == {Op2[7:0], 8'd0}) else begin errors++; $display("Error in FnLUI"); end
	
	if(errors > 0)
		$display("Simulation FAILED");
	else
		$display("Simulation PASSED");
	#1000 $stop();
end

endmodule
