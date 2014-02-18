module datapath(
  output wire  [15:0]   SysBus,
  output wire  [7:0]    Opcode,
  output logic [3:0]    Flags,
  input  wire  [15:0]   DataIn,
  input  wire  [4:0]    AluOp,
  input  wire  [1:0]    Op2Sel,
  input  opcodes::pc_select_t    PcSel,
  input  wire           Op1Sel, Rw, AluEn, SpEn, SpWe, LrEn, LrWe, PcWe, PcEn, IrWe, WdSel, ImmSel, RegWe, MemEn, Clock, nReset
);

timeunit 1ns; timeprecision 100ps;

wire  [15:0]   AluRes, Rd1, Rd2, WData, Extended;
logic [15:0]   Op1, Op2, AluOut, Pc, PcIn, Sp, Lr, Ir;


//Combinational logic for tristate bus, reg inputs or outputs
assign Extended = (ImmSel) ? {{11{Ir[10]}}, Ir[10:6] } : { {8{Ir[10]}}, Ir[10:6]};
assign Opcode = {Ir[15:9], Ir[2:0]};
assign Sysbus = (MemEn) ? DataIn : {16{1'bz}};
assign WData = (WdSel) ? SysBus : AluRes; // 2 input mux

always_comb begin : PcInMux
	case(PcSel)                      // 3 input mux
            0        :  PcIn <= Lr;
            1        :  PcIn <= AluOut;
            2        :  PcIn <= SysBus;
            default  :  PcIn <= Pc + 1;
         endcase
end

always_comb begin : OpMux                 // Control ALU data input
   case(Op1Sel)                           // 3 input mux
      0        :  Op1 = Rd1;
      1        :  Op1 = Pc;
      default  :  Op1 = Sp;
   endcase
   case(Op2Sel)                           // 3 input mux
      0        :  Op2 = Extended;
      1        :  Op2 = Extended << 2;
      default  :  Op2 = Rd2; 
   endcase
end

// Instances

regBlock regBlock(      // Register block instance                         
   .Rd1     (Rd1     ),
   .Rd2     (Rd2     ),
   .WData   (WData   ),
   .Rs1     (Ir[5:3] ),
   .Rs2     (Ir[8:6] ),
   .Rw      (Ir[2:0] ),
   .Clock   (Clock   ),
   .nReset  (nReset  ),
   .We      (RegWe   )
);
alu a(                // Combo ALU only
   .Flags   (Flags   ), 
   .Result  (AluRes  ),
   .Op1     (Op1     ),
   .Op2     (Op2     ),
   .OpCode  (AluOp   )
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
	.DataIn (        ),
	.DataOut(        ),
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
	.Reg_EN (0       ),//does not utilise the tristate bus as an output
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
