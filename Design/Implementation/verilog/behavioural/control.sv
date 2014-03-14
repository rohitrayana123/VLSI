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
   output logic[3:0]			StatusReg,
   output logic 		StatusOut,
   output opcodes::Flag_select_t	FlagSel,
   input  wire    [7:0]             OpcodeCondIn,
   input  wire    [3:0]             Flags,
`ifndef nowait
  	input wire						nWait,
`endif
   input  wire                      Clock,
   input  wire                      nReset
`ifndef nointerrupt
,   input  wire 			nIRQ
`endif	
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

Opcode_t Opcode;
Branch_t BranchCode;

//Flags register
logic StatusRegWe;


// Type casting
assign Opcode = Opcode_t'(OpcodeCondIn[7:3]); 
assign BranchCode = Branch_t'(OpcodeCondIn[2:0]);
assign CFlag = StatusReg[`FLAGS_C];

`ifndef nointerrupt
//double buffer the IRQ signal
logic IRQ1, IRQ2, IntReq, IntClear, IntEnable, IntDisable, IntStatus, InISR;
always_ff @ (posedge Clock or negedge nReset) begin
	if(!nReset) begin
		IRQ1 <= #20 0;
		IRQ2 <= #20 0;
		IntReq <= #20 0;
		IntStatus <= #20 0;
		end
	else begin
		IRQ1 <= #20 ~nIRQ;
		IRQ2 <= #20 IRQ1;
		IntReq <= #20 (IRQ2 & ~InISR) | (IRQ1 & ~IRQ2) | (IntReq & ~IntClear);
		if(IntEnable)
			IntStatus <= #20 1;
		if(IntDisable)
			IntStatus <= #20 0;
	end
end
//assign IntReq = (IRQ2 & ~InISR) | (IRQ1 & ~IRQ2); //first - if we're not in an
//interupt and we get a request. Second, if request is satisfied and we get a
//new one, we want to go back in - allows nestedd
`endif

enum {
   fetch,
   execute,
   interrupt
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
		InISR <= #20 0;
	end else begin 
	// Status update
      	if (StatusRegWe)
			StatusReg <= #20 Flags;		// AJR - Put this in here, shoudl be ok right?
	// Interrupt
	if(state == interrupt)
		case(stateSub)
			cycle0: begin stateSub <= #20 cycle1; InISR <= #20 1; end
			cycle1: stateSub <= #20 cycle2;
			cycle2: stateSub <= #20 cycle3;
			cycle3: stateSub <= #20 cycle4;
			cycle4: begin stateSub <= #20 cycle0; state <= #20 fetch;  end
		endcase
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
            				ADD, ADDI, ADDIB, ADC, ADCI, SUB, SUBI, SUBIB, SUC, SUCI, LUI, 
							LLI, RET, CMP, CMPI, AND, OR, XOR, NOT, NAND, NOR, LSL, LSR, ASR, NEG, BRANCH: begin 
								if (IntReq) 
									state <= #20 interrupt; //got an interrupt
								else 
									state <= #20 fetch;	// Single cycle ops
							end
                			LDW, STW,PUSH,POP: 	
								stateSub <= #20 cycle1;
							INTERRUPT: begin
								if ( BranchCode == 0 | BranchCode == 3 | BranchCode == 4)
									stateSub <= #20 cycle1; //if a return from interrupt
								else
									state <= #20 fetch; //else single cycle
								end//INTERRUPT
                  		endcase
            	cycle1:	stateSub <= #20 cycle2;	
            	cycle2: stateSub <= #20 cycle3;  		
				cycle3: if(nWait)						// Data setup, stay in place
							stateSub <= #20 cycle4;	
        		default:begin
					stateSub <= #20 cycle0; //always go to cycle 0
					if(IntReq)
						state<= #20 interrupt;
					else
						state <= #20 fetch;	
					if(Opcode == INTERRUPT && BranchCode == 0) InISR <= #20 0; //
				end
         	endcase
   	end
end

always_comb begin
   	// Default outputs   
   	AluOp    = FnADD;
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
	RwSel = RwRd;	
	StatusRegWe= 0;
	IntClear = 0;
	IntEnable = 0;
	IntDisable = 0;
	StatusOut = 0;
	FlagSel = FlagAlu;
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
										((BranchCode == BNE) 	&&   (StatusReg[`FLAGS_Z] == 0))		||
										((BranchCode == BE 	) && 	(StatusReg[`FLAGS_Z] == 1)	) ||
										((BranchCode == BLT	)&&  ((StatusReg[`FLAGS_N] && ~StatusReg[`FLAGS_V]) || (~StatusReg[`FLAGS_N] && StatusReg[`FLAGS_V]))	)	||
										((BranchCode == BGE	)&&  ((StatusReg[`FLAGS_N] && StatusReg[`FLAGS_V]) || (~StatusReg[`FLAGS_N] && ~StatusReg[`FLAGS_V])))	) begin 
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
							Op2Sel = Op2zero;
							AluOp = FnADD;
							AluWe = 1;
						end 
						INTERRUPT: begin
							case(BranchCode)
								0,4: begin //RETI and LDF
									Rs1Sel = Seven; //chose SP
   									AluEn = 1;
									Op1Sel = Op1Rd1;
									Op2Sel = Op2zero;
									ImmSel = ImmShort;
									AluOp = FnADD;	
	          				 			AluWe = 1;	
								end //0 
								1: begin
									PcWe = 1;
									PcSel = Pc1;
									PcEn = 1; 
									IntEnable = 1;
								end //1
								2: begin
									PcWe = 1;
									PcSel = Pc1;
									PcEn = 1; 
									IntDisable = 1;
								end //2
								3: begin // STF
									Rs1Sel = Seven; //chose SP
   									AluEn = 1;
									Op1Sel = Op1Rd1;
									AluOp = FnDEC;	
	            		            AluWe = 1;
									RegWe = 1;
									WdSel = WdAlu;
									RwSel = RwSeven;
								end
							endcase
						end //INTERRUPT
            		endcase //opcode
         		end //cycle0
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
						INTERRUPT:begin
							ALE = 1;
							nWE = 1;
							nOE = 1;
//							if(BranchCode == 3 )
//								AluOp = FnDEC;
//							else
//								AluOp = FnINC;
							Op1Sel = Op1Rd1;
							Op2Sel = Op2zero;
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
					AluOp = FnADD;		// Nothing done to op1
					Op2Sel = Op2zero;
			             	Rs1Sel = Rs1Rd;
					MemEn = 1;
					nOE = 1;
					nWE = 1;
        	               		AluWe = 1;			// Pass right through on next clock
	                	       	AluEn = 1;
				end
				STW:begin			// Get the data out of the reg
        	                	nME = 0;
					Op1Sel = Op1Rd1;
					AluOp = FnADD;		// Nothing done to op1
			                Op2Sel = Op2zero;
					Rs1Sel = Rs1Rd;
					nOE = 1;
	                		nWE = 1;
	                     		AluWe = 1;			// Pass right through on next clock
        	                	AluEn = 1;
				end
						PUSH:begin
							nME = 0;
							Op1Sel = Op1Rd1;
							AluOp = FnADD; // Nothing done to op1
						    Op2Sel = Op2zero;
							Rs1Sel = Rs1Ra;
							nOE = 1;
							nWE = 1;
							AluWe = 1; // Pass right through on next clock
							AluEn = 1;
						end
						POP:begin
						 	nME = 0;
						  	Op1Sel = Op1Rd1;
						  	AluOp = FnADD; // Nothing done to op1
							Op2Sel = Op2zero;
							Rs1Sel = Seven;
							MemEn = 1;
							nWE = 1;
							//AluWe = 1; // Pass right through on next clock
							AluEn = 1;
						end
						INTERRUPT: begin
							nME = 0;
							Op1Sel = Op1Rd1;
							Op2Sel = Op2zero;
							Rs1Sel = Seven;
							AluOp = FnADD;
							MemEn = 1;
							nWE = 1;
							//AluWe = 1;
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
                     		AluOp = FnADD;
							Op2Sel = Op2zero;
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
								AluOp = FnADD;
								Op2Sel = Op2zero;
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
						INTERRUPT: begin
							case(BranchCode)
								0,4:begin
									nME = 0;
									MemEn = 1;
									ENB = 1;
									nWE = 1;
								end
								3:begin
									StatusOut = 1;
									nME = 0;
									nOE = 1;
								end
							endcase
						end
            		endcase  
         		end
         		cycle4: begin
         			PcWe = 1;
					PcSel = Pc1; // Done, move on
	  				nME = 1;
	  				case(Opcode)
	  					LDW: begin
	  						nWE = 1;
	  						MemEn = 1;
	  						WdSel = WdSys;
	  						RwSel = RwRd;
	  						RegWe = 1;
	  						WdSel = WdSys;
	  					end
	  					STW: begin
	  						nOE = 1;
	  						AluEn = 1;
							AluOp = FnADD;
							Op2Sel = Op2zero;
	  					end
	  					PUSH:begin
	  						nOE = 1;
							if(OpcodeCondIn[2]) begin // 1 = LR
								LrEn = 1;
							end else begin
								AluEn = 1;
								Rs1Sel = Rs1Ra;
								AluOp = FnADD;
								Op2Sel = Op2zero;
							end
						end
						POP:begin
							nWE = 1;
							MemEn = 1;
							if(OpcodeCondIn[2]) begin // 1 = LR
								LrWe = 1;
							end else begin
								RegWe = 1;
								Rs1Sel = Rs1Rd;
								RwSel = RwRa;
								AluOp = FnADD;
								WdSel = WdSys;
							end
						end
						INTERRUPT:begin
							case(BranchCode)
								0: begin
									nWE = 1;
									PcWe = 1;
									PcSel = PcSysbus;
									MemEn = 1;
									nME = 1;
									Rs1Sel = Seven;
									AluOp = FnINC;
									WdSel = WdAlu;
									RwSel = RwSeven;
									//RegWe = 1;
								end
								3: begin
									nOE = 1;
									StatusOut = 1;
								end
								4:	begin
									Rs1Sel = Seven;
									MemEn = 1;
									nWE = 1;	
									AluOp = FnINC;
									WdSel = WdAlu;
									RwSel = RwSeven;
									RegWe = 1;
									FlagSel = FlagSys;
									StatusRegWe = 1;
								end
							endcase
						end
					endcase
				
				
				end
         	endcase
      	end
	interrupt:
		case(stateSub)
			cycle0:begin
				Rs1Sel = Seven;//choose sp
				AluOp = FnADD; //pass it through
				Op1Sel = Op1Rd1;
				Op2Sel = Op2zero;
				//RegWe = 1;
				//RwSel = RwSeven;
				//WdSel = WdAlu;
				AluWe = 1;
				AluEn = 1;
			end
			cycle1:begin
			        nWE = 1;
				nOE = 1;
				//AluOp = FnDEC;
				AluOp = FnADD;
				Op2Sel = Op2zero;
				Op1Sel = Op1Rd1;
				Rs1Sel = Seven;
				AluEn = 1;
				ALE = 1;
			end
			cycle2: begin
				nME = 0;
				AluOp = FnADD; // Nothing done to op1
				Op2Sel = Op2zero;
				Op1Sel = Op1Rd1;
				nOE = 1;
				nWE = 1;
				AluEn = 1;
			end
			cycle3: begin
				nME = 0;
				PcEn = 1; // Hold data on sysbus
				nOE = 1;
			end
			cycle4: begin
				nOE = 1;
				PcEn = 1;
				IntClear = 1;
				PcSel = PcInt;
				PcWe = 1;
			end
		endcase
	endcase
end
endmodule
