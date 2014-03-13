// stimulus file regBlock_slice_stim.sv for regBlock_slice
// created by ext2svmod 5.5

module regBlock_slice_stim;

timeunit 1ns;
timeprecision 10ps;

logic [7:0] Rs1 ;
logic [7:0] Rs2 ;
logic [7:0] Rw ;
logic WData ;

wire Rd1 ;
wire Rd2 ;

regBlock_slice instance1(
	.Rd1 ( Rd1 ),
	.Rd2 ( Rd2 ),
	.Rs1 ( Rs1 ),
	.Rs2 ( Rs2 ),
	.Rw ( Rw ),
	.WData ( WData )
	);

// stimulus information follows

initial
  begin
    Rs1 = 0;
    Rs2 = 0;
    Rw = 0;
    WData = 0;

    #1000
          Rs1 = 1;
    #1000
          Rs2 = 1;
    #1000
          Rw = 1;
    #1000
          WData = 1;
    #1000
          Rs1 = 0;
    #1000
          Rs2 = 0;
    #1000
          Rw = 0;
    #1000
          WData = 0;

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", Rs1 ,
    ,"%b", Rs2 ,
    ,"%b", Rw ,
    ,"%b", WData ,
    ,"%b", Rd1 ,
    ,"%b", Rd2 ,
    ,"%b", instance1.Reg0 ,
    ,"%b", instance1.Reg1 ,
    ,"%b", instance1.Reg2 ,
    ,"%b", instance1.Reg3 ,
    ,"%b", instance1.Reg4 ,
    ,"%b", instance1.Reg5 ,
    ,"%b", instance1.Reg6 ,
    ,"%b", instance1.Reg7Out ,
    );


//SIMVISION SCRIPT:regBlock_slice.tcl

endmodule
