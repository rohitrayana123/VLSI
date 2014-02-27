module control(
   output opcodes::alu_functions_t  AluOp, 
   output opcodes::Op1_select_t     Op1Sel, 
   output opcodes::Op2_select_t     Op2Sel, 
   output logic                     AluEn,
   output logic                     SpEn,
   output logic                     SpWe,
   output logic                     LrEn,
   output logic                     LrWe,
   output logic                     PcWe,
   output logic                     PcEn,
   output logic                     IrWe,
   output opcodes::Wd_select_t      WdSel,
   output opcodes::Imm_select_t		ImmSel,
   output logic                     RegWe,
   output opcodes::pc_select_t      PcSel,
   output logic                     MemEn,   // Pad control 
   output logic                     nWE,     // To memory map
   output logic                     nOE,
   output logic                     nME,
   output logic                     ENB,
   output logic                     ALE,
   output logic                     CFlag,
   output opcodes::Lr_select_t      LrSel,
   output opcodes::Rs1_select_t     Rs1Sel,
   output logic                     AluWe,
   output opcodes::Sp_select_t		SpSel,
   output opcodes::IncDec_select_t	SpIncDec,
   input  wire    [7:0]             OpcodeCondIn,
   input  wire    [3:0]             Flags,
   input  wire                      Clock,
   input  wire                      nReset
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

Opcode_t Opcode;
Branch_t BranchCode;
Stack_t  StackCode;

assign Opcode = OpcodeCondIn[7:3]; // This assignment is a violation of SystemVerilog strong typing rules for enumeration datatypes.
assign BranchCode = OpcodeCondIn[2:0];
assign StackCode = OpcodeCondIn[2:1];

enum {
   fetch,
   execute
}  state;
enum {
   fet1,
   fet2,
   fet3,
   fet4       
}  fetchSub;
enum {
   exe1,
   exe2,
   exe3,
   exe4,
   exe5
}  executeSub;

//Flags register
logic [3:0] StatusReg;
logic StatusRegWe;
//HSL - @todo this shouldn't always update. either put it in the control ff below, or make it sensitive to the alu op
always_ff@(posedge Clock or negedge nReset)
	if (!nReset)
		StatusReg <= #20 0;
	else
		if (StatusRegWe)
			StatusReg <= #20 Flags;
assign CFlag = StatusReg[`FLAGS_C];

always_ff@(posedge Clock or negedge nReset) begin
   // Major states
   if(!nReset) begin
      state <= #20 fetch;
      fetchSub <= #20 fet1;
      executeSub <= #20 exe1;
   end else begin 
      // Fetch  
      if(state == fetch)
         case(fetchSub)
            fet1: fetchSub <= #20 fet2;
            fet2: fetchSub <= #20 fet3;
            fet3: fetchSub <= #20 fet4;
            fet4: begin
                     state <= #20 execute;
                     fetchSub <= #20 fet1;
                     executeSub <= #20 exe1;
                  end
            default: fetchSub <= #20 fet1;
         endcase
      // Execute     
      if(state == execute) 
         case(executeSub)
            exe1: case(Opcode)
            		ADD, ADDI, ADDIB, ADC, ADCI, SUB, SUBI, SUBIB, SUC, SUCI, LUI, LLI, RET, CMP, CMPI, AND, OR, XOR, NOT, NAND, NOR, LSL, LSR, ASR, NEG, BRANCH: 	state <= #20 fetch;	// Single cycle ops
                	LDW, STW: 	executeSub <= #20 exe2;
                  endcase
            exe2: case(Opcode)
            		LDW, STW: 	executeSub <= #20 exe3;	
				  endcase
            exe3: case(Opcode)
                	LDW, STW: 	executeSub <= #20 exe4;
				  endcase
            exe4: case(Opcode)
                     LDW, STW: 	executeSub <= #20 exe5;
                  endcase
            exe5: case(Opcode)
                     LDW, STW:	state <= #20 fetch;
                  endcase
         endcase
   end
end

always_comb begin
   	// Default outputs   
   	AluOp    = FnNOP;
   	AluWe    = 0;
   	Op2Sel   = Op2Imm; 
   	Op1Sel   = Op1Rd1; 
   	AluEn    = 0;
   	SpEn     = 0;
   	SpWe     = 0;
   	LrEn     = 0;
   	LrWe     = 0;
   	LrSel    = LrSys;
   	PcWe     = 0;
   	PcEn     = 0;
   	IrWe     = 0;
   	Rs1Sel   = Rs1Ra;
   	WdSel    = WdAlu;
   	ImmSel   = ImmLong;
   	RegWe    = 0;
   	MemEn    = 0;
   	nWE      = 0;
   	nOE      = 0;
   	nME      = 1;
   	ENB      = 0;
   	ALE      = 0;
	StatusRegWe= 0;
   	case(state)
      	fetch : 
         	case(fetchSub)
            	fet1: begin ALE = 1;  nWE  = 1; nOE  = 1; PcEn  = 1; end 
            	fet2: begin nME = 0; nWE = 1; MemEn = 1; end
            	fet3: begin nME = 0; MemEn = 1; ENB = 1; nWE   = 1; end 
            	fet4: begin nWE = 1; MemEn = 1; IrWe  = 1;  end
         	endcase
      	execute: begin
         	case(executeSub)
            	exe1: begin    					// Single cycle ops
               		case(Opcode)
                  		ADD:begin
		            		PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnADD;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
							StatusRegWe = 1;
                        end
                  		ADDI:begin
		                	PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnADD;
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ADDIB:begin
        		        	PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnADD;
                           	Op1Sel = Op1Rd1;
                           	Rs1Sel = Rs1Rd;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ADC:begin
		                	PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		ADCI:begin
		                	PcEn = 1;   		// output the PC to SysBu
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		SUB:begin
   		            		PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
							StatusRegWe = 1;
                        end
                  		NEG:begin
   		            		PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnNEG;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
							StatusRegWe = 1;
                        end
                  		SUBI:begin
   		                	PcEn = 1;   		// output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		SUBIB:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	Rs1Sel = Rs1Rd;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		SUC:begin
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		SUCI:begin
   		                	PcEn = 1;   // output the PC to SysBu
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		CMP:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
						end
                  		CMPI:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		AND:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnAND;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		OR:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnOR;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		XOR:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnXOR;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NOR:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnNOR;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NAND:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnNAND;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NOT:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnNOT;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		LSL:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnLSL;
							ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;Op2Sel = Op2Imm;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		LSR:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnLSR;
                           	Op1Sel = Op1Rd1;
							ImmSel = ImmShort;
							Op2Sel = Op2Imm;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ASR:begin
   		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnASR;
                           	Op1Sel = Op1Rd1;
							ImmSel = ImmShort;
							Op2Sel = Op2Imm;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
						LDW,STW:begin			// Add must be done before address out
   							ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;
							AluOp = FnADD;
                           	AluEn = 1;			// Pass right through on next clock
                           	AluWe = 1;
                    	end
						LUI:begin
							ImmSel = ImmLong;
							Op2Sel = Op2Imm;
							WdSel = WdAlu;
							AluOp = FnLUI;
							RegWe = 1;
							AluEn = 1;
							PcWe = 1;
							PcSel = Pc1;
						end
						LLI:begin
							ImmSel = ImmLong;
							Op2Sel = Op2Imm;
							WdSel = WdAlu;
							AluOp = FnLLI;
							RegWe = 1;
							AluEn = 1;
							PcWe = 1;
							PcSel = Pc1;
						end
						BRANCH:begin
							case(BranchCode)	
								BR,BNE,BE,BLT,BGE,BWL:begin		// Conditional branching
									PcWe = 1;
									AluOp = FnADD;
									ImmSel = ImmLong;
									if(	(BranchCode == BR) 	|| 
										(BranchCode == BWL)	||
										(BranchCode == BNE 	&& 	(StatusReg[`FLAGS_Z] && BranchCode == BNE)	)		||
										(BranchCode == BE 	&& 	(~StatusReg[`FLAGS_Z] && BranchCode == BE)	)		||
										(BranchCode == BLT	&&  ((StatusReg[`FLAGS_N] && ~StatusReg[`FLAGS_V]) || (~StatusReg[`FLAGS_N] && StatusReg[`FLAGS_V]))	)	||
										(BranchCode == BGE	&&  ((StatusReg[`FLAGS_N] && StatusReg[`FLAGS_V]) || (~StatusReg[`FLAGS_N] && ~StatusReg[`FLAGS_V])))	) begin 
										PcSel = PcAluOut;
										if(BranchCode == BWL) begin	// Branch with link
											LrWe = 1;
											LrSel = LrPc;
										end
									end else
										PcSel = Pc1;
								end
								RET:begin
									LrEn = 1;
									PcWe = 1;
									PcSel = PcSysbus;	
								end
								JMP:begin
									AluOp = FnADD;
									ImmSel = ImmShort;
                           			Op1Sel = Op1Rd1;
									PcSel = PcAluOut;
									PcWe = 1;
								end	
							endcase
						end
						PUSH_POP:begin
							//case(StackCode)
							//	PUSH:begin
							//		
							//	end
							//	PUSH_LINK:begin

							//	end
							//	POP:begin

							//	end
							//	POP_LINK:begin

							//	end
							//endcase
						end
            		endcase
         		end
         		exe2:begin 
            		case(Opcode)
               			LDW,STW:begin  
							ImmSel = ImmShort;
							AluOp = FnADD;
							Op1Sel = Op1Rd1;
                        	ALE = 1;
							nWE = 1;
                        	nOE = 1;
                        	AluEn = 1;
                     	end	
            		endcase
         		end
         		exe3: begin
            		case(Opcode)
               			LDW:begin
							nME = 0;
                        	Op1Sel = Op1Rd1;
							AluOp = FnA;		// Nothing done to op1
                        	Rs1Sel = Rs1Rd;
							MemEn = 1;
                        	nWE = 1;
                     		AluWe = 1;			// Pass right through on next clock
                        	AluEn = 1;
						end
						STW:begin			// Get the data out of the reg
                        	nME = 0;
							Op1Sel = Op1Rd1;
							AluOp = FnA;		// Nothing done to op1
                        	Rs1Sel = Rs1Rd;
							nOE = 1;
                        	nWE = 1;
                     		AluWe = 1;			// Pass right through on next clock
                        	AluEn = 1;
						end		
            		endcase
         		end
         		exe4: begin
            		case(Opcode)
						LDW:begin
							nME = 0;
							MemEn = 1;
							ENB = 1;
							nWE = 1;
						end
               			STW:begin
							nME = 0;
                        	AluEn = 1;			// Hold data on sysbus
                        	nOE = 1;               
                     	end   
            		endcase  
         		end
         		exe5: begin
					PcWe = 1;
                    PcSel = Pc1;		// Done, move on
   					case(Opcode)
						LDW:begin
							nWE = 1;
							MemEn = 1;
							WdSel = WdSys;
							RegWe = 1;
						end
						STW:begin				
							AluEn = 1;
                       		nOE = 1;
					 	end
           	 		endcase 
         		end
         	endcase
      	end
	endcase
end
endmodule
