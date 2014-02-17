module control(
   output logic   [4:0]    AluOp, 
   output logic   [1:0]    Op2Sel, 
   output logic            Op1Sel, 
   output logic            Rw,
   output logic            AluEn,
   output logic            SpEn,
   output logic            SpWe,
   output logic            LrEn,
   output logic            LrWe,
   output logic            PcWe,
   output logic   [1:0]    PcSel,
   output logic            PcEn,
   output logic            IrEn,
   output logic            IrWe,
   output logic            WdSel,
   output logic            ImmSel,
   output logic            RegWe,
   output logic            MemEn,
   input  wire    [7:0]    IrControl,
   input  wire             Z,
   input  wire             Clock,
   input  wire             nReset
);

timeunit 1ns; timeprecision 100ps;

endmodule
