// stimulus file regBlock_slice_stim.sv for regBlock_slice
// created by ext2svmod 5.5

module regBlock_slice_stim;

timeunit 1ns;
timeprecision 10ps;

logic Clock ;
logic nReset ;
logic [7:0] Rs1 ;
logic [7:0] Rs2 ;
logic [7:0] Rw ;
logic SDI ;
logic Test ;
logic WData ;

wire Rd1 ;
wire Rd2 ;
wire Scan ;

regBlock_slice instance1(
	.Rd1 ( Rd1 ),
	.Rd2 ( Rd2 ),
	.Scan ( Scan ),
	.Clock ( Clock ),
	.nReset ( nReset ),
	.Rs1 ( Rs1 ),
	.Rs2 ( Rs2 ),
	.Rw ( Rw ),
	.SDI ( SDI ),
	.Test ( Test ),
	.WData ( WData )
	);

// stimulus information follows
always
begin
 Clock = 0;
 #500 Clock = 1;
 #500 Clock = 0;
end

initial
  begin
    Clock = 0;
    nReset = 1;
    Rs1 = 0;
    Rs2 = 0;
    Rw = 0;
    SDI = 0;
    Test = 0;
    WData = 0;

#500 nReset=0;
#500 nReset=1;

    #1000
          Rs1 = 1;
          Rs2 = 1;
          Rw = 1;
          SDI = 0;
          Test = 0;
          WData = 1;
    #1000
          Rs1 = 1;
          Rs2 = 1;
          Rw = 0;
          SDI = 0;
          Test = 0;
          WData = 0;
#1000
          Rs1 = 1;
          Rs2 = 1;
          Rw = 1;
          SDI = 0;
          Test = 0;
          WData = 0;
#1000
          Rs1 = 0;
          Rs2 = 1;
          Rw = 1;
          SDI = 0;
          Test = 0;
          WData = 1;
#1000
          Rs1 = 0;
          Rs2 = 1;
          Rw = 0;
          SDI = 0;
          Test = 0;
          WData = 1;
#1000
          Rs1 = 1;
          Rs2 = 1;
          Rw = 1;
          SDI = 0;
          Test = 0;
          WData = 0;
#1000
          Rs1 = 1;
          Rs2 = 0;
          Rw = 1;
          SDI = 0;
          Test = 0;
          WData = 1;


    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", Clock ,
    ,"%b", nReset ,
    ,"%b", Rs1 ,
    ,"%b", Rs2 ,
    ,"%b", Rw ,
    ,"%b", SDI ,
    ,"%b", Test ,
    ,"%b", WData ,
    ,"%b", Rd1 ,
    ,"%b", Rd2 ,
    ,"%b", Scan ,
    );


//SIMVISION SCRIPT:regBlock_slice.tcl

endmodule
