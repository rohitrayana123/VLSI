module control_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;

wire        SelInc;
wire        LoadPC;
wire        LoadIR;
wire        TrisOperand;
wire        TrisPC;
wire        TrisAcc;
wire        TrisMem;
wire        ENB;
wire        nME;
wire        RnW;
wire        nOE;
logic [3:0] Opcode;
logic       Zflag;
logic       nWAit;
logic       Clock;
logic       nReset;

control control(                   
   .SelInc        (SelInc),      // Outputs from DUT
   .LoadPC        (LoadPC),
   .LoadIR        (LoadIR),
   .TrisOperand   (TrisOperand),
   .TrisPC        (TrisPC),
   .TrisAcc       (TrisAcc),
   .TrisMem       (TrisMem),
   .ENB           (ENB),
   .nME           (nME),
   .RnW           (RnW),
   .nOE           (nOE),
   .Opcode        (Opcode),      // Inputs to DUT
   .Zflag         (Zflag),
   .nWait         (nWait),
   .Clock         (Clock),
   .nReset        (nReset)
);

always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end

endmodule
