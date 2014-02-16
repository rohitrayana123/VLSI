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
   PrintRegs;
   repeat(100) begin
      WriteReg($random(),$random());
      PrintRegs;
      ReadReg($random());
   end
   $stop;
end

task WriteReg;
   input    [15:0]   writeMe;
   input    [2:0]    addressMe;
   begin
      $display("Writing %x to adress %d",writeMe,addressMe);
      @(negedge Clock);
      Read = 0;
      Write = 1;
      DataIn = writeMe;
      Address = addressMe;
      @(negedge Clock);
      Write = 0;
   end
endtask

task ReadReg; 
   input    [2:0]    addressMe;
   begin
      @(negedge Clock);
      Read = 1;
      Write = 0; 
      Address = addressMe;
      @(posedge Clock);
      $display("Read %x from adress %d",DataOut,addressMe);
      @(negedge Clock);
      Read = 0;
   end
endtask

task PrintRegs;
   integer i;
   for(i=1;i<8;i=i+1)
      $display("%d: %x",i,gpr.mem[i]);
endtask

endmodule
