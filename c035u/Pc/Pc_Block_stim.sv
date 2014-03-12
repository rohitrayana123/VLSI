// stimulus file Pc_slice_stim.sv for Pc_slice
// created by ext2svmod 5.5

module Pc_Block_stim;

timeunit 1ns;
timeprecision 10ps;


logic ALU ;
logic Clock ;
logic LrEn ;
logic LrSel ;
logic LrWe ;
logic nReset ;
logic PcEn ;
logic PcIncCin ;
logic PcSel ;
logic PcWe ;
logic Test ;
logic DR_SysBus ;

wire Pc ;
wire PcIncCout ;
wire SysBus ;

Pc_Block instance1(
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
#1000	

	//Pc from Sysbus
	PcEn = 0;
	DR_SysBus = 1;
	#1000 PcWe = 0;
	DR_SysBus = 'bz; 
	PcEn = 1;
	#1000 assert(SysBus == 1) else begin errors++;
end
	
	
	ALU = 0;
	PcWe = 1;
	#1000 assert(SysBus == 0) else begin errors++;  
end	
	ALU = 1;
	#1000 assert(SysBus == 1) else begin errors++; 
end	
	ALU = 0;

	#1000 PcWe = 0;
	PcEn = 0;
	
	//Lr Load from sysbus
	
	DR_SysBus = 1;
	LrWe = 1;
	#1000 DR_SysBus = 'bz;
	LrEn = 1;
	assert(SysBus == 1) else begin errors++; 
end
	PcIncCin = 0;
	
	#1000 assert(0 == SysBus) else begin errors++; 
end
	
	PcIncCin = 1;
	#1000 assert(1 == SysBus) else begin errors++; 
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
    ,"%b", SysBus
    );


//SIMVISION SCRIPT:Pc_slice.tcl

endmodule
