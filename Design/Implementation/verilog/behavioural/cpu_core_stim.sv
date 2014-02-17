module cpu_core_stim;

timeunit 1ns; timeprecision 10ps;

wire  [15:0]   DataOut;
wire           Enb;     
wire           nMe;     
wire           Ale;     
wire           RnW;     
wire           nOe;     
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
   .Enb        (Enb     ),
   .nMe        (nMe     ),
   .Ale        (Ale     ),
   .RnW        (RnW     ),
   .nOe        (nOe     ),
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
