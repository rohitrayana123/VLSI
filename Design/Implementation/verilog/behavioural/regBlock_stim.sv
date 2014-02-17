module regBlock_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;

logic [15:0]   Rd1;  
logic [15:0]   Rd2;  
logic [15:0]   WData;
logic [2:0]    Rs1;  
logic [2:0]    Rs2;
logic [2:0]    Rw;   
logic          Clock;
logic          WE;   

regBlock regBlock(                                           
   .Rd1     (Rd1     ),
   .Rd2     (Rd2     ),
   .WData   (WData   ),
   .Rs1     (Rs1     ),
   .Rs2     (Rs2     ),
   .Rw      (Rw      ),
   .Clock   (Clock   ),
   .WE      (WE      )
);

always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end

initial begin
   PrintRegs;
   repeat(1000) begin
      WriteReg($random(),$random());
      PrintRegs;
      Rs1 = $random();
      Rs2 = $random();

      @(posedge Clock);
      $display("Rd1 @ Address %x = %x",Rs1,Rd1);
      $display("Rd2 @ Address %x = %x",Rs2,Rd2);
      if((Rs1 == 0)&&(Rd1 != 0)) $stop;
      if((Rs2 == 0)&&(Rd2 != 0)) $stop;
   end
   $stop;
end

task WriteReg;
   input    [15:0]   writeMe;
   input    [2:0]    addressMe;
   begin
      $display("Writing %x to adress %d",writeMe,addressMe);
      @(negedge Clock);
      WE = 1;
      WData = writeMe;
      Rw = addressMe;
      @(negedge Clock);
      WE = 0;
   end
endtask

task PrintRegs;
   integer i;
   for(i=1;i<8;i=i+1)
      $display("%d: %x",i,regBlock.regs[i]);
endtask

endmodule
