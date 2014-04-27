// stimulus.sv
// Writen by seblovett
// Date Created Sun 27 Apr 2014 15:02:50 BST
// <+Last Edited: Sun 27 Apr 2014 15:25:59 BST by hl13g10 on hind.ecs.soton.ac.uk +>


module stimulus ();

timeunit 1ns; timeprecision 1ps;

  wire  nME, ALE, RnW, nOE, SDO;
  logic        nIRQ, nWait, Clock, nReset, Test, SDI;
int count;

cpu CPU (.*); 

initial
begin
	nIRQ = 1;
	nWait = 1;
	Test = 1;
	SDI = 1;
	count = 0;
	@ (posedge Clock) //first clock edge
	SDI = 1;
	
	@ (negedge Clock) //after clock, lower SDI
	SDI = 0;
end


initial
begin
	while ( 1 )
	begin	
		@ (posedge Clock)
		count++;
		if (count == 1000)
		begin
			assert(0) else $error("Scan path Failed");
			$stop;
			$finish;
		end 
	end
end

always @ (posedge Clock)
	if (SDO == 1)
	begin
		@(posedge Clock)
		assert(SDO == 0) begin	$display("Scan Path Successful.\nNumber of registers = %d",count - 1); end
		else 
			$error("Scan Path Failed");
		$stop;
		$finish;
	end
  initial
    begin
       Clock = 0;
       nReset = 0;
      #250
       nReset = 1;
      #500
       while ( 1 )
          begin
             Clock = 0;
            #250
             Clock = 1;
            #500
             Clock = 0;
            #250
             Clock = 0;
          end
    end


endmodule

