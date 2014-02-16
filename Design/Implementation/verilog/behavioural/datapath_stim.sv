module datapath_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;

wire  [15:0]   SysBus;     
wire  [3:0]    Opcode;     
wire           Zflag;      
logic [15:0]   Data_in;    
logic [1:0]    Op2Sel;
logic          Op1Sel;
logic          Rw;
logic          Clock;      
logic          nReset;     

datapath datapath(                                           
   .SysBus        (SusBus  ),    // Outputs from DUT
   .Opcode        (Opcode  ),
   .Zflag         (Zflag   ),
   .Data_in       (Data_in ),    // Inputs to DUT
   .Op2Sel        (OP2Sel  ),
   .Op1Sel        (Op1Sel  ),
   .Rw            (Rw      ),
   .Clock         (Clock   ),
   .nReset        (nReset  )
);

always begin   #(CLK_PERIOD/2) Clock = 0;
               #(CLK_PERIOD/2) Clock = 1;         
end


endmodule
