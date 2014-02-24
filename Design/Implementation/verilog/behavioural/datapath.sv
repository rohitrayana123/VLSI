module datapath(
  output wire  [15:0]   SysBus,
  output wire  [9:0]    Opcode,
  output logic [3:0]    Flags,
  input  wire  [15:0]   DataIn,
  input  opcodes::alu_functions_t AluOp,
  input  opcodes::pc_select_t    PcSel,
  input  opcodes::Op1_select_t    Op1Sel,
  input  wire           AluEn, SpEn, SpWe, LrEn, LrWe, PcWe, PcEn, IrWe, WdSel, ImmSel, RegWe, MemEn, Clock, nReset, Op2Sel, LrSel, Rs1Sel, CFlag, AluWe
);

import opcodes::*;
timeunit 1ns; timeprecision 100ps;

wire  [15:0]   AluRes, Rd1, Rd2, WData, Extended;
logic [15:0]   Op1, Op2, AluOut, Pc, PcIn, Sp, Lr, Ir, LrIn;
logic [2:0] Rs1In;

//Combinational logic for tristate bus, reg inputs or outputs
assign Extended = (ImmSel) ? {{11{Ir[4]}}, Ir[4:0] } : { {8{Ir[7]}}, Ir[7:0]};
assign Opcode = {Ir[15:9], Ir[2:0]};
assign SysBus = (MemEn) ? DataIn : {16{1'bz}};
assign WData = (WdSel) ? SysBus : AluRes; // 2 input mux
assign Op2 = (Op2Sel) ? Rd2 : Extended;
assign LrIn = (LrSel) ? Pc : SysBus;
assign Rs1In = (Rs1Sel) ? Ir[4:2] : Ir[10:8]; 
//Multiplexers
always_comb begin : PcInMux
	case(PcSel)                      // 3 input mux
            PcLr        :  PcIn <= Lr;
            PcAluOut    :  PcIn <= AluOut;
            PcSysbus    :  PcIn <= SysBus;
            Pc1         :  PcIn <= Pc + 1;
         endcase
end

always_comb begin : OpMux                 // Control ALU data input
   case(Op1Sel)                           // 3 input mux
      	Op1Rd1   :  Op1 = Rd1;
	Op1Pc    :  Op1 = Pc;
	Op1Sp    :  Op1 = Sp;	
	default  :  Op1 = Rd1;
   endcase
//   case(Op2Sel)                           // 3 input mux
//      0        :  Op2 = Extended;
//      default  :  Op2 = Rd2; 
//   endcase
end

// Instances

regBlock regBlock(      // Register block instance                         
   .Rd1     (Rd1     ),
   .Rd2     (Rd2     ),
   .WData   (WData   ),
   .Rs1     (Rs1In   ),
   .Rs2     (Ir[7:5] ),
   .Rw      (Ir[10:8]),
   .Clock   (Clock   ),
   .nReset  (nReset  ),
   .We      (RegWe   )
);
alu a(                // Combo ALU only
   .Flags   (Flags   ), 
   .Result  (AluRes  ),
   .Op1     (Op1     ),
   .Op2     (Op2     ),
   .AluOp   (AluOp   )
);

//Registers
trisreg Reg_PC (
	.Clock  (Clock   ), 
	.nReset (nReset  ),
	.Reg_EN (PcEn    ),
	.Reg_WE (PcWe    ),
	.DataIn (PcIn    ),
	.DataOut(Pc      ),
	.TrisOut(SysBus  )
);
trisreg Reg_LR (
	.Clock  (Clock   ), 
	.nReset (nReset  ),
	.Reg_EN (LrEn    ),
	.Reg_WE (LrWe    ),
	.DataIn (LrIn    ),
	.DataOut(Lr      ),
	.TrisOut(SysBus  )
);
trisreg Reg_SP (
	.Clock  (Clock   ), 
	.nReset (nReset  ),
	.Reg_EN (SpEn    ),
	.Reg_WE (SpWe    ),
	.DataIn (AluRes  ),
	.DataOut(Sp      ),
	.TrisOut(SysBus  )
);
trisreg Reg_IR (
	.Clock  (Clock   ), 
	.nReset (nReset  ),
	.Reg_EN (1'b0    ),//does not utilise the tristate bus as an output, length gets rid of warnings
	.Reg_WE (IrWe    ),
	.DataIn (SysBus  ),
	.DataOut(Ir      ),
	.TrisOut() //not used
);
trisreg Reg_ALUOUT (
	.Clock  (Clock   ), 
	.nReset (nReset  ),
	.Reg_EN (AluEn   ),
	.Reg_WE (AluWe   ),
	.DataIn (AluRes  ),
	.DataOut(AluOut  ),
	.TrisOut(SysBus  )
);

endmodule
