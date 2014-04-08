// Written by ajr2g10
module control(
   	output 	logic                     	ALE,
	output 	logic                     	AluEn,
	output 	logic                     	AluWe, 
   	output 	opcodes::AluOR_select_t		AluOR,
   	output 	logic                     	CFlag,
	output 	logic                     	ENB,
	output 	opcodes::Imm_select_t		ImmSel,
	output 	logic                     	IrWe,
	output 	logic                     	LrEn,
   	output 	opcodes::Lr_select_t      	LrSel,
	output 	logic                     	LrWe,
   	output 	logic                     	MemEn,   
   	output 	logic                     	nME,     
   	output 	logic                     	nOE,
   	output 	logic                     	nWE,	
	output 	opcodes::Op1_select_t     	Op1Sel, 
   	output 	opcodes::Op2_select_t     	Op2Sel, 		
   	output 	logic                     	PcEn,
	output 	opcodes::pc_select_t      	PcSel,	
   	output 	logic                     	PcWe,
	output 	logic                     	RegWe,
 	output 	opcodes::Rs1_select_t     	Rs1Sel,
   	output 	opcodes::Rw_select_t		RwSel,
	output 	opcodes::Wd_select_t      	WdSel,
	output  logic   [3:0]			StatusReg,
	output  logic  				StatusRegEn,
   	input	wire 	[3:0] 			SysBus,		// Only use low nibble on SysBus
	input  	wire                      	Clock,
	input  	wire    [3:0]             	Flags,
	input  	wire 				nIRQ,
  	input  	wire                      	nReset,
	input 	wire				nWait,
	input  	wire    [7:0]             	OpcodeCondIn   	
);

timeunit 1ns; timeprecision 100ps;

import opcodes::*;

`define FLAGS_Z  0 		// TODO: Synthesis tool doesn't like these in opcodes.svh
`define FLAGS_C  1
`define FLAGS_V  2
`define FLAGS_N  3

Opcode_t Opcode;
Branch_t BranchCode;
//Flags register
logic StatusRegWe;
//logic StatusRegEn;
//logic [3:0] StatusReg;
Flag_select_t	FlagSel;
logic [3:0] StatusRegIn;

// AJR - vlog2edf doesn like zeros?
//assign SysBus[3:0] = StatusRegEn ? StatusReg  : 'bz;
assign StatusRegIn = (FlagSel == FlagAlu) ? Flags : SysBus[3:0];

