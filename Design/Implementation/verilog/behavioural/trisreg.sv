// trisreg.sv
// Writen by seblovett
// Date Created Mon 17 Feb 2014 21:20:12 GMT
// <+Last Edited: Mon 17 Feb 2014 22:16:02 GMT by hl13g10 on hind.ecs.soton.ac.uk +>


module trisreg #(parameter n = 16) (
	input logic Clock, nReset, Reg_EN, Reg_WE,
	input logic [n-1:0] DataIn,
	output logic [n-1:0] DataOut,
	output wire [n-1:0]  TrisOut);

timeunit 1ns; timeprecision 1ps;

always_ff @ (posedge Clock or negedge nReset)
begin
	if(!nReset) //Reset the system
		DataOut <= 0;
	else
	 	if(Reg_WE)
			DataOut <= DataIn;
end

assign TrisOut = (Reg_EN ? DataOut : {n{1'bz}});
endmodule

