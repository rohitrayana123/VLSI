///////////////////////////////////////////////////////////////////////
//
// switch module
//
//
///////////////////////////////////////////////////////////////////////

`ifdef switch_access_time
  // already defined - do nothing
`else
  `define switch_access_time 500ns
`endif


module io_switches (
  demux_bus.Slave Bus,
  input [15:0] switches,
  input nCE
);

timeunit 1ns;
timeprecision 100ps;

logic delay;

initial
  delay = 0;

always @(negedge nCE)
  begin
    delay = 1;
    #`switch_access_time
    delay = 0;
  end 

// The #20 delay here ensures that the data is available before nWait goes high
assign #20 Bus.nWait = (delay && !nCE && !Bus.nOE) ? 0 : 1'bz;

assign Bus.Data = ((Bus.nOE == 0) && (nCE == 0) && (delay == 0)) ?
                    switches : 16'bz;

endmodule

