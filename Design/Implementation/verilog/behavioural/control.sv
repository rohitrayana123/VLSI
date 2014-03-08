// Written by ajr2g10
module control(
   output opcodes::alu_functions_t  AluOp, 
   output opcodes::Op1_select_t     Op1Sel, 
   output opcodes::Op2_select_t     Op2Sel, 
   output logic                     AluEn,
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
   output opcodes::Rw_select_t		RwSel,
   output logic                     AluWe, 
   input  wire    [7:0]             OpcodeCondIn,
   input  wire    [3:0]             Flags,
`ifndef nowait
  	input wire						nWait,
`endif
   input  wire                      Clock,
   input  wire                      nReset
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

Opcode_t Opcode;
Branch_t BranchCode;

//Flags register
logic [3:0] StatusReg;
logic StatusRegWe;

// Type casting
assign Opcode = Opcode_t'(OpcodeCondIn[7:3]); 
assign BranchCode = Branch_t'(OpcodeCondIn[2:0]);
assign CFlag = StatusReg[`FLAGS_C];

enum {
   fetch,
   execute
}  state;
enum { 			// AJR - Save them d-types, 5 used states = 3 unused states
	cycle0,
   	cycle1,
   	cycle2,
   	cycle3,
   	cycle4     
}  	stateSub;

always_ff@(posedge Clock or negedge nReset) begin
	// Major states
	if(!nReset) begin
      	StatusReg <= #20 0;
	  	state <= #20 fetch;
      	stateSub <= #20 cycle0;
	end else begin 
		// Status update
      	if (StatusRegWe)
			StatusReg <= #20 Flags;		// AJR - Put this in here, shoudl be ok right?
	  	// Fetch  
      	if(state == fetch)
         	case(stateSub)
            	cycle0: stateSub <= #20 cycle1;
            	cycle1: stateSub <= #20 cycle2;
            	cycle2: if(nWait)
							stateSub <= #20 cycle3;
            	default:begin							// Should never get in cycle4 in fetch 
							state <= #20 execute;
         					stateSub <= #20 cycle0;
						end
		 	endcase
    	// Execute     
      	if(state == execute) 
         	case(stateSub)
            	cycle0: case(Opcode)
            				ADD, ADDI, ADDIB, ADC, ADCI, SUB, SUBI, SUBIB, SUC, SUCI, LUI, LLI, RET, CMP, CMPI, AND, OR, XOR, NOT, NAND, NOR, LSL, LSR, ASR, NEG, BRANCH: 	state <= #20 fetch;	// Single cycle ops
                			LDW, STW,PUSH,POP: 	stateSub <= #20 cycle1;
                  		endcase
            	cycle1:	stateSub <= #20 cycle2;	
            	cycle2: stateSub <= #20 cycle3;  		
				cycle3: if(nWait)						// Data setup, stay in place
							stateSub <= #20 cycle4;	
				default:begin
                    		state <= #20 fetch;
                  			stateSub <= #20 cycle0;
						end
         	endcase
   	end
end

always_comb begin
   	// Default outputs   
   	AluOp    = FnA;
   	AluWe    = 0;
   	Op2Sel   = Op2Imm; 
   	Op1Sel   = Op1Rd1; 
   	AluEn    = 0; 
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
		PcSel = Pc1;
	StatusRegWe= 0;
   RwSel = RwRd;
   case(state)
      	fetch : 
         	case(stateSub)
            	cycle0: begin ALE = 1;  nWE  = 1; nOE  = 1; PcEn  = 1; end 
            	cycle1: begin nME = 0; nWE = 1; MemEn = 1; end
            	cycle2: begin nME = 0; MemEn = 1; ENB = 1; nWE   = 1; end 
            	cycle3: begin nWE = 1; MemEn = 1; IrWe  = 1;  end
         	endcase
      	execute: begin
         	case(stateSub)
            	cycle0: begin    					// Single cycle ops
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
   							AluEn = 1;
							ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;
							AluOp = FnADD;	
                           	AluWe = 1;
                    	end
						LUI,LLI:begin
							ImmSel = ImmLong;
							Op2Sel = Op2Imm;
							WdSel = WdAlu;
							Op1Sel = Op1Rd1;
							RegWe = 1;	
							PcWe = 1;
							PcSel = Pc1;
							Rs1Sel = Rs1Rd;	
							AluEn = 1;
							if(Opcode == LUI)
								AluOp = FnLUI;
							else
								AluOp = FnLLI;
						end
						BRANCH:begin
							case(BranchCode)	
								BR,BNE,BE,BLT,BGE,BWL:begin		// Conditional branching
									PcWe = 1;
									AluOp = FnADD;
									ImmSel = ImmLong;
									Op1Sel = Op1Pc;
									AluEn = 1;
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
						PUSH:begin
							AluEn = 1;
							ImmSel = ImmShort;
                           	Rs1Sel = Seven;
							RwSel = RwSeven;
							Op1Sel = Op1Rd1;
							AluOp = FnSUB;	
                           	AluWe = 1;
							RegWe = 1;
							WdSel = WdAlu;

						end	
						POP:begin
							AluEn = 1;
							ImmSel = ImmShort;
                           	Rs1Sel = Seven;
							Op1Sel = Op1Rd1;
							AluOp = FnA;	
                           	AluWe = 1;		
						end	
            		endcase
         		end
         		cycle1:begin 
					case(Opcode)
						LDW,STW:begin
							ALE = 1;
               				nWE = 1;
               				nOE = 1; 
							ImmSel = ImmShort;
							AluOp = FnADD;
							Op1Sel = Op1Rd1;
                			AluEn = 1; 
         				end
						PUSH,POP:begin
							ALE = 1;
               				nWE = 1;
               				nOE = 1; 
							ImmSel = ImmShort;
							AluOp = FnADD;
							Op1Sel = Op1Rd1;
							Rs1Sel = Seven;
                			AluEn = 1;	
						end	
					endcase
				end
         		cycle2: begin
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
						PUSH:begin
							nME = 0;
							Op1Sel = Op1Rd1;
							AluOp = FnA;		// Nothing done to op1
                        	Rs1Sel = Rs1Ra;
							nOE = 1;
                        	nWE = 1;
                     		AluWe = 1;			// Pass right through on next clock
                        	AluEn = 1;

						end
						POP:begin
							nME = 0;
                        	Op1Sel = Op1Rd1;
							AluOp = FnA;		// Nothing done to op1
                        	Rs1Sel = Seven;
							MemEn = 1;
                        	nWE = 1;
                     		//AluWe = 1;			// Pass right through on next clock
                        	AluEn = 1;
						end

            		endcase
         		end
         		cycle3: begin
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
						PUSH:begin
							nME = 0;	
							nOE = 1;	
							//LrEn = 1;
							if(OpcodeCondIn[2]) begin	// 1 = LR
								LrEn = 1;
							end else begin
								AluEn = 1;
								AluWe = 1;
								Rs1Sel = Rs1Ra;
								AluOp = FnA;
							end
						end
						POP:begin
							nME = 0;
							MemEn = 1;
							ENB = 1;
							nWE = 1;
							WdSel = WdAlu;
							ImmSel = ImmShort;
							Op2Sel = Op2Imm;
							RegWe = 1;
							Rs1Sel = Seven;
							WdSel = WdAlu;
							RwSel = RwSeven;
							AluOp = FnADD;
						end
            		endcase  
         		end
         		cycle4: begin
					PcWe = 1;
                    PcSel = Pc1;		// Done, move on
   					nME = 1;
					case(Opcode)
						LDW: begin
							nWE = 1;
							MemEn = 1;
							WdSel = WdSys;
							RegWe = 1;
						end
						STW: begin
							nOE = 1;
							AluEn = 1;
						end
						PUSH:begin
							nOE = 1;
							//LrEn = 1;
							if(OpcodeCondIn[2]) begin	// 1 = LR
								LrEn = 1;
							end else begin
								AluEn = 1;
								Rs1Sel = Rs1Ra;
								AluOp = FnA;
							end
						end
						POP:begin
							nWE = 1;
							MemEn = 1;
							if(OpcodeCondIn[2]) begin	// 1 = LR
								LrWe = 1;
							end else begin
								RegWe = 1;
								Rs1Sel = Rs1Rd;
								RwSel = RwRa;
								AluOp = FnADD;
								WdSel = WdSys;
							end
						end
					endcase
         		end
         	endcase
      	end
	endcase
end
endmodule
