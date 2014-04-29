module regBlock #( parameter n = 16, parameter reg_count = 8, parameter addr_size = 3) ( 
  output logic [n-1:0]   Rd1,
  output logic [n-1:0]   Rd2,
  input        [n-1:0]   WData,
  input        [addr_size-1:0]    Rs1,
  input        [addr_size-1:0]    Rs2,
  input        [addr_size-1:0]    Rw,
  input                 Clock, 
  input                 We,
  input			nReset
);

timeunit 1ns; timeprecision 100ps;

logic [n-1:0] regs [reg_count-1:0];

always_ff@(posedge Clock or negedge nReset) 
begin
	if (!nReset) begin
		regs[0] = 0;
		regs[1] = 0;
		regs[2] = 0;
		regs[3] = 0;
		regs[4] = 0;
		regs[5] = 0;
		regs[6] = 0;
		regs[7] = 0;
	end
		//regs = '{reg_count-1{'{n{0}}}};
	else
		if(We)  regs[Rw] <= WData;    
end

assign Rd1 = regs[Rs1];
assign Rd2 = regs[Rs2];
endmodule
