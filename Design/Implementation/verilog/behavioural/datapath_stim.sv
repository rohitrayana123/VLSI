module datapath_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;

wire  [15:0]   SysBus;     
wire  [3:0]    Opcode;     
wire           Zflag;      
logic [15:0]   Data_in;    
logic          SelInc;     
logic          LoadPC;     
logic          LoadIR;     
logic          TrisOperand;
logic          TrisPC;     
logic          TrisAcc;    
logic          TrisMem;    
logic          Clock;      
logic          nReset;     

datapath datapath(                                           
   .SysBus        (SusBus),      // Outputs from DUT
   .Opcode        (Opcode),
   .Zflag         (Zflag),
   .Data_in       (Data_in),     // Inputs to DUT
   .SelInc        (SelInc),
   .LoadPC        (LoadPc),
   .LoadIR        (LoadIR),
   .TrisOperand   (TrisOperand), 
   .TrisPC        (TrisPC),
   .TrisAcc       (TrisAcc),
   .TrisMem       (TrisMem),
   .Clock         (Clock),
   .nReset        (nReset)
);

always begin   #(CLK_PERIOD/2) Clock = 0;
               #(CLK_PERIOD/2) Clock = 1;         
end


endmodule
