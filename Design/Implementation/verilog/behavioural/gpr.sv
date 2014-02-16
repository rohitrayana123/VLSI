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

logic [DATA_WIDTH-1:0] mem [RAM_DEPTH-1:0]; 

always_ff@(posedge Clock) begin
                        DataOut <= 16'bZ;
   if(Read && !Write)   DataOut <= mem[Address];
   if(!Read && Write)   mem[Address] <= DataIn;    
end
endmodule
