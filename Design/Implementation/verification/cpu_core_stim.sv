module cpu_core_stim;

timeunit 1ns; timeprecision 10ps;

wire  [15:0]   DataOut;
wire           ENB;     
wire           nME;     
wire           ALE;          
wire           nOE;     
wire           SDO;     
logic [15:0]   DataIn; 
logic          nIrq;    
logic          nWait;   
logic          Test;    
logic          SDI;     
logic          Clock;   
logic          nReset;  


cpu_core cpu_core(                                           
   .DataOut    (DataOut ), // Output from DUT 
   .nOE        (nOE     ),
   .nME        (nME     ),
   .ALE        (ALE     ),
   .ENB        (ENB     ),
   .SDO        (SDO     ),
   .DataIn     (DataIn  ),  // Input to DUT
   .nIrq       (nIrq    ),
   .nWait      (nWait   ),
   .Test       (Test    ),
   .SDI        (SDI     ),
   .Clock      (Clock   ),
   .nReset     (nReset  )
);

endmodule
