// stimulus file Pc_Block_stim.sv for Pc_Block
// created by ext2svmod 5.5

module Pc_Block_stim;

timeunit 1ns;
timeprecision 10ps;

logic [15:0] ALU ;
logic Clock ;
logic LrEn ;
logic LrSel ;
logic LrWe ;
logic nReset ;
logic PcEn ;
logic PcIncCin ;
logic [1:0] PcSel ;
logic PcWe ;
logic Test ;
logic [15:0] DR_SysBus ;

wire Pc ;
wire PcIncCout ;
wire Scan ;
wire [15:0] SysBus ;

Pc_Block instance1(
	.SysBus ( SysBus ),
	.Pc ( Pc ),
	.PcIncCout ( PcIncCout ),
	.Scan ( Scan ),
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

initial
  begin
    ALU = 0;
    LrEn = 0;
    LrSel = 0;
    LrWe = 0;
    nReset = 0;
    PcEn = 0;
    PcIncCin = 0;
    PcSel = 0;
    PcWe = 0;
    Test = 0;
    DR_SysBus = 'bz;

   //Reset 
	#100 nReset = 0;
	#150 nReset=1;

#1000 
DR_SysBus= 16'd34;
LrEn=1;
      LrWe=1;
      LrSel=0;
      PcIncCin = 1;


#1000
 
ALU= 10;
PcWe=1;
PcSel=0;
PcEn=1;	
PcIncCin = 0;

#1000

LrEn=0;
PcIncCin = 1;

#1000 LrSel=1;
        

    #1000
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
    ,"%b", Scan ,
    ,"%b", SysBus ,
    );


//SIMVISION SCRIPT:Pc_Block.tcl

endmodule
