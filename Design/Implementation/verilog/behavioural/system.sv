///////////////////////////////////////////////////////////////////////
//
// system module
//
//    this is the top-level module which describes the complete system
//
///////////////////////////////////////////////////////////////////////

`include "options.sv"

module system;

timeunit 1ns;
timeprecision 100ps;

import opcodes::*;

logic Clock, nReset, Test, SDI;
logic [15:0] switches;

wire [15:0] LEDs;
wire [15:0] Data;
wire [15:0] Address;

wire ALE, nME, nOE, RnW;
tri1 nIRQ, nWait;

cpu CPU ( .Data(Data), .nME(nME), .ALE(ALE), .RnW(RnW), .nOE(nOE), .SDO(SDO),
`ifndef nointerrupt
  .nIRQ(nIRQ),
`endif
`ifndef nowait
  .nWait(nWait),
`endif
  .Clock(Clock), .nReset(nReset), .Test(Test), .SDI(SDI)  );

// define the interconnect fabric based on a SystemVerilog interface

demux_bus Bus ( nIRQ, nWait, Data, Address, ALE, nME, nOE, RnW, Test, nReset );

decoder Decoder ( Bus, nSelRAM, nSelLED, nSelSwitch, nSelTimer, nSelSerial );

// all the following are slaves attached to the bus

ram RAM ( Bus, nSelRAM );
io_leds IO_LEDS ( Bus, LEDs, nSelLED );
io_switches IO_SWITCHES ( Bus, switches, nSelSwitch);
io_timer IO_TIMER ( Bus, nSelTimer, Clock, nReset );
io_serial IO_SERIAL ( Bus, nSelSerial, Clock, nReset );

`ifdef special_stimulus

  `include "stimulus.sv"

`else

  initial
    begin
       Clock = 0;
       nReset = 0;
      #250
       nReset = 1;
      #500
       while ( 1 )
          begin
             Clock = 0;
            #250
             Clock = 1;
            #500
             Clock = 0;
            #250
             Clock = 0;
          end
    end

  initial
    begin
      `ifdef switch_value
        switches = `switch_value;
      `else
         switches = 1;
      `endif
      Test = 0;
      SDI = 0;
    end
  
`endif

`ifdef special_monitor

  `include "monitor.sv"

`endif

`ifdef sim_time

  initial
    begin
      #`sim_time
      $stop;
      $finish;
    end

`endif

endmodule
