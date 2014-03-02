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
                  nReset   = 0;
                  Clock    = 0;
            #1000 nReset   = 1;
end
always begin
            #250  Clock = 0;
            #250  Clock = 1;
end


// Dump to stdout
// Only on rising clock edges
always @(posedge Clock) begin
   ClockCount = ClockCount + 1;
   $display("\n\n\n");
   $display("SIM TIME   =%d\nClockCount =%d\n",
      $time,
      ClockCount
   );
   $display("SysBus=%x\n",
       cpu.CPU_core.datapath.SysBus
   );
   $display("Opcode=%b\n",
      cpu.CPU_core.control.Opcode
   );
   $display(
      "General Purpose Registers\n0=%x\n1=%x\n2=%x\n3=%x\n4=%x\n5=%x\n6=%x\n7=%x\n",
      cpu.CPU_core.datapath.regBlock.regs[0],
      cpu.CPU_core.datapath.regBlock.regs[1],
      cpu.CPU_core.datapath.regBlock.regs[2],
      cpu.CPU_core.datapath.regBlock.regs[3],
      cpu.CPU_core.datapath.regBlock.regs[4],
      cpu.CPU_core.datapath.regBlock.regs[5],
      cpu.CPU_core.datapath.regBlock.regs[6],
      cpu.CPU_core.datapath.regBlock.regs[7]
   );
end

initial begin
   `ifdef switch_value
      switches = `switch_value;
   `else
      switches = 1;
   `endif
   Test = 0;
   SDI = 0;
end

`ifdef special_monitor
   `include "monitor.sv"
`endif


initial begin
   	integer done;
   	`ifdef sim_time
      	#`sim_time                                      	// Time stop
	`else;
	 	while(1) begin
			@(posedge Clock) 
			if(system.RAM.Data_stored[1024] ==  16'hFFFF)	// Middle to avoid stack
				break;	// Mem stop	
		end
		$display("--- DETECTED MEMORY WRITE STOP ---");
   	`endif
	$display("Dumping RAM...");
   	`ifdef ram_out
      	$writememh(`ram_out,system.RAM.Data_stored);    // Write ram contents
   	`else
      	$writememh("ram.hex",system.RAM.Data_stored);    // Write ram contents 
   	`endif
   	$stop;
   	$finish;
end


endmodule
