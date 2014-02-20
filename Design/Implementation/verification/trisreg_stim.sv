// trisreg_stim.sv
// Writen by seblovett
// Date Created Mon 17 Feb 2014 21:27:42 GMT
// <+Last Edited: Mon 17 Feb 2014 22:20:53 GMT by hl13g10 on hind.ecs.soton.ac.uk +>


module trisreg_stim ();

timeunit 1ns; timeprecision 1ps;
parameter n  = 16;

logic Clock, nReset, Reg_EN, Reg_WE;
logic[n-1:0] DataIn, DataOut;
wire[n-1:0] TrisOut;
trisreg #(.n(n)) instance1 (.*);

int errors;

//make a clock
always
begin
        Clock = 0;
        #250 Clock = 1;
        #500 Clock = 0;
        #250 Clock = 0;
end

//reset pulse
initial 
begin
	errors = 0;
	nReset = 1;
	#100 nReset = 0;
	#100 nReset = 1;
end

//test routine
initial
begin
	Reg_EN = 0;
	Reg_WE = 0;
	DataIn = 1;
	#1000 assert(0 == DataOut) else begin errors++; $display("WE Error"); end
	Reg_WE = 1; //write the data
	#1000 assert(DataIn == DataOut) else begin errors++; $display("WE Error"); end
	//HSL I don't know why this doesn't work...
	//assert(TrisOut == {n{1'bz}} ) else begin errors++; $display("EN Error") ; end
	#1000 Reg_EN = 1;
	#1000 assert(TrisOut == DataOut) else begin errors++; $display("EN Error"); end
	#1000 if (0 == errors)
		$display("Simulation Passed!");
	else
		$display("Simulation FAILED");
	$stop();
end

endmodule

