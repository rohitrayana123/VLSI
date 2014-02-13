///////////////////////////////////////////////////////////////////////
//
// demux_bus interface
//
//    this interface describes the signals in the demultiplexed bus
//
///////////////////////////////////////////////////////////////////////

`include "options.sv"

interface demux_bus(
  output tri1 nIRQ,
  output tri1 nWait,
  inout [15:0] Data,
  output logic [15:0] Address,
  input uP_ALE,
  input uP_nME,
  input uP_nOE,
  input uP_RnW,
  input Test,
  input nReset
  );

timeunit 1ns;
timeprecision 100ps;

localparam tViolate = 250;

logic ALE, nME, nOE, RnW;


// Define the connections for the Bus Slaves
modport Slave (
  inout Data,
  input Address, nOE, RnW,
  output nIRQ, nWait
);


// Define the connections for the Address Decoder
modport AddressDecode (
  input Address, nME
);


// Define the logic for the Address Latch
always_latch
  if (ALE == 1)
    Address = Data;


`ifdef hold_signals_during_reset

  always @(Test or nReset)
  if (! nReset)
    begin
      nME = 1;
      ALE = 0;
      RnW = 1;
      nOE = 1;
    end
  else if (Test == 0)
    begin
      assign nME = uP_nME;
      assign ALE = uP_ALE;
      assign RnW = uP_RnW;
      assign nOE = uP_nOE;
    end
  else
    begin
      deassign nME;
      assign ALE = 0; // keep address bus constant
      deassign RnW;
      assign nOE = 1;// mem should not drive data bus
    end

`else

  always @(Test)
  if (Test == 0)
    begin
      assign nME = uP_nME;
      assign ALE = uP_ALE;
      assign RnW = uP_RnW;
      assign nOE = uP_nOE;
    end
  else
    begin
      deassign nME;
      assign ALE = 0; // keep address bus constant
      deassign RnW;
      assign nOE = 1;// mem should not drive data bus
    end

`endif

time last_Data_change = 0, last_Address_change = 0;
time last_nOE_change = 0, last_RnW_change = 0;
time last_ALE_rise = 0, last_ALE_fall = 0;
time last_nME_fall = 0, last_nME_rise = 0;
time last_write_cycle_nME_rise=0;

always @(Data) last_Data_change = $time;
always @(Address) last_Address_change = $time;
always @(nOE) last_nOE_change = $time;
always @(RnW) last_RnW_change = $time;
always @(posedge ALE) last_ALE_rise = $time;
always @(negedge ALE) last_ALE_fall = $time;
always @(negedge nME) last_nME_fall = $time;
always @(posedge nME) begin
    last_nME_rise = $time;
    if (RnW == 0) last_write_cycle_nME_rise = $time;
  end

logic write_cycle;

initial 
  begin
    write_cycle <= 0;
    #tViolate;
    forever
      begin
	@(negedge (nME || RnW))
	  write_cycle <= 1;
	@(posedge nME)
	  write_cycle <= 0;
      end
  end


initial #tViolate forever
  begin
    @(Address)
      address_stable: assert ( nME == 1 ) else
        $display("Assertion failed: Address changes while nME is low at time %d ns", $time);
      address_hold_violation: assert ( $time - last_nME_rise > tViolate ) else
        $display( "Timing violation: Address Hold Violation at %d ns (%d ns)", $time, last_nME_rise);
      
  end

initial #tViolate forever
  begin
    @(RnW)
      RnW_hold_violation: assert ( $time - last_nME_rise > tViolate ) else
        $display( "Timing violation: RnW Hold Violation at %d ns (%d ns)", $time, last_nME_rise);
  end

initial #tViolate forever
  begin
    @(nOE)
      nOE_hold_violation: assert ( $time - last_nME_rise > tViolate ) else
        $display( "Timing violation: nOE Hold Violation at %d ns (%d ns)", $time, last_nME_rise);
  end

initial #tViolate forever
  begin
    @(Data)
      address_latch_data_hold_violation: assert ( $time - last_ALE_fall > tViolate ) else
        $display( "Timing violation: Address Latch Data Hold Violation at %d ns (%d ns)", $time, last_ALE_fall);
      data_hold_violation: assert ( $time - last_write_cycle_nME_rise > tViolate ) else
        $display( "Timing violation: Data Hold Violation at %d ns (%d ns)", $time, last_write_cycle_nME_rise);
      
  end

initial #tViolate forever
  begin
    @(negedge ALE)
      ALE_glitch_violation: assert ( $time - last_ALE_rise > tViolate ) else
	$display( "Timing violation: ALE glitch at %d ns (%d ns)", $time, last_ALE_rise );
      address_latch_data_setup_violation: assert ( $time - last_Data_change > tViolate ) else
	$display( "Timing violation: Address Latch Data Setup Violation at %d ns (%d ns)", $time, last_Data_change);
  end

initial #tViolate forever
  begin
    @(negedge nME)
      address_setup_violation: assert ( $time - last_Address_change > tViolate ) else
        $display( "Timing violation: Address Setup Violation at %d ns (%d ns)", $time, last_Address_change);

    @(posedge nME)
      nME_glitch_violation: assert ( $time - last_nME_fall > tViolate ) else
        $display( "Timing violation: nME glitch at %d ns (%d ns)", $time, last_nME_fall );
      nOE_setup_violation: assert ( $time - last_nOE_change > tViolate ) else
        $display( "Timing violation: nOE Setup Violation at %d ns (%d ns)", $time, last_nOE_change);
      RnW_setup_violation: assert ( $time - last_RnW_change > tViolate ) else
        $display( "Timing violation: RnW Setup Violation at %d ns (%d ns)", $time, last_RnW_change);
      if (write_cycle)
        begin
	  RnW_zero: assert ( RnW == 0 ) else
            $display("Assertion failed: RnW not zero at end of memory write at time %d ns", $time);
	  nOE_one: assert ( nOE == 1 ) else
            $display("Assertion failed: nOE not one at end of memory write at time %d ns", $time);
	  data_setup_violation: assert ( $time - last_Data_change > tViolate ) else
            $display( "Timing violation: Data Setup Violation at %d ns (%d ns)", $time, last_Data_change);
	end
      else
        begin
	  nOE_zero: assert ( nOE == 0 ) else
            $display("Assertion failed: nOE not zero at end of memory read at time %d ns", $time);
	  RnW_one: assert ( RnW == 1 ) else
            $display("Assertion failed: RnW not one at end of memory read at time %d ns", $time);
	end
  end

always @(posedge nReset)
  nME_inactive: assert ( nME == 1 ) else
    $display("Assertion failed: nME is low at end of reset pulse as %d ns", $time);

endinterface
