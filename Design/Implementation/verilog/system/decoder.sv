///////////////////////////////////////////////////////////////////////
//
// decoder module
//            selects between RAM and I/O modules
//
//
///////////////////////////////////////////////////////////////////////


`include "options.sv"

// Reduced Address Map is the default

`ifdef address_map_0209
  `undef reduced_address_map
  `undef full_address_map
`else
  `ifdef full_address_map
    `undef reduced_address_map
  `else
    `define reduced_address_map
  `endif
`endif

module decoder (
  demux_bus.AddressDecode Bus,
  output logic nSelRAM, nSelLED, nSelSwitch, nSelTimer, nSelSerial
  );

timeunit 1ns;
timeprecision 100ps;

`ifdef reduced_address_map

  // Reduced Address Map

  assign nSelRAM     = ( Bus.Address[15:0] <= 16'h07FF ) ? Bus.nME : 1;

  // Switches and LEDs are accessible within 12 bit address space
  // -- they are used by the example processor
  assign nSelSwitch  = ( Bus.Address[15:0] == 16'h0800 ) ? Bus.nME : 1;
  assign nSelLED     = ( Bus.Address[15:0] == 16'h0801 ) ? Bus.nME : 1;

  // Serial port is not accessible within 12 bit address space
  // -- it is not used by the example processor
  assign nSelSerial  = ( Bus.Address[15:1] =={12'hA00,3'b000} ) ? Bus.nME : 1;

  // no support for timer within reduced address map
  assign nSelTimer   = ( 0 ) ? Bus.nME : 1;

`endif

`ifdef full_address_map

  // Full Address Map
  // these addresses are based on those supported by Mike Merrett's test board

  // here we have 2k words of RAM
  // -- full test board supports 32k of RAM/EPROM (16'h0000-16'h7FFF)
  assign nSelRAM     = ( Bus.Address[15:0] <= 16'h07FF ) ? Bus.nME : 1;

  // encourage specific addresses for Switch/LED access (16'h8000,16'h8001)
  // -- full test board does partial decoding (16'h8000-16'h87FF)
  assign nSelSwitch  = ( Bus.Address[15:0] == 16'h8000 ) ? Bus.nME : 1;
  assign nSelLED     = ( Bus.Address[15:0] == 16'h8001 ) ? Bus.nME : 1;

  // timer (16'h8800-16'h8803)
  // -- maps to UART/Timer on test board
  // -- no attempt has been made to match behaviour of the actual device
  assign nSelTimer   = ( Bus.Address[15:2] =={12'h880,2'b00} ) ? Bus.nME : 1;

  // serial port (16'hA000-16'hA001)
  // -- maps to USB serial port on test board
  // -- (simpler than trying to map to UART registers)
  // -- attempts to match behaviour of actual interface on FPGA
  assign nSelSerial  = ( Bus.Address[15:1] =={12'hA00,3'b000} ) ? Bus.nME : 1;

`endif

`ifdef address_map_0209

  // Address Map 2002-2009
  // these are old address map values

  assign nSelRAM     = ( Bus.Address[15:0] <= 16'h07FF ) ? Bus.nME : 1;
  assign nSelLED     = ( Bus.Address[15:0] == 16'h0A00 ) ? Bus.nME : 1;
  assign nSelSwitch  = ( Bus.Address[15:0] == 16'h0800 ) ? Bus.nME : 1;
  // Timer was added in 2005
  assign nSelTimer   = ( Bus.Address[15:2] =={12'h0C0,2'b00} ) ? Bus.nME : 1;
  // Serial Port was added in 2009
  assign nSelSerial   = ( Bus.Address[15:1] =={12'h0E0,3'b000} ) ? Bus.nME : 1;

`endif

endmodule
