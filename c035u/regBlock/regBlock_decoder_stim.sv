// stimulus file regBlock_decoder_stim.sv for regBlock_decoder
// created by ext2svmod 5.5

module regBlock_decoder_stim;

timeunit 1ns;
timeprecision 10ps;

logic [1:0] AluOR ;
logic Cin ;
logic [15:11] Ir ;
logic [2:0] Rs1In ;
logic [2:0] Rs2In ;
logic [2:0] RwIn ;
logic We ;

wire AluBin ;
wire [4:0] AluOp ;
wire [7:0] Rs1 ;
wire [7:0] Rs2 ;
wire [7:0] Rw ;

regBlock_decoder instance1(
	.AluBin ( AluBin ),
	.AluOp ( AluOp ),
	.Rs1 ( Rs1 ),
	.Rs2 ( Rs2 ),
	.Rw ( Rw ),
	.AluOR ( AluOR ),
	.Cin ( Cin ),
	.Ir ( Ir ),
	.Rs1In ( Rs1In ),
	.Rs2In ( Rs2In ),
	.RwIn ( RwIn ),
	.We ( We )
	);

// stimulus information follows

initial
  begin
    AluOR = 0;
    Cin = 0;
    Ir = 0;
    Rs1In = 0;
    Rs2In = 0;
    RwIn = 0;
    We = 0;

    #1000
          AluOR = 1;
    #1000
          Cin = 1;
    #1000
          Ir = 1;
    #1000
          Rs1In = 1;
    #1000
          Rs2In = 1;
    #1000
          RwIn = 1;
    #1000
          We = 1;
    #1000
          AluOR = 0;
    #1000
          Cin = 0;
    #1000
          Ir = 0;
    #1000
          Rs1In = 0;
    #1000
          Rs2In = 0;
    #1000
          RwIn = 0;
    #1000
          We = 0;

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", AluOR ,
    ,"%b", Cin ,
    ,"%b", Ir ,
    ,"%b", Rs1In ,
    ,"%b", Rs2In ,
    ,"%b", RwIn ,
    ,"%b", We ,
    ,"%b", AluBin ,
    ,"%b", AluOp ,
    ,"%b", Rs1 ,
    ,"%b", Rs2 ,
    ,"%b", Rw ,
    );


//SIMVISION SCRIPT:regBlock_decoder.tcl

endmodule
