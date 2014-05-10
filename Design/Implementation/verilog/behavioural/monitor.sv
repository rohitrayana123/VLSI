// This special monitor file is customized for the example cpu

// finish when the processor attempts to read an instruction from address 99
// 
//
//  (for your CPU you may need to change the termination address [99]
//   alternatively you may wish to delete this section altogether
//   and rely on the simulation termination for another reason
//  )
//
//always @(posedge nME)
//   if ( Address == 99 )
//      begin
//         $display("Terminating at address 99\n");
//         @(posedge nME);
//         $stop;
//         $finish;
//      end

`ifdef behavioural

int encount; 
always @(negedge Clock)
begin
	encount = 0;
	if(CPU.CPU_core.MemEn) 
		encount++;
	
	if(CPU.CPU_core.PcEn) 
		encount++;
	
	if(CPU.CPU_core.LrEn) 
		encount++;
	
	if(CPU.CPU_core.AluEn) 
		encount++;
	
	if(CPU.CPU_core.StatusRegEn) 
		encount++;
	
	assert(1 == encount) else begin 
		if (encount == 0)
			$display("SysBus is Undriven");
		else begin
			$display("Bus Conention");
			if(CPU.CPU_core.MemEn) 
				$display("Memory driving bus"); 
		
			if(CPU.CPU_core.PcEn) 
				$display("Pc driving bus");
		
			if(CPU.CPU_core.LrEn) 
				$display("Lr driving bus");
		
			if(CPU.CPU_core.AluEn) 
				$display("Alu driving bus");
				
			if(CPU.CPU_core.StatusRegEn) 
				$display("StatusReg driving bus");
		end
	end
	assert (CPU.CPU_core.MemEn == CPU.CPU_core.ENB) else begin $display("MemEn and ENB not asserted together");end
end
`endif
logic [15:0] sysir;
`ifdef extracted
assign sysir = CPU.Ir;
`elsif crosssim
assign sysir = CPU.CPU_core.Ir;
`else
assign sysir = CPU.CPU_core.datapath.Ir;
`endif
logic [30:0][7:0] Dissembly;
assign Dissembly = disassemble(sysir);

