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
                     ADD, ADDI, ADDIB, ADC, ADCI, SUB, SUBI, SUBIB, SUC, SUCI, LUI, LLI, RET, CMP, CMPI, AND, OR, XOR, NOT, NAND, NOR, LSL, LSR, ASR: 	state <= #20 fetch;	// Single cycle ops
                	LDW, STW, JMP: 	executeSub <= exe2;
                  endcase
            exe2: case(Opcode)
            		LDW, STW: 	executeSub <= exe3;
                  	JMP: state <= fetch;	
				  endcase
            exe3: case(Opcode)
                     LDW, STW: 	executeSub <= exe4;
                  endcase
            exe4: case(Opcode)
                     LDW, STW: 	executeSub <= exe5;
                  endcase
            exe5: case(Opcode)
                     LDW, STW:	state <= fetch;
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
   	nME      = 0;
   	ENB      = 0;
   	ALE      = 0;
	StatusRegWe= 0;
   	case(state)
      	fetch : 
         	case(fetchSub)
            	fet1: begin ALE = 1; nME = 1; nWE  = 1; nOE  = 1; PcEn  = 1; end 
            	fet2: begin nWE = 1; MemEn = 1; end
            	fet3: begin MemEn = 1; ENB = 1; nWE   = 1; end 
            	fet4: begin nME = 1; nWE = 1; MemEn = 1; IrWe  = 1;  end
         	endcase
      	execute: begin
         	case(executeSub)
            	exe1: begin    // Single cycle ops
               		case(Opcode)
                  		ADD:begin
                        	nME = 1;    // Memory enable
		            		PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnADD;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
				StatusRegWe = 1;
                        end
                  		ADDI:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnADD;
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ADDIB:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnADD;
                           	Op1Sel = Op1Rd1;
                           	Rs1Sel = Rs1Rd;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		ADC:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		ADCI:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBu
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		SUB:begin
                        	nME = 1;    // Memory enable
		            		PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	RegWe = 1;
                           	PcWe = 1;
                           	PcSel = Pc1;
				StatusRegWe = 1;
                        end
                  		SUBI:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		SUBIB:begin
                           	nME = 1;    // Memory enable
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
                           	nME = 1;    // Memory enable
		                PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		SUCI:begin
                           	nME = 1;    // Memory enable
		                PcEn = 1;   // output the PC to SysBu
                           	AluOp = FnADC;
                           	Op1Sel = Op1Rd1;
                           	RegWe = 1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                    	end
                  		CMP:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
			end
                  		CMPI:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnSUB;
                           	Op1Sel = Op1Rd1;
                           	ImmSel = ImmShort;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		AND:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnAND;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		OR:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnOR;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		XOR:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnXOR;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NOR:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnNOR;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NAND:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnNAND;
                           	Op1Sel = Op1Rd1;
                           	Op2Sel = Op2Rd2;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		NOT:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnNOT;
                           	Op1Sel = Op1Rd1;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		LSL:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnLSL;
				ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;
				Op2Sel = Op2Imm;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
                  		LSR:begin
                           	nME = 1;    // Memory enable
		                	PcEn = 1;   // output the PC to SysBus
                           	AluOp = FnLSR;
                           	Op1Sel = Op1Rd1;
				ImmSel = ImmShort;
				Op2Sel = Op2Imm;
                           	PcWe = 1;
				StatusRegWe = 1;
                           	PcSel = Pc1;
                        end
				LDW,STW:begin			// Add must be done before address out
                           	nME = 1;  
							ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;
							AluOp = FnADD;
                           	AluEn = 1;			// Pass right through on next clock
                           	AluWe = 1;
                    	end
						LUI:begin
							nME = 1;
							ImmSel = ImmLong;
							Op2Sel = Op2Imm;
							WdSel = WdAlu;
							AluOp = FnIMM;
							RegWe = 1;
							AluEn = 1;
							PcWe = 1;
							PcSel = Pc1;

						end
						LLI:begin
							nME = 1;
							ImmSel = ImmLong;
							Op2Sel = Op2Imm;
							WdSel = WdAlu;
							AluOp = FnIMM;
							RegWe = 1;
							AluEn = 1;
							PcWe = 1;
							PcSel = Pc1;
						end
						RET:begin
							nME = 1;
							LrWe = 1;
							PcEn = 1;
							PcSel = PcSysbus;
						end
						BR:begin

						end
						BNE:begin

						end
						BE:begin

						end
						BLT:begin

						end
						BGE:begin

						end
						BWL:begin

						end
						JMP:begin
							AluOp = FnADD;
							ImmSel = ImmShort;
                           	Op1Sel = Op1Rd1;
							AluWe = 1;
						end
						PUSH_POP:begin

						end	
            		endcase
         		end
         		exe2:begin 
            		case(Opcode)
               			LDW,STW:begin  
							ImmSel = ImmShort;
							AluOp = FnADD;
							Op1Sel = Op1Rd1;
							nME = 1;			// Address on sysbus, latch in
                        	ALE = 1;
							nWE = 1;
                        	nOE = 1;
                        	AluEn = 1;
                     	end
						JMP:begin
							AluEn = 1;
							LrWe = 1;
							LrSel = LrSys;
							PcSel = Pc1;
							PcWe = 1;
						end
            		endcase
         		end
         		exe3: begin
            		case(Opcode)
               			LDW:begin	
                        	Op1Sel = Op1Rd1;
							AluOp = FnMEM;		// Nothing done to op1
                        	Rs1Sel = Rs1Rd;
							MemEn = 1;
                        	nWE = 1;
                     		AluWe = 1;			// Pass right through on next clock
                        	AluEn = 1;
						end
						STW:begin			// Get the data out of the reg
                        	Op1Sel = Op1Rd1;
							AluOp = FnMEM;		// Nothing done to op1
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
							MemEn = 1;
							ENB = 1;
							nWE = 1;
						end
               			STW:begin
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
							nME = 1;
							nWE = 1;
							MemEn = 1;
							WdSel = WdSys;
							RegWe = 1;
						end
						STW:begin				
							AluEn = 1;
                       		nOE = 1;
							nME = 1;
					 	end
           	 		endcase 
         		end
         	endcase
      	end
	endcase
end
endmodule
