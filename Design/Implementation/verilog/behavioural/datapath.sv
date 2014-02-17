module datapath(
  output wire  [15:0]   SysBus,
  output wire  [7:0]    IrControl,
  output logic          Z,
  input  wire  [15:0]   DataIn,
  input  wire  [4:0]    AluOp,
  input  wire  [1:0]    Op2Sel,
  input  wire           Op1Sel,
  input  wire           Rw,
  input  wire           AluEn,
  input  wire           SpEn,
  input  wire           SpWe,
  input  wire           LrEn,
  input  wire           LrWe,
  input  wire           PcWe,
  input  wire  [1:0]    PcSel,
  input  wire           PcEn,
  input  wire           IrEn,
  input  wire           IrWe,
  input  wire           WdSel,
  input  wire           ImmSel,
  input  wire           RegWe,
  input  wire           MemEn,
  input  wire           Clock,
  input  wire           nReset
);

timeunit 1ns; timeprecision 100ps;

wire  [15:0]   AluRes;
wire  [15:0]   AluBusIF;
logic [15:0]   Op1;
logic [15:0]   Op2;
wire  [15:0]   Rd1;
wire  [15:0]   Rd2;
wire  [15:0]   WData;
wire  [15:0]   SignExtend;
logic [15:0]   AluOut;
logic [15:0]   Pc;
wire  [15:0]   PcSrc;
logic [15:0]   Sp;
logic [15:0]   Lr;
logic [15:0]   Ir;
wire  [15:0]   Extended;

// Instances

regBlock regBlock(      // Register block instance                         
   .Rd1     (Rd1     ),
   .Rd2     (Rd2     ),
   .WData   (WData   ),
   .Rs1     (Ir[5:3] ),
   .Rs2     (Ir[8:6] ),
   .Rw      (Ir[2:0] ),
   .Clock   (Clock   ),
   .We      (RegWe   )
);
alu alu(                // Combo ALU only
   .Zflag   (Zflag   ), 
   .Result  (AluRes  ),
   .Op1     (Op1     ),
   .Op2     (Op2     ),
   .OpCode  (AluOp   )
);
signExtend signExtend(  // Sign extender 
   .DataOut (Extended),
   .DataIn  (Ir[10:3]),
   .ImmSel  (ImmSel  )
);


// Bus interfaces

trisBuf16 trisBufAlu(   // ALU
   .DataIn  (AluOut  ),
   .En      (AluEn   ),
   .DataOut (SysBus  )
);
trisBuf16 trisBufPc(    // PC
   .DataIn  (Pc      ),
   .En      (PcEn    ),
   .DataOut (SysBus  )
);
trisBuf16 trisBufSp(    // SP
   .DataIn  (Sp      ),
   .En      (SpEn    ),
   .DataOut (SysBus  )
);
trisBuf16 trisBufLr(    // LR
   .DataIn  (Lr      ),
   .En      (LrEn    ),
   .DataOut (SysBus  )
);
trisBuf16 trisBufSys(   // Memory access
   .DataIn  (DataIn  ),
   .En      (MemEn    ),
   .DataOut (SysBus  )
);




// Sequential

always_ff@(posedge Clock or negedge nReset) begin : AluReg
   if(!nReset)
      AluOut <= 0;
   else
      AluOut<= AluRes;
end
always_ff@(posedge Clock or negedge nReset) begin : SpReg
   if(!nReset)
      Sp <= 0;
   else
      if(SpWe)
         Sp <= AluOut;
end
always_ff@(posedge Clock or negedge nReset) begin : PcRegMuxed 
   if(!nReset)      
      Pc <= 0;
   else
      if(PcWe)                            // Control PC data input
         case(PcSel)                      // 3 input mux
            0        :  Pc <= Lr;
            1        :  Pc <= AluOut;
            2        :  Pc <= SysBus;
            default  :  Pc <= Pc + 1;
         endcase
end
always_ff@(posedge Clock or negedge nReset) begin : IrReg
   if(!nReset)
      Ir <= 0;
   else
      if(IrWe)
         Ir <= SysBus;
end
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
