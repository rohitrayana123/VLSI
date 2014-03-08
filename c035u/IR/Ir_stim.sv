// stimulus file Ir_stim.sv for Ir
// created by ext2svmod 5.5

module Ir_stim;

timeunit 1ns;
timeprecision 10ps;

logic Clock ;
logic ImmSel ;
logic [15:0] IrIn ;
logic IrWe ;
logic nReset ;
logic SDI ;
logic Test ;

wire [15:0] Imm ;
wire [15:0] Ir ;

Ir instance1(
	.Imm ( Imm ),
	.Ir ( Ir ),
	.Clock ( Clock ),
	.ImmSel ( ImmSel ),
	.IrIn ( IrIn ),
	.IrWe ( IrWe ),
	.nReset ( nReset ),
	.SDI ( SDI ),
	.Test ( Test )
	);

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

`define IMMSHORT 1
`define IMMLONG  0
initial
  begin
    errors = 0;
    ImmSel = 0;
    IrIn = 0;
    IrWe = 0;
    nReset = 1;
    SDI = 0;
    Test = 0;
	
	#250 nReset = 0;
	#250 nReset = 1;
	
	IrIn = 16'hFFFF;
	#1000 //wait a clock cycle
	assert(Ir == 0) else begin errors++; $display("Ir We fail"); end
	IrWe = 1;
	#1000 assert(Ir == IrIn) else begin errors++; $display("Ir We Fail");
end
	
	IrWe = 0;
	IrIn = 16'h001F;
	
	#1000 assert ( Ir == 16'hFFFF ) else begin errors++; $display("Ir We Fail");end
	
	IrWe = 1;
	ImmSel = `IMMSHORT;
	#1000 
	assert(Imm == 16'hFFFF) else begin errors++; $display("ImmSel Short Error"); end
	ImmSel = `IMMLONG;
	#1000 assert(Imm == 16'h001F) else begin errors++; $display("ImmSel Long error"); end
	
	IrIn = 16'h00EF;
	
	ImmSel = `IMMSHORT;
	#1000 assert(Imm == 16'h000F) else begin errors++; $display("ImmSel Short Error"); end
	
	ImmSel = `IMMLONG;
	#1000 assert(Imm == 16'hFFEF) else begin errors++; $display("ImmSel Long error"); end
	
    #1000
	if(errors == 0)
		$display("Simulation Passed!");
	else
		$display("Simulation FAILED");
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", Clock ,
    ,"%b", ImmSel ,
    ,"%b", IrIn ,
    ,"%b", IrWe ,
    ,"%b", nReset ,
    ,"%b", SDI ,
    ,"%b", Test ,
    ,"%b", Imm ,
    ,"%b", Ir ,
    );


//SIMVISION SCRIPT:Ir.tcl

endmodule
