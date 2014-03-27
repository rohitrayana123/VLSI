//Written by mw20g10
module aludecoder(
  output logic V, C, N, Z,
  output logic ZeroA, SUB, CIn_slice, FAOut, AND, OR, XOR, NOT, NAND, NOR, ShB, ShL, ShR, Sh8, Sh4, Sh2, Sh1, ShInBit, ShOut, LLI, OutEn_slice,
  input wire [4:0] OpCode,
  input wire [3:0] imm4,
  input wire CIn, OutEn,
  input wire LastCIn, COut, N_slice, nZ, ASign
  );

timeunit 1ns; timeprecision 100ps;

logic UseC;

assign V = LastCIn ^ SUB ^ COut;
assign C = SUB ^ COut;
assign N = N_slice; 
assign Z = ~nZ;

assign OutEn_slice = OutEn; 
assign CIn_slice = (SUB ^ (UseC & CIn));

always_comb
begin
	UseC = 0;ZeroA = 0; SUB = 0; 
	//CIn_slice = 0; 
	FAOut = 0; AND = 0; OR = 0; XOR = 0; NOT = 0; NAND = 0; NOR = 0; ShB = 0; ShL = 0; ShR = 0; Sh8 = 0; Sh4 = 0; Sh2 = 0; Sh1 = 0;  
	ShInBit = 0; ShOut = 0; LLI = 0; //OutEn = 0;
	case (OpCode)
		5'b00000: FAOut = 1;
		5'b00001: FAOut = 1;
		5'b00011: FAOut = 1;
		5'b00010: FAOut = 1;
		5'b00110: FAOut = 1;
		5'b00111: begin FAOut = 1; SUB = 1; end
		5'b00101: begin FAOut = 1; UseC = 1; end
		5'b00100: begin FAOut = 1; UseC = 1; end

		5'b01000: FAOut = 1;
		5'b01001: begin FAOut = 1; SUB = 1; end
		5'b01011: begin FAOut = 1; SUB = 1; end
		5'b01010: begin FAOut = 1; SUB = 1; end
		5'b01110: begin FAOut = 1; SUB = 1; end
		5'b01111: begin FAOut = 1; SUB = 1; end
		5'b01101: begin FAOut = 1; SUB = 1; UseC = 1; end
		5'b01100: begin FAOut = 1; SUB = 1; UseC = 1; end

		5'b11000: ShOut = 1; 
		5'b11001: ShOut = 1; //INTERRUPTS, Just propagate A through ALU
		5'b11011: FAOut = 0; //NON-USED OPCODE
		5'b11010: begin FAOut = 1; SUB = 1; ZeroA = 1; end
		5'b11110: FAOut = 1;
		5'b11111: begin ShOut = 1; ShL = 1; Sh8 = imm4[3]; Sh4 = imm4[2]; Sh2 = imm4[1]; Sh1 = imm4[0]; end
		5'b11101: begin ShOut = 1; ShR = 1; Sh8 = imm4[3]; Sh4 = imm4[2]; Sh2 = imm4[1]; Sh1 = imm4[0]; end
		5'b11100: begin ShOut = 1; ShR = 1; Sh8 = imm4[3]; Sh4 = imm4[2]; Sh2 = imm4[1]; Sh1 = imm4[0]; ShInBit = ASign; end

		5'b10000: AND = 1;
		5'b10001: OR = 1;
		5'b10011: XOR = 1;
		5'b10010: NOT = 1;
		5'b10110: NAND = 1;
		5'b10111: NOR = 1;
		5'b10101: begin LLI = 1; ShOut = 1; end
		5'b10100: begin ShOut = 1; ShR = 1; ShB = 1; Sh8 = 1; end
	endcase
end
endmodule
