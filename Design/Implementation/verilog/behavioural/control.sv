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
   output logic                     AluWe, 
   input  wire    [7:0]             OpcodeCondIn,
   input  wire    [3:0]             Flags,
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
logic [3:0] StatusReg;
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
		IntStatus <= #20 0;
		end
	else begin
		IRQ1 <= #20 ~nIRQ;
		IRQ2 <= #20 IRQ1;
		if(IntEnable)
			IntStatus <= #20 1;
		if(IntDisable)
			IntStatus <= #20 0;
	end
end
assign IntReq = (IRQ2 & ~InISR) | (IRQ1 & ~IRQ2); //first - if we're not in an
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
            	cycle0: begin	
//			if (IntReq) //if an interrupt has been requested
//				state <= #20 interrupt;
//			else
				stateSub <= #20 cycle1;
		end
            	cycle1: stateSub <= #20 cycle2;
            	cycle2: stateSub <= #20 cycle3;
            	default:begin							// Should never get in cycle4 in fetch 
							state <= #20 execute;
         					stateSub <= #20 cycle0;
						end
		 	endcase
    	// Execute     
      	if(state == execute) 
         	case(stateSub)
            	cycle0: case(Opcode)
            				ADD, ADDI, ADDIB, ADC, ADCI, SUB, SUBI, SUBIB, SUC, SUCI, LUI, LLI, RET, CMP, CMPI, AND, OR, XOR, NOT, NAND, NOR, LSL, LSR, ASR, NEG, BRANCH: begin 
	if (IntReq) 
		state <= #20 interrupt; //got an interrupt
	else 
		state <= #20 fetch;	// Single cycle ops
end
                			LDW, STW: 	stateSub <= #20 cycle1;
					INTERRUPT: begin
					if ( BranchCode == 0)
						stateSub <= #20 cycle1; //if a return from interrupt
					else
						state <= #20 fetch; //else single cycle
					end//INTERRUPT
                  		endcase
            	cycle1:	stateSub <= #20 cycle2;	
            	cycle2: stateSub <= #20 cycle3;  		
            	cycle3: stateSub <= #20 cycle4;
        		default:begin
				if(IntReq)
					state<= #20 interrupt;
				else
	                    		state <= #20 fetch;
                  		stateSub <= #20 cycle0; //always go to cycle 0
				if(Opcode == INTERRUPT) InISR <= #20 0; //
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
	IntClear = 0;
	IntEnable = 0;
	IntDisable = 0;
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
					INTERRUPT: begin
					case(BranchCode)
						0: begin //RETI
							Rs1Sel = Seven; //chose SP
   							AluEn = 1;
							Op1Sel = Op1Rd1;
							AluOp = FnA;	
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
					endcase
					end //INTERRUPT
            		endcase //opcode
         		end //cycle0
         		cycle1:begin 
				if(Opcode == INTERRUPT)
				begin
					ALE = 1;
					nWE = 1;
					nOE = 1;
					AluOp = FnA;
					Op1Sel = Op1Rd1;
					Rs1Sel = Seven;
					AluEn = 1;
				end 
				else begin //STW LDW
					ALE = 1;
        	       			nWE = 1;
        		       		nOE = 1; 
					ImmSel = ImmShort;
					AluOp = FnADD;
					Op1Sel = Op1Rd1;
        	        		AluEn = 1; 
				end
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
				INTERRUPT: begin
					nME = 0;
					Op1Sel = Op1Rd1;
					Rs1Sel = Seven;
					AluOp = FnA;
					MemEn = 1;
					nWE = 1;
					AluWe = 1;
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
					INTERRUPT: begin
						nME = 0;
						MemEn = 1;
						ENB = 1;
						nWE = 1;
					end
	            		endcase  
         		end
         		cycle4: begin
				if (Opcode == INTERRUPT) begin
					PcWe = 1;
					PcSel = PcSysbus;
					nME = 1;
					MemEn = 1;
					nWE = 1;
				end //end INTERRUPT
				else begin //LDW or STW
					PcWe = 1;
        				PcSel = Pc1;		// Done, move on
   					nME = 1;
					if(Opcode == LDW) begin
						nWE = 1;
						MemEn = 1;
						WdSel = WdSys;
						RegWe = 1;
					end
					if(Opcode == STW) begin
						nOE = 1;
						AluEn = 1;
					end
				end //else //LDW or STW
         		end
         	endcase
	end
	interrupt:
		case(stateSub)
			cycle0:
			begin
				Rs1Sel = Seven;//choose sp
				AluOp = FnA; //pass it through
				Op1Sel = Op1Rd1;
				AluWe = 1;
				AluEn = 1;
			end
			cycle1:
			begin
               			nWE = 1;
        	       		nOE = 1; 
				AluOp = FnA;
				Op1Sel = Op1Rd1;
				Rs1Sel = Seven;
				AluEn = 1;
				ALE = 1;
			end
			cycle2: begin
                        	nME = 0;
				AluOp = FnA;		// Nothing done to op1
				nOE = 1;
	                	nWE = 1;
				AluEn = 1;
			end
			cycle3: begin
				nME = 0;
	                        PcEn = 1;			// Hold data on sysbus
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
