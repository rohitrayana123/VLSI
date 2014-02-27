module regBlock_stim;

timeunit 1ns; timeprecision 10ps;

parameter CLK_PERIOD = 100;
parameter n = 16;
parameter reg_count = 8;
parameter addr_size = 3;
logic [n-1:0]   Rd1;
logic [n-1:0]   Rd2;
logic [n-1:0]   WData;
logic  [addr_size-1:0]    Rs1;
logic  [addr_size-1:0]    Rs2;
logic  [addr_size-1:0]    Rw;
logic   Clock;
logic   We;
logic	nReset;

regBlock r(                                          
   .Rd1     (Rd1     ),
   .Rd2     (Rd2     ),
   .WData   (WData   ),
   .Rs1     (Rs1     ),
   .Rs2     (Rs2     ),
   .Rw      (Rw      ),
   .Clock   (Clock   ),
   .We      (We      ),
   .nReset  (nReset  )
);

always begin   #(CLK_PERIOD/2)   Clock = 0;
               #(CLK_PERIOD/2)   Clock = 1;
end
int errors;
initial 
begin
	nReset = 1;
	#100 nReset = 0;
	#100 nReset = 1;
end
logic [15:0] data;
logic [2:0] addr;
initial begin
   	errors = 0;
   	Clock = 0;
	Rs1 = 0;
	Rs2 = 0;
	We = 0;
	Rw = 0;
   	PrintRegs;
	repeat(100) begin
		data = $random();
		addr = $random();
		WriteReg(data,addr);
		PrintRegs;
		Rs1 = $random();
		Rs2 = $random();
	      @(posedge Clock);
		$display("Rd1 @ Address %x = %x",Rs1,Rd1);
		$display("Rd2 @ Address %x = %x",Rs2,Rd2);
	   end
	if ( errors == 0 )
		$display("Simulation PASSED");
	else 
		$display("Simulation FAILED");
	$stop;
end

task WriteReg;
   input    [15:0]   writeMe;
   input    [2:0]    addressMe;
   begin
      $display("Writing %x to adress %d",writeMe,addressMe);
      @(negedge Clock);
      We = 1;
      WData = writeMe;
      Rw = addressMe;
      @(negedge Clock);
      We = 0;
	Rs1 = addressMe;
	#10 assert ( writeMe == Rd1 ) else begin errors ++; $display ("Data read back from Rs1 is incorrect"); end
	Rs1 = $random();
	Rs2 = addressMe;
	#10 assert ( writeMe == Rd2 ) else begin errors ++; $display ("Data read back from Rs2 is incorrect"); end
   end
endtask

task PrintRegs;
   integer i;
   for(i=1;i<8;i=i+1)
      $display("%d: %x",i,r.regs[i]);
endtask

endmodule