function [30:0][7:0] disassemble;
   input [15:0] instruction;
   case (Opcode_t'(instruction[15:11]))
	PUSH,POP: return {get_opmnemonic(instruction[15:11]), (instruction[10] ? "LR R" : "  R"), itoa_4(instruction[7:5])};
	INTERRUPT: return get_intmnemonic(instruction[10:8]);
	BRANCH: 
		case(Branch_t'(instruction[10:8]))
			RET: return "RET";
			JMP: return {"JMP R", itoa_4(instruction[7:5]), itoa(instruction[4:0])};
			default: return {get_branchmnemonic(sysir[10:8]), " ", itoa(instruction[7:0])};
		endcase
	ADDIB,SUBIB,LUI,LLI: return {get_opmnemonic(sysir[15:11]), " R", itoa(instruction[10:8]), " ", itoa(instruction[7:0])};
	LDW,STW: return {get_opmnemonic(instruction[15:11]), " R", itoa(instruction[10:8])," R", itoa(instruction[7:5])," ", itoa(instruction[4:0])};
 	ADD,ADC,NEG,SUB,SUC,CMP,AND,OR,XOR,NOT,NAND,NOR: return {get_opmnemonic(instruction[15:11]), " R", itoa(instruction[10:8])," R", itoa(instruction[7:5])," R", itoa(instruction[4:2])};
	
	ADDI, ADCI, SUBI, SUCI, CMPI: return {get_opmnemonic(instruction[15:11]), " R", itoa(instruction[10:8])," R", itoa(instruction[7:5])," ", itoa(instruction[4:0])};


	LSL, LSR, ASR: return {get_opmnemonic(instruction[15:11]), " R", itoa(instruction[10:8])," R", itoa(instruction[7:5])," ", itoa(instruction[3:0])};


	default: return "XXXX";	
   endcase
endfunction

function [3:0][7:0] get_intmnemonic;
   input [2:0] intcode;
   case(intcode)
	0  : return "RETI";
	1  : return "ENAI"; 
	2  : return "DISI"; 
	3  : return "STF "; 
	4  : return "LDF "; 
	default : return "X"; 
   endcase
endfunction

function [2:0][7:0] get_branchmnemonic;
   input [2:0] brcode;
   case(Branch_t'(brcode))
	BR  : return "BR ";
	BNE : return "BNE"; 
	BE  : return "BE "; 
	BLT : return "BLT"; 
	BGE : return "BGE"; 
	BWL : return "BWL"; 
	RET : return "RET"; 
	JMP : return "JMP"; 
   endcase
endfunction

function [5:0][7:0] get_opmnemonic;
   input [9:0] opcode;
   case (Opcode_t'(opcode))
	ADD 		: return "ADD"; 	
	ADDI 		: return "ADDI"; 		 
	ADDIB		: return "ADDIB";		 
	ADC		: return "ADC";		 
	ADCI		: return "ADCI";		 
	NEG  		: return "NEG";  		 
	SUB    		: return "SUB";    		 
	SUBI   		: return "SUBI";   		 
	SUBIB  		: return "SUBIB";  		 
	SUC    		: return "SUC";    		 
	SUCI   		: return "SUCI";   		 
	CMP    		: return "CMP";    		 
	CMPI   		: return "CMPI";   		 
	AND    		: return "AND";    		 
	OR     		: return "OR";     		 
	XOR    		: return "XOR";    		 
	NOT    		: return "NOT";    		 
	NAND   		: return "NAND";   		 
	NOR    		: return "NOR";    		 
	LSL    		: return "LSL";    		 
	LSR    		: return "LSR";    		 
	ASR    		: return "ASR";    		 
	LDW   		: return "LDW";   		 
	STW    		: return "STW";    		 
	LUI    		: return "LUI";    		 
	LLI	  	: return "LLI";	  	 
	BRANCH 	 	: return "BRANCH"; 	 	 
	INTERRUPT 	: return "INTERRUPT"; 	 
	PUSH		: return "PUSH";		 
	POP		: return "POP";		 
	NOP		: return "NOP";		 
   endcase
endfunction


function [8:1] itoa_4;
  input [3:0] val;
  if ( val < 10 )  
    return "0"+val;
  else if ( val >= 10 )
    return "A"-10+val;
  else
    return "X";
endfunction

function [3:0][7:0] itoa;
  input [15:0] val;
  return {itoa_4(val[15:12]),
          itoa_4(val[11:8]),
	  itoa_4(val[7:4]),
	  itoa_4(val[3:0])};
endfunction


`ifdef whitenoise
wire [15:0] PcProbe;
`ifdef behavioural
assign PcProbe = system.CPU.CPU_core.datapath.Pc;
`endif
`ifdef extracted
assign PcProbe = system.CPU.Pc;
integer out;
`endif
always @ (posedge Clock)
	if (PcProbe >= 16'h07FF)
	begin
	`ifdef behavioural
		$writememh("WN_behavioural.hex",
system.CPU.CPU_core.datapath.regBlock.regs);
	`endif
	`ifdef extracted
		out = $fopen("WN_ext.hex","w");
		$fwrite(out, "%h\n", system.CPU.reg0);
		$fwrite(out, "%h\n", system.CPU.reg1);
		$fwrite(out, "%h\n", system.CPU.reg2);
		$fwrite(out, "%h\n", system.CPU.reg3);
		$fwrite(out, "%h\n", system.CPU.reg4);
		$fwrite(out, "%h\n", system.CPU.reg5);
		$fwrite(out, "%h\n", system.CPU.reg6);
		$fwrite(out, "%h\n", system.CPU.reg7);
		$fclose(out);
	`endif
		$stop;
	end
`endif
