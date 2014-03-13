///////////////////////////////////////////////////////////////////////
//
// simple_interface
//
//    this interface describes the signals in a simple demultiplexed bus
//
///////////////////////////////////////////////////////////////////////

interface simple_interface;

timeunit 1ns;
timeprecision 100ps;

  wire [15:0] Data;
  logic [15:0] Address;
  wire ALE, nME, nOE, RnW, nIRQ, nWait;


  // Define the connections for the Bus Master
  modport Master (
    inout Data,
    output ALE, nME, nOE, RnW,
    input nIRQ, nWait
  );

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

endinterface
