module cpu_core_stim;

timeunit 1ns; timeprecision 10ps;

wire  [15:0]   Data_out;
wire           ENB;     
wire           nME;     
wire           ALE;     
wire           RnW;     
wire           nOE;     
wire           SDO;     
logic [15:0]   Data_in; 
logic          nIRQ;    
logic          nWAit;   
logic          Test;    
logic          SDI;     
logic          Clock;   
logic          nReset;  


cpu_core cpu_core(                                           
   .Data_out   (Data_out), // Output from DUT 
   .ENB        (ENB),
   .nME        (nME),
   .ALE        (ALE),
   .RnW        (RnW),
   .nOE        (nOE),
   .SDO        (SDO),
   .Data_in    (Data_in),  // Input to DUT
   .nIRQ       (nIRQ),
   .nWait      (nWait),
   .Test       (Test),
   .SDI        (SDI),
   .Clock      (Clock),
   .nReset     (nReset)
);

endmodule
