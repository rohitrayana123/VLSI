module datapath_stim;

timeunit 1ns; timeprecision 10ps;
import opcodes::*;
parameter CLK_PERIOD = 100;

wire  [15:0]   	SysBus;
logic [15:0]    DataIn;     
wire  [9:0]    	Opcode;     
wire  [3:0]    	Flags;  
alu_functions_t AluOp;
Op1_select_t   	Op1Sel;
pc_select_t 	PcSel;
logic Op2Sel, WdSel, AluEn, SpEn, SpWe, LrEn, LrWe, PcWe, PcEn, IrWe, ImmSel, RegWe, Clock, nReset, MemEn, LrSel, Rs1Sel, CFlag, AluWe;
datapath dp(                                           
   .SysBus        (SysBus  ),    // Outputs from DUT
   .Opcode        (Opcode  ),
   .Flags         (Flags   ),
   .AluOp         (AluOp   ),    // Inputs to DUT
   .Op2Sel        (Op2Sel  ),
   .Op1Sel        (Op1Sel  ),
   .WdSel         (WdSel   ),
   .AluEn         (AluEn   ),
   .AluWe 	  (AluWe   ),
   .SpEn          (SpEn    ),
   .SpWe          (SpWe    ),
   .LrEn          (LrEn    ),
   .LrWe          (LrWe    ),
   .LrSel	  (LrSel   ),
   .PcWe          (PcWe    ),
   .PcSel         (PcSel   ),
   .PcEn          (PcEn    ),
   .IrWe          (IrWe    ),
   .ImmSel        (ImmSel  ),
   .RegWe         (RegWe   ),
   .Clock         (Clock   ),
   .nReset        (nReset  ),
   .DataIn	  (DataIn  ),
   .MemEn	  (MemEn   ),
   .Rs1Sel	  (Rs1Sel  ),
   .CFlag	  (CFlag   )
);

always begin   #(CLK_PERIOD/2) Clock = 0;
               #(CLK_PERIOD/2) Clock = 1;         
end

initial 
begin
	nReset = 1;
	#CLK_PERIOD nReset = 0;
	#CLK_PERIOD nReset = 1;
end

int errors;
logic [15:0] temp;
//test routine
initial
begin
	temp = 0;
	errors = 0;
	DataIn = 0;
	AluOp  = 0;
	Op2Sel = 0; 
	PcSel  = Pc1;
	Op1Sel = Op1Rd1; 
	AluEn  = 0; 
	SpEn   = 0; 
	SpWe   = 0; 
	LrEn   = 0;  
	LrWe   = 0;  
	PcWe   = 0; 
	PcEn   = 0;
	IrWe   = 0; 
	WdSel  = 0; 
	ImmSel = 0; 
	RegWe  = 0; 
	MemEn  = 0; 
	LrSel = 0;
	Rs1Sel = 0;
	CFlag = 0;
	#CLK_PERIOD
	#CLK_PERIOD
	//Test the PC increments
	PcEn = 1; //output PC to Sysbus
	PcSel = Pc1; //set the input to pc+1
	PcWe = 1; //write enable
	#CLK_PERIOD PcWe = 0; // increment once - PC should be 1
	assert(1 == SysBus) else begin $display("PC inc error"); errors++; end
	#CLK_PERIOD 
	assert(1 == SysBus) else begin $display("PC inc error"); errors++; end
	PcWe = 1; 
	#CLK_PERIOD 
	assert(2 == SysBus) else begin $display("PC inc error"); errors++; end
	PcWe = 0;
	PcEn = 0;
	//PC to LR
	LrEn = 1; //output link register
	LrWe = 1; //write LR with PC value
	//@todo make LrSel a defined value (typedef again?)
	LrSel = 1;
	#CLK_PERIOD assert(2 == SysBus) else begin $display("PC to LR error"); errors++; end
	LrWe = 0; //don't write
	LrEn = 0;
	//LR to PC
	//increment PC, check it's 3, 
	PcSel = Pc1;
	PcWe = 1;
	PcEn = 1; //output PC to sysbus
	#CLK_PERIOD 
	assert(3 == SysBus) else begin $display("PC inc error"); errors++; end
	//restore LR (2) back to PC
	PcSel = PcLr; 
	#(1.1*CLK_PERIOD )
	//Check PC = 2
	assert(2 == SysBus) else begin $display("Lr to PC error"); errors++; end
	#(0.9*CLK_PERIOD)
	PcWe = 0;
	PcEn = 0;
	
	//test storing to IR - opcode out
	
	temp = 42405; // 16'b 1010 0101 1010 0101 
	DataIn = 42405;
	//while we're here, check the DataIn to SysBus
	MemEn = 1; //enable Data in
	#(0.5*CLK_PERIOD) assert(SysBus == DataIn ) else begin errors ++;
$display("MemEn Error"); end
	IrWe = 1; 
	#CLK_PERIOD assert ({DataIn[15:9], DataIn[2:0]} == Opcode) else begin
errors++; $display("IR Error"); end
	IrWe = 0;
	MemEn = 0;

	//Test writing to reg and reading back
	for (int temp = 0; temp < 8; temp++)
	begin
		WdSel = 1; //choose from sysbus
		Rs1Sel = 1;
		//load reg into IR
		MemEn = 1; //enable memory in
		AluOp = FnMem;//pass through
		DataIn = temp;
		IrWe = 1; //write to Ir
		#1000 //hold
		IrWe = 0;
		assert(Opcode[2:0] == temp[2:0]) else begin errors++; $display("Ir Error"); end
		//register now chosen, write data to it
		RegWe = 1;
		#CLK_PERIOD 
		AluWe = 1; //write it to the ALUOUT
		MemEn = 0;
		AluEn = 1; //output the ALUOUT to sysbus
		//temp should be in reg[temp]. ALU op is to pass through. 
		//ALU is outputted
		#1000
		assert(SysBus == temp) else begin errors++; $display("ALU or Reg write error"); end 
		AluEn = 0;
		#1000 MemEn = 1; //restart the sequence
	
	end

	#1000 $stop();
end
endmodule
