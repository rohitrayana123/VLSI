// stimulus file Pc_slice_stim.sv for Pc_slice
// created by ext2svmod 5.5

module Pc_slice_stim;

timeunit 1ns;
timeprecision 10ps;
import opcodes::*;

logic ALU ;
logic Clock ;
logic LrEn ;
Lr_select_t LrSel ;
logic LrWe ;
logic nReset ;
logic PcEn ;
logic PcIncCin ;
pc_select_t PcSel ;
logic PcWe ;
logic Test ;
logic DR_SysBus ;

wire Pc ;
wire PcIncCout ;
wire SysBus ;

Pc_slice instance1(
	.SysBus ( SysBus ),
	.Pc ( Pc ),
	.PcIncCout ( PcIncCout ),
	.ALU ( ALU ),
	.Clock ( Clock ),
	.LrEn ( LrEn ),
	.LrSel ( LrSel ),
	.LrWe ( LrWe ),
	.nReset ( nReset ),
	.PcEn ( PcEn ),
	.PcIncCin ( PcIncCin ),
	.PcSel ( PcSel ),
	.PcWe ( PcWe ),
	.Test ( Test )
	);

// Don't drive inouts directly
// Drive them indiectly via DR_xxxx

assign SysBus = DR_SysBus ;


// stimulus information follows

always
  begin
    Clock = 0;
    #250
         Clock = 1;
    #500
         Clock = 0;
    #250
         Clock = 0;
  end

int errors;

initial
  begin
    errors = 0;
    ALU = 0;
    LrEn = 0;
    LrSel = 0;
    LrWe = 0;
    nReset = 1;
    PcEn = 0;
    PcIncCin = 0;
    PcSel = 0;
    PcWe = 0;
    Test = 0;
    DR_SysBus = 'bz;

	//Reset 
	#100 nReset = 0;
	#200 nReset = 1;
	
	//Pc Inc
	PcEn = 1;
	#1000 assert(SysBus == 0) else begin errors++; $display("PcEn Error");
end	
	
	PcIncCin = 1; 
	PcWe = 1;
	#1000 assert(SysBus == 1) else begin errors++; $display("PcInc Error");
end	
PcIncCin = 0;
	#1000 assert(SysBus == 0) else begin errors++; $display("PcInc Error");
end	

	//Pc from Sysbus
	PcEn = 0;
	PcSel = PcSysbus;
	DR_SysBus = 1;
	#1000 PcWe = 0;
	DR_SysBus = 'bz; 
	PcEn = 1;
	#1000 assert(SysBus == 1) else begin errors++; $display("PcSysBus Error");
end
	
	PcSel = PcAluOut;
	ALU = 0;
	PcWe = 1;
	#1000 assert(SysBus == 0) else begin errors++; $display("PcAlu Error"); 
end	
	ALU = 1;
	#1000 assert(SysBus == 1) else begin errors++; $display("PcAlu Error"); 
end	
	ALU = 0;

	#1000 PcWe = 0;
	PcEn = 0;
	
	//Lr Load from sysbus
	LrSel = LrSys;
	DR_SysBus = 1;
	LrWe = 1;
	#1000 DR_SysBus = 'bz;
	LrEn = 1;
	assert(1 == SysBus) else begin errors++; $display("LrSysBus Error");
end
	PcIncCin = 0;
	LrSel = LrPc;
	#1000 assert(0 == SysBus) else begin errors++; $display("LrPc Error");
end
	
	PcIncCin = 1;
	#1000 assert(1 == SysBus) else begin errors++; $display("LrPc Error");
end
	
    #1000
	if(errors == 0)
		$display("Simulation PASSED");
	else
		$display("Simulation FAILED");
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", ALU ,
    ,"%b", Clock ,
    ,"%b", LrEn ,
    ,"%b", LrSel ,
    ,"%b", LrWe ,
    ,"%b", nReset ,
    ,"%b", PcEn ,
    ,"%b", PcIncCin ,
    ,"%b", PcSel ,
    ,"%b", PcWe ,
    ,"%b", Test ,
    ,"%b", Pc ,
    ,"%b", PcIncCout ,
    ,"%b", SysBus ,
    ,"%b", instance1.Lr ,
    ,"%b", instance1.Pc1 ,
    );


//SIMVISION SCRIPT:Pc_slice.tcl

endmodule
