module datapath(
  output wire  [15:0]   SysBus,
  output wire  [7:0]    Opcode,
  output logic [3:0]    Flags,
  input  wire  [15:0]   DataIn,
  input  wire  [4:0]    AluOp,
  input  wire  [1:0]    Op2Sel, PcSel,
  input  wire           Op1Sel, Rw, AluEn, SpEn, SpWe, LrEn, LrWe, PcWe, PcEn, IrWe, WdSel, ImmSel, RegWe, MemEn, Clock, nReset
);

timeunit 1ns; timeprecision 100ps;

wire  [15:0]   AluRes, AluBusIF, Rd1, Rd2, WData, SignExtend, Extended, PcSrc;
logic [15:0]   Op1, Op2, AluOut, Pc, PcIn, Sp, Lr, Ir;



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
assign Extended = (ImmSel) ? {{11{Ir[10]}}, Ir[10:6] } : { {8{Ir[10]}}, Ir[10:6]};
assign Opcode = {Ir[15:9], Ir[2:0]};
assign Sysbus = (MemEn) ? DataIn : {16{1'bz}};

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
	.DataIn (AluOut  ),
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




// Sequential

//always_ff@(posedge Clock or negedge nReset) begin : AluReg
//   if(!nReset)
//      AluOut <= 0;
//   else
//      AluOut<= AluRes;
//end
//always_ff@(posedge Clock or negedge nReset) begin : SpReg
//   if(!nReset)
//      Sp <= 0;
//   else
//      if(SpWe)
//         Sp <= AluOut;
//end
always_comb //@(posedge Clock or negedge nReset) begin : PcRegMuxed 
begin : PcInMux
	case(PcSel)                      // 3 input mux
            0        :  PcIn <= Lr;
            1        :  PcIn <= AluOut;
            2        :  PcIn <= SysBus;
            default  :  PcIn <= Pc + 1;
         endcase
end
//always_ff@(posedge Clock or negedge nReset) begin : IrReg
//   if(!nReset)
//      Ir <= 0;
//   else
//      if(IrWe)
//         Ir <= SysBus;
//end
assign IrControl = {Ir[15:9],Ir[2:0]};                 // Wire these to OpCode output

// Combo

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

assign WData = (WdSel) ? SysBus : AluRes; // 2 input mux

endmodule
