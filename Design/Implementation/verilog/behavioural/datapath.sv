// Written by hl13g10
module datapath(
  output wire  [15:0]   SysBus,
  output wire  [7:0]    Opcode,
  output logic [3:0]    Flags,
  input  wire  [15:0]   DataIn,
  input  opcodes::alu_functions_t AluOp,
  input  opcodes::pc_select_t    PcSel,
  input  opcodes::Op1_select_t    Op1Sel,
  input  opcodes::Op2_select_t	Op2Sel,
  input  opcodes::Imm_select_t ImmSel,
  input  opcodes::Wd_select_t WdSel,
  input  opcodes::Rs1_select_t Rs1Sel,
  input  opcodes::Lr_select_t LrSel,
  input  wire           AluEn, LrEn, LrWe, PcWe, PcEn, IrWe, RegWe, MemEn, Clock, nReset, CFlag, AluWe
);

import opcodes::*;
timeunit 1ns; timeprecision 100ps;

wire  [15:0]   AluRes, Rd1, Rd2, WData, Extended, SpNext, SpDataIn, PcInc;
logic [15:0]   Op1, Op2, AluOut, Pc, PcIn, Sp, Lr, Ir, LrIn;
logic [2:0] Rs1In;

//Combinational logic for tristate bus, reg inputs or outputs
assign Extended = (ImmShort == ImmSel) ? {{11{Ir[4]}}, Ir[4:0] } : { {8{Ir[7]}}, Ir[7:0]};
assign Opcode = {Ir[15:8]};
assign SysBus = (MemEn) ? DataIn : {16{1'bz}};
assign WData = (WdSys == WdSel) ? SysBus : AluRes; // 2 input mux
assign Op2 = (Op2Rd2 == Op2Sel) ? Rd2 : Extended;
assign LrIn = (LrPc == LrSel) ? PcInc : SysBus;
assign Rs1In = (Rs1Rd == Rs1Sel) ? Ir[10:8] : Ir[7:5];
assign PcInc = Pc + 1;

//Multiplexers
always_comb begin : PcInMux
	case(PcSel)                      // 3 input mux
            PcLr        :  PcIn <= Lr;
            PcAluOut    :  PcIn <= AluRes;
            PcSysbus    :  PcIn <= SysBus;
            Pc1         :  PcIn <= PcInc;
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
   .Rs2     (Ir[4:2] ),
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
   .CarryIn (CFlag   ),
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
