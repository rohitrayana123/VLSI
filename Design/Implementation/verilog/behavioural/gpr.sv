module gpr( 
  output logic [15:0]   DataOut,
  input        [15:0]   DataIn,
  input        [2:0]    Address,
  input                 Clock,
  input                 Read,
  input                 Write
);

timeunit 1ns; timeprecision 100ps;

parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 3;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

logic [DATA_WIDTH-1:0] mem [RAM_DEPTH-1:1];  // No zero register 

always_ff@(posedge Clock) begin
   if(!Read && Write && (Address != 0))   
      mem[Address] <= DataIn;    
end

always_comb
   if(Read && !Write)
      if(Address != 0)                       // Deal with zero register
         DataOut = mem[Address];
      else
         DataOut = 0;
   else 
      DataOut = 16'bz;
endmodule
