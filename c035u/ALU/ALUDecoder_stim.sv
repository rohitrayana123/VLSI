// stimulus file ALUDecoder_stim.sv for ALUDecoder
// created by ext2svmod 5.5

module ALUDecoder_stim;

timeunit 1ns;
timeprecision 10ps;

logic ASign ;
logic Cin ;
logic COut ;
logic [3:0] imm4 ;
logic LastCIn ;
logic nZ ;
logic [4:0] OpCode ;

wire AND ;
wire C ;
wire CIn_slice ;
wire FAOut ;
wire LLI ;
wire N ;
wire NAND ;
wire NOR ;
wire NOT ;
wire OR ;
wire Sh1 ;
wire Sh2 ;
wire Sh4 ;
wire Sh8 ;
wire ShB ;
wire ShInBit ;
wire ShL ;
wire ShOut ;
wire ShR ;
wire SUB ;
wire V ;
wire XOR ;
wire Z ;
wire ZeroA ;

ALUDecoder ad(
	.AND ( AND ),
	.C ( C ),
	.CIn_slice ( CIn_slice ),
	.FAOut ( FAOut ),
	.LLI ( LLI ),
	.N ( N ),
	.NAND ( NAND ),
	.NOR ( NOR ),
	.NOT ( NOT ),
	.OR ( OR ),
	.Sh1 ( Sh1 ),
	.Sh2 ( Sh2 ),
	.Sh4 ( Sh4 ),
	.Sh8 ( Sh8 ),
	.ShB ( ShB ),
	.ShInBit ( ShInBit ),
	.ShL ( ShL ),
	.ShOut ( ShOut ),
	.ShR ( ShR ),
	.SUB ( SUB ),
	.V ( V ),
	.XOR ( XOR ),
	.Z ( Z ),
	.ZeroA ( ZeroA ),
	.ASign ( ASign ),
	.Cin ( Cin ),
	.COut ( COut ),
	.imm4 ( imm4 ),
	.LastCIn ( LastCIn ),
	.nZ ( nZ ),
	.OpCode ( OpCode )
	);

// stimulus information follows

initial
  begin
    ASign = 0;
    Cin = 0;
    COut = 0;
    imm4 = 0;
    LastCIn = 0;
    nZ = 0;
    OpCode = 0;

    #1000
          ASign = 1;
    #1000
          Cin = 1;
    #1000
          COut = 1;
    #1000
          imm4 = 1;
    #1000
          LastCIn = 1;
    #1000
          nZ = 1;
    #1000
          OpCode = 1;
    #1000
          ASign = 0;
    #1000
          Cin = 0;
    #1000
          COut = 0;
    #1000
          imm4 = 0;
    #1000
          LastCIn = 0;
    #1000
          nZ = 0;
    #1000
          OpCode = 0;

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", ASign ,
    ,"%b", Cin ,
    ,"%b", COut ,
    ,"%b", imm4 ,
    ,"%b", LastCIn ,
    ,"%b", nZ ,
    ,"%b", OpCode ,
    ,"%b", AND ,
    ,"%b", C ,
    ,"%b", CIn_slice ,
    ,"%b", FAOut ,
    ,"%b", LLI ,
    ,"%b", N ,
    ,"%b", NAND ,
    ,"%b", NOR ,
    ,"%b", NOT ,
    ,"%b", OR ,
    ,"%b", Sh1 ,
    ,"%b", Sh2 ,
    ,"%b", Sh4 ,
    ,"%b", Sh8 ,
    ,"%b", ShB ,
    ,"%b", ShInBit ,
    ,"%b", ShL ,
    ,"%b", ShOut ,
    ,"%b", ShR ,
    ,"%b", SUB ,
    ,"%b", V ,
    ,"%b", XOR ,
    ,"%b", Z ,
    ,"%b", ZeroA ,
    ,"%b", ad.nA ,
    ,"%b", ad.nB ,
    ,"%b", ad.nC ,
    ,"%b", ad.nD ,
    ,"%b", ad.nE ,
    ,"%b", ad.ShSign ,
    );


//SIMVISION SCRIPT:ALUDecoder.tcl

endmodule
