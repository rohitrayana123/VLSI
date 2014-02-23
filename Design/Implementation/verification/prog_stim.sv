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

cpu cpu ( 
   .Data    (Data), 
   .nME     (nME), 
   .ALE     (ALE), 
   .RnW     (RnW), 
   .nOE     (nOE), 
   .SDO     (SDO),
   .nIRQ    (nIRQ),
   .nWait   (nWait),
   .Clock   (Clock), 
   .nReset  (nReset), 
   .Test    (Test), 
   .SDI     (SDI)  
);

// define the interconnect fabric based on a SystemVerilog interface

demux_bus Bus ( nIRQ, nWait, Data, Address, ALE, nME, nOE, RnW, Test, nReset );

decoder Decoder ( Bus, nSelRAM, nSelLED, nSelSwitch, nSelTimer, nSelSerial );

// all the following are slaves attached to the bus

ram RAM ( Bus, nSelRAM );
io_leds IO_LEDS ( Bus, LEDs, nSelLED );
io_switches IO_SWITCHES ( Bus, switches, nSelSwitch);
io_timer IO_TIMER ( Bus, nSelTimer, Clock, nReset );
io_serial IO_SERIAL ( Bus, nSelSerial, Clock, nReset );





integer ClockCount = 0;
// Reset and clock
initial begin     
                  nReset = 0;
                  Clock = 0;
            #1000 Clock = 1;
end
always begin
            #250  Clock = 0;
            #250  Clock = 1;
end


// Probe the reg block]
always
   @(posedge Clock) begin
      ClockCount = ClockCount + 1;
      $display("\n\n\n");
      $display("SIM TIME   =%d\nClockCount =%d\n",
         $time,
         ClockCount
      );
      $display("SysBus=%x\n",
          cpu.cpu_core.datapath.SysBus
      );
      $display(
         "General Purpose Registers\n0=%x\n1=%x\n2=%x\n3=%x\n4=%x\n5=%x\n6=%x\n7=%x\n",
         cpu.cpu_core.datapath.regBlock.regs[0],
         cpu.cpu_core.datapath.regBlock.regs[1],
         cpu.cpu_core.datapath.regBlock.regs[2],
         cpu.cpu_core.datapath.regBlock.regs[3],
         cpu.cpu_core.datapath.regBlock.regs[4],
         cpu.cpu_core.datapath.regBlock.regs[5],
         cpu.cpu_core.datapath.regBlock.regs[6],
         cpu.cpu_core.datapath.regBlock.regs[7]
      );
   end

`ifdef sim_time
  initial
    begin
      #`sim_time                                      // Stop sim
      $writememh(`ram_out,system.RAM.Data_stored);    // Write ram contents
      $stop;
      $finish;
    end
`endif

endmodule
