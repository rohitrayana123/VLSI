module regBlock( 
  output logic [15:0]   Rd1,
  output logic [15:0]   Rd2,
  input        [15:0]   WData,
  input        [2:0]    Rs1,
  input        [2:0]    Rs2,
  input        [2:0]    Rw,
  input                 Clock, 
  input                 We
);

timeunit 1ns; timeprecision 100ps;

logic [15:0] regs [7:1];                     // No zero register 

always_ff@(posedge Clock) begin
   if(We  && (Rw != 0))  regs[Rw] <= WData;    
end

assign Rd1 = (Rs1 == 0) ? 0 : regs[Rs1];     // Deal with zero addressing
assign Rd2 = (Rs2 == 0) ? 0 : regs[Rs2];

endmodule