// Type casting
assign Opcode = Opcode_t'(OpcodeCondIn[7:3]); 
assign BranchCode = Branch_t'(OpcodeCondIn[2:0]);
assign CFlag = StatusReg[`FLAGS_C];

//double buffer the IRQ signal
logic IRQ1, IRQ2, IntReq, IntEnable, IntDisable, IntStatus; //InISR;
always_ff @ (posedge Clock or negedge nReset) begin
	if(!nReset) begin
		IRQ1 <= #20 0;
		IRQ2 <= #20 0;
		//IntReq <= #20 0;
		IntStatus <= #20 0;
		end
	else begin
		IRQ1 <= #20 ~nIRQ;
		IRQ2 <= #20 IRQ1;
		//IntReq <= #20 (IRQ2 & IntStatus);//(IRQ2 & ~InISR) | (IRQ1 & ~IRQ2) | (IntReq & ~IntClear);
		if(IntEnable)
			IntStatus <= #20 1;
		if(IntDisable)
			IntStatus <= #20 0;
	end
end
assign IntReq = IRQ2 & IntStatus;
//assign IntReq = (IRQ2 & ~InISR) | (IRQ1 & ~IRQ2); //first - if we're not in an
//interupt and we get a request. Second, if request is satisfied and we get a
//new one, we want to go back in - allows nestedd


// AJR - Now in opcodes
//enum {
//   fetch,
//   execute,
//   interrupt
//}  state;
//enum { 	
//	cycle0,
//   	cycle1,
//   	cycle2,
//   	cycle3,
//   	cycle4     
//}  	stateSub;

state_t state;
stateSub_t stateSub;

always_ff@(posedge Clock or negedge nReset) begin
	// Major states
	if(!nReset) begin
 	    StatusReg <= #20 0;
	  	state <= #20 fetch;
      	stateSub <= #20 cycle0;
		//InISR <= #20 0;
	end else begin 
	// Status update
      	if (StatusRegWe)
			StatusReg <= #20 StatusRegIn;
	// Interrupt
	if(state == interrupt)
		case(stateSub)
			cycle0: begin stateSub <= #20 cycle1; end
			cycle1: stateSub <= #20 cycle2;
			cycle2: stateSub <= #20 cycle3;
			cycle3: begin stateSub <= #20 cycle0; state <= #20 fetch; end
			cycle4: begin stateSub <= #20 cycle0; end
		endcase
  	// Fetch  
    if(state == fetch)
     	case(stateSub)
        	cycle0: stateSub <= #20 cycle1;	
        	cycle1: stateSub <= #20 cycle2;
        	cycle2: if(nWait)
						stateSub <= #20 cycle3;		// !!!!!  Watch out for repeated operations in this state
        	cycle3:begin							// Should never get in cycle4 in fetch 
						state <= #20 execute;
     					stateSub <= #20 cycle4;
					end
		endcase
    // Execute     
    if(state == execute) 
     	case(stateSub)
        	cycle4: case(Opcode)
        				ADD, ADDI, ADDIB, ADC, ADCI, SUB, SUBI, SUBIB, SUC, SUCI, LUI, 
						LLI, RET, CMP, CMPI, AND, OR, XOR, NOT, NAND, NOR, LSL, LSR, ASR, NEG, BRANCH: begin 
							if (IntReq) begin 
								state <= #20 interrupt; //got an interrupt
								stateSub <= #20 cycle4;
							end else begin 
								state <= #20 fetch;	// Single cycle ops
								stateSub <= #20 cycle0;
							end
						end
            			LDW, STW,PUSH,POP: 	
							stateSub <= #20 cycle0;
						INTERRUPT: begin
							if ( BranchCode == 0 | BranchCode == 3 | BranchCode == 4)
								stateSub <= #20 cycle0; //if a return from interrupt
							else begin
								state <= #20 fetch; //else single cycle
								stateSub <= #20 cycle0;
							end	
						end//INTERRUPT
              		endcase
        	cycle0:	stateSub <= #20 cycle1;	
        	cycle1: stateSub <= #20 cycle2;  		
			cycle2: if(nWait)						// Data setup, stay in place
						stateSub <= #20 cycle3;	
			cycle3:begin
//				stateSub <= #20 cycle0; //always go to cycle 0
				if(IntReq) begin
					state <= #20 interrupt;
					stateSub <= #20 cycle4;
				end
				else
				begin
					state <= #20 fetch;	
					stateSub <= #20 cycle0;
				end
//				if(Opcode == INTERRUPT && BranchCode == 0) InISR <= #20 0; //
			end
     	endcase
   	end
end

always_comb begin
   	// Default outputs   
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
	//IntClear = 0;
	IntEnable = 0;
	IntDisable = 0;
	StatusRegEn = 0;
	FlagSel = FlagAlu;
	AluOR = nOR;
	case(state)
      	fetch : 
         	case(stateSub)
            	cycle0: begin ALE = 1;  nWE  = 1; nOE  = 1; PcEn  = 1; end 
            	cycle1: begin nME = 0; nWE = 1;  PcEn =1;nOE = 1;  end
            	cycle2: begin nME = 0; MemEn = 1; ENB = 1; nWE   = 1; IrWe = nWait; end 
            	cycle3: begin nWE = 1; PcEn = 1;end//MemEn = 1; ENB = 1; end
         	endcase
      	execute: begin
         	case(stateSub)
            	cycle4: begin    					
					case(Opcode)
                  		ADD:begin				
		            		PcEn = 1;   		
							Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
							StatusRegWe = 1;
                        end
                  		ADDI:begin				
		                	PcEn = 1;   		
							Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ADDIB:begin
        		        	PcEn = 1;   		
                           	Op1Sel = Op1Rd1;
                           	Rs1Sel = Rs1Rd;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ADC:begin
		                	PcEn = 1;   		
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		ADCI:begin
		                	PcEn = 1;   		
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		SUB:begin
							PcEn = 1;   		
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
							StatusRegWe = 1;
                        end
                  		NEG:begin
   		            		PcEn = 1;   
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
							StatusRegWe = 1;
                        end
                  		SUBI:begin
   		                	PcEn = 1;   
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		SUBIB:begin
   		                	PcEn = 1; 
                           	Op1Sel = Op1Rd1;
                           	Rs1Sel = Rs1Rd;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		SUC:begin
		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		SUCI:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		CMP:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
						end
                  		CMPI:begin
   		                	PcEn = 1; 
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		AND:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		OR:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		XOR:begin
   		                	PcEn = 1;   
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NOR:begin
   		                	PcEn = 1;   
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NAND:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NOT:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		LSL:begin
   		                	PcEn = 1;  
							ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;Op2Sel = Op2Imm;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		LSR:begin
   		                	PcEn = 1;  
                           	Op1Sel = Op1Rd1;
							ImmSel = ImmShort;
							Op2Sel = Op2Imm;
                           	RegWe = 1;
                           	PcWe = 1;
							StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ASR:begin
   		                	PcEn = 1;  
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
						end
						BRANCH:begin
							case(BranchCode)	
								BR,BNE,BE,BLT,BGE,BWL:begin		// Conditional branching
									PcWe = 1;
									ImmSel = ImmLong;
									Op1Sel = Op1Pc;
									AluEn = 1;
									if(	(BranchCode == BR	) 	|| 
										(BranchCode == BWL	)	||
										((BranchCode == BNE	) 	&& 	(StatusReg[`FLAGS_Z] == 0))		||
										((BranchCode == BE 	) 	&& 	(StatusReg[`FLAGS_Z] == 1)	) 	||
										((BranchCode == BLT	)	&&  ((StatusReg[`FLAGS_N] && ~StatusReg[`FLAGS_V])	|| (~StatusReg[`FLAGS_N] && StatusReg[`FLAGS_V]))	)	||
										((BranchCode == BGE	)	&&  ((StatusReg[`FLAGS_N] && StatusReg[`FLAGS_V]) 	|| (~StatusReg[`FLAGS_N] && ~StatusReg[`FLAGS_V])))	) begin 
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
							AluWe = 1;
						end 
						INTERRUPT: begin
							case(BranchCode)
								// 0,4
								0,4: begin //RETI and LDF
									Rs1Sel = Seven; //chose SP
   									AluEn = 1;
									Op1Sel = Op1Rd1;
									Op2Sel = Op2zero;
									ImmSel = ImmShort;
									AluWe = 1;	
								end //0 
								// 1
								1: begin
									PcWe = 1;
									PcSel = Pc1;
									PcEn = 1; 
									IntEnable = 1;
								end //1
								// 2
								2: begin
									PcWe = 1;
									PcSel = Pc1;
									PcEn = 1; 
									IntDisable = 1;
								end //2
								// 3
								3: begin // STF
									Rs1Sel = Seven; //chose SP
   									AluEn = 1;
									Op1Sel = Op1Rd1;
									AluOR  = subOR;
						      		AluWe = 1;
									RegWe = 1;
									WdSel = WdAlu;
									RwSel = RwSeven;
								end
							endcase
						end //INTERRUPT
            		endcase //opcode
         		end //cycle0
         		cycle0:begin
					case(Opcode)
						LDW,STW:begin
							ALE = 1;
	                		nWE = 1;
					        nOE = 1;
							ImmSel = ImmShort;
							//AluOp = FnADD;
							Op1Sel = Op1Rd1;
							AluEn = 1;
						end
						PUSH,POP:begin
							ALE = 1;
							nWE = 1;
							nOE = 1;
							ImmSel = ImmShort;
							Op1Sel = Op1Rd1;
							Rs1Sel = Seven;
							AluEn = 1;
						end
						INTERRUPT:begin
							ALE = 1;
							nWE = 1;
							nOE = 1;
							Op1Sel = Op1Rd1;
							Op2Sel = Op2zero;
							Rs1Sel = Seven;
							AluEn = 1;
						end
					endcase
         		end
         		cycle1: begin
            		case(Opcode)
               			LDW:begin
						nME = 0;
                        			Op1Sel = Op1Rd1;
						Op2Sel = Op2zero;
			             		Rs1Sel = Rs1Rd;
						//MemEn = 1;
						nOE = 1;
						nWE = 1;
        	               			AluWe = 1;			// Pass right through on next clock
	                	    		AluEn = 1;
				end
					STW:begin					// Get the data out of the reg
        	                		nME = 0;
						Op1Sel = Op1Rd1;
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
						    Op2Sel = Op2zero;
							Rs1Sel = Rs1Ra;
							nOE = 1;
							nWE = 1;
							AluWe = 1; // Pass right through on next clock
							AluEn = 1;
						end
						POP:begin
						 	nME = 0;
							nOE = 1;
						  	Op1Sel = Op1Rd1;
							Op2Sel = Op2zero;
							Rs1Sel = Seven;
							//MemEn = 1;
							nWE = 1;
							AluEn = 1;
						end
						INTERRUPT: begin
							nME = 0;
							Op1Sel = Op1Rd1;
							Op2Sel = Op2zero;
							Rs1Sel = Seven;
							nOE = 1;
							//MemEn = 1;
							nWE = 1;
							AluEn = 1;
						end
            		endcase
         		end
         		cycle2: begin
            		PcWe = nWait;
			PcSel = Pc1; // Done, move on
			case(Opcode)
				LDW:begin
					nME = 0;
					MemEn = 1;
					ENB = 1;
					nWE = 1;
					WdSel = WdSys;
	  				RwSel = RwRd;
	  				RegWe = 1;	
				end
               			STW:begin
					nME = 0;
	                        	AluEn = 1;			// Hold data on sysbus
        	                	nOE = 1;               
                	     		Op2Sel = Op2zero;
				end  
				PUSH:begin
					nME = 0;	
					nOE = 1;	
					if(OpcodeCondIn[2]) begin	// 1 = LR
						LrEn = 1;
					end else begin
						AluEn = 1;
						AluWe = 1;
						Rs1Sel = Rs1Ra;
						Op2Sel = Op2zero;
					end
				end
				POP:begin
					nME = 0;
					MemEn = 1;
					ENB = 1;
					nWE = 1;
					WdSel = WdAlu;
					//ImmSel = ImmShort;
					//Op2Sel = Op2Imm;
					if(OpcodeCondIn[2]) begin // 1 = LR
						LrWe = 1;
					end else begin
						RegWe = nWait;
						Rs1Sel = Rs1Rd;
						RwSel = RwRa;
						WdSel = WdSys;
					end
					//Rs1Sel = Seven;
					//WdSel = WdAlu;
					//RwSel = RwSeven;
				end
						INTERRUPT: begin
							case(BranchCode)
								0,4:begin
									nME = 0;
									MemEn = 1;
									ENB = 1;
									if (BranchCode == 0) 
										PcSel = PcSysbus;
									else
									begin
										FlagSel = FlagSys;
										StatusRegWe = 1;
									end
									nWE = 1;
								end
								3:begin
									StatusRegEn = 1;
									nME = 0;
									nOE = 1;
								end
							endcase
						end
            		endcase  
         		end
         		cycle3: begin
         			//PcWe = 1;
					//PcSel = Pc1; // Done, move on
	  				nME = 1;
	  				case(Opcode)
	  					LDW: begin
	  						nWE = 1;
							PcEn = 1;
	  						//MemEn = 1;
							//ENB = 1;
	  						//WdSel = WdSys;
	  						//RwSel = RwRd;
	  						//RegWe = 1;
	  						//WdSel = WdSys;
	  					end
	  					STW: begin
	  						nWE = 0;
							nOE = 1;
	  						AluEn = 1;
							Op2Sel = Op2zero;
	  					end
	  					PUSH:begin
	  						nOE = 1;
							if(OpcodeCondIn[2]) begin // 1 = LR
								LrEn = 1;
							end else begin
								AluEn = 1;
								Rs1Sel = Rs1Ra;
								Op2Sel = Op2zero;
							end
						end
						POP:begin
							nWE = 1;
							PcEn = 1;
							//MemEn = 1;	
							//ENB = 1;
				//			if(OpcodeCondIn[2]) begin // 1 = LR
				//				LrWe = 1;
				//			end else begin
				//				RegWe = 1;
				//				Rs1Sel = Rs1Rd;
				//				RwSel = RwRa;
				//				WdSel = WdSys;
				//			end
							RegWe = 1;
							ImmSel = ImmShort;
							Op2Sel = Op2Imm;
							Rs1Sel = Seven;
							WdSel = WdAlu;
							RwSel = RwSeven;
						end
						INTERRUPT:begin
							case(BranchCode)
								0: begin
									nWE = 1;
									PcEn = 1;
									//PcWe = 1;
									//PcSel = PcSysbus;
									//MemEn = 1;
									//ENB = 1;
									//nME = 0;
									//nME = 1;
									Rs1Sel = Seven;
									Op2Sel = Op2zero;
									AluOR = addOR;
									WdSel = WdAlu;
									RwSel = RwSeven;
									RegWe = 1;
								end
								3: begin
									nOE = 1;
									StatusRegEn = 1;
								end
								4:	begin
									Rs1Sel = Seven;
									PcEn = 1;
									//MemEn = 1;
									//ENB = 1;
									nWE = 1;	
									Op2Sel = Op2zero;
									AluOR = addOR;
									WdSel = WdAlu;
									RwSel = RwSeven;
									RegWe = 1;
									FlagSel = FlagSys;
									//StatusRegWe = 1;
								end
							endcase
						end
					endcase
				
				
				end
         	endcase
      	end
	interrupt:
		case(stateSub)
			cycle4:begin
				IntDisable = 1;
				Rs1Sel = Seven;//choose sp
				AluOR = subOR;
				Op1Sel = Op1Rd1;
				Op2Sel = Op2zero;
				RegWe = 1;
				RwSel = RwSeven;
				WdSel = WdAlu;
				AluWe = 1;
				AluEn = 1;
			end
			cycle0:begin
			   	nWE = 1;
				nOE = 1;
				AluOR = subOR;
				Op2Sel = Op2zero;
				Op1Sel = Op1Rd1;
				Rs1Sel = Seven;
				AluEn = 1;
				ALE = 1;
			end
			cycle1: begin
				nME = 0;
				Op2Sel = Op2zero;
				Op1Sel = Op1Rd1;
				nOE = 1;
				nWE = 1;
				AluEn = 1;
			end
			cycle2: begin
				nME = 0;
				PcEn = 1; // Hold data on sysbus
				nOE = 1;
			end
			cycle3: begin
				nOE = 1;
				PcEn = 1;
			//	IntClear = 1;
				PcSel = PcInt;
				PcWe = 1;
			end
		endcase
	endcase
end
endmodule
