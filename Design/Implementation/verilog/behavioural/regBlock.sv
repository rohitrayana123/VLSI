module regBlock #( parameter n = 16, parameter reg_count = 8, parameter addr_size = 3) ( 
  output logic [n-1:0]   Rd1,
  output logic [n-1:0]   Rd2,
  input        [n-1:0]   WData,
  input        [addr_size-1:0]    Rs1,
  input        [addr_size-1:0]    Rs2,
  input        [addr_size-1:0]    Rw,
  input                 Clock, 
  input                 WE,
  input			nReset
);

timeunit 1ns; timeprecision 100ps;

logic [n-1:0] regs [reg_count-1:0];

always_ff@(posedge Clock or negedge nReset) 
begin
	if (!nReset)
		regs = '{reg_count{'{n{0}}}};
	else
		if(WE)  regs[Rw] <= WData;    
end

assign Rd1 = regs[Rs1];
assign Rd2 = regs[Rs2];
endmodule
