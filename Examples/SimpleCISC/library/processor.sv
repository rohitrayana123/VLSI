module processor( Clock, nReset );

timeunit 1ns; timeprecision 10ps;

input Clock, nReset;

wire [15:0] DataBus;
wire [15:0] Address, IR;
wire [3:0] Function;
wire ZReg, Mem_Write;

   control Control ( Function, UpdateZ,
   		EnableACC, LoadACC, EnableX, LoadX, EnableS, LoadS,
		EnablePC, LoadPC, IncPC, SelPC, LoadIR, LoadMAR, EnableReg,
		Mem_Write, IR, ZReg, Clock, nReset );

   datapath Datapath ( DataBus, Address, IR, ZReg, Function, UpdateZ,
		EnableACC, LoadACC, EnableX, LoadX, EnableS, LoadS,
		EnablePC, LoadPC, IncPC, SelPC, LoadIR, LoadMAR, EnableReg,
		Clock, nReset );

   memory Memory ( DataBus, Address, Mem_Write, Clock );

endmodule
