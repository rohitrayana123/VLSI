///////////////////////////////////////////////////////////////////////
//
// cpu module
//
//    this is simply a shell representing the pad_ring
//    which instances cpu_core
//
///////////////////////////////////////////////////////////////////////

module cpu(
  output logic nME, ALE, RnW, nOE, SDO,
  inout [15:0] Data,
`ifndef nointerrupt
  input nIRQ,
`endif
`ifndef nowait
  input nWait,
`endif
  input Clock, nReset, Test, SDI
  );

timeunit 1ns;
timeprecision 100ps;

wire [15:0] Data_in;
wire [15:0] Data_out;
wire ENB;

//
// Simulation of bidirectional pads
//
assign Data = (ENB == 0) ? ~(~Data_out) : 16'bz;
assign Data_in = ~(~Data);

cpu_core CPU_core ( 
	.Data_out(Data_out), .Data_in(Data_in),
	.ENB(ENB), .nME(nME), .ALE(ALE), .RnW(RnW), .nOE(nOE), .SDO(SDO),
`ifndef nointerrupt
	.nIRQ(nIRQ),
`endif
`ifndef nowait
	.nWait(nWait),
`endif
	.Clock(Clock), .nReset(nReset), .Test(Test), .SDI(SDI) );

endmodule
