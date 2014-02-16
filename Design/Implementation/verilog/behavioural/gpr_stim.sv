module gpr_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;

logic [15:0]   DataOut;
logic [15:0]   DataIn;
logic [2:0]    Address;
logic          Clock;
logic          Read;
logic          Write;

gpr gpr(                                           
   .DataOut (DataOut ),
   .DataIn  (DataIn  ),
   .Address (Address ),
   .Clock   (Clock   ),
   .Read    (Read    ),
   .Write   (Write   )
);

always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end

initial begin
   #100
   DataIn = 16'hFFFF;
   Address = 0;
   Read = 0;
   Write = 0;
   #100
   Write = 1;
   #100
   Write = 0;
   #100
   Read = 1;
   #100
   Read = 0;
   #100
   repeat(100) begin
      @(negedge Clock);
      Read = 0;
      Write = 0;
      DataIn = $random();
      Address = $random();
      @(negedge Clock);
      Write = 1;
      @(negedge Clock);
      Write = 0;
      Read = 1;
      Address = $random();
   end
   $stop;
end

initial $monitor($time,"   %x %x %x %x %x",DataOut,DataIn,Address,Read,Write);

endmodule
