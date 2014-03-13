// stimulus file datapath_stim.sv for datapath
// created by ext2svmod 5.5

module datapath_stim;

timeunit 1ns;
timeprecision 10ps;

logic AluEn ;
logic AluWe ;
logic CFlag ;
logic Clock ;
logic [15:0] DataIn ;
logic ImmSel ;
logic IrWe ;
logic LrEn ;
logic LrSel ;
logic LrWe ;
logic MemEn ;
logic nReset ;
logic Op1Sel ;
logic Op2Sel ;
logic PcEn ;
logic [1:0] PcSel ;
logic PcWe ;
logic RegWe ;
logic [1:0] Rs1Sel ;
logic [1:0] RwSel ;
logic SDI ;
logic Test ;
logic WdSel ;

wire [3:0] Flags ;
wire [15:0] Ir ;
wire SDO ;
wire [15:0] SysBus ;

datapath instance1(
	.Flags ( Flags ),
	.Ir ( Ir ),
	.SDO ( SDO ),
	.SysBus ( SysBus ),
	.AluEn ( AluEn ),
	.AluWe ( AluWe ),
	.CFlag ( CFlag ),
	.Clock ( Clock ),
	.DataIn ( DataIn ),
	.ImmSel ( ImmSel ),
	.IrWe ( IrWe ),
	.LrEn ( LrEn ),
	.LrSel ( LrSel ),
	.LrWe ( LrWe ),
	.MemEn ( MemEn ),
	.nReset ( nReset ),
	.Op1Sel ( Op1Sel ),
	.Op2Sel ( Op2Sel ),
	.PcEn ( PcEn ),
	.PcSel ( PcSel ),
	.PcWe ( PcWe ),
	.RegWe ( RegWe ),
	.Rs1Sel ( Rs1Sel ),
	.RwSel ( RwSel ),
	.SDI ( SDI ),
	.Test ( Test ),
	.WdSel ( WdSel )
	);

// stimulus information follows

initial
  begin
    AluEn = 0;
    AluWe = 0;
    CFlag = 0;
    Clock = 0;
    DataIn = 0;
    ImmSel = 0;
    IrWe = 0;
    LrEn = 0;
    LrSel = 0;
    LrWe = 0;
    MemEn = 0;
    nReset = 0;
    Op1Sel = 0;
    Op2Sel = 0;
    PcEn = 0;
    PcSel = 0;
    PcWe = 0;
    RegWe = 0;
    Rs1Sel = 0;
    RwSel = 0;
    SDI = 0;
    Test = 0;
    WdSel = 0;

    #1000
          AluEn = 1;
    #1000
          AluWe = 1;
    #1000
          CFlag = 1;
    #1000
          Clock = 1;
    #1000
          DataIn = 1;
    #1000
          ImmSel = 1;
    #1000
          IrWe = 1;
    #1000
          LrEn = 1;
    #1000
          LrSel = 1;
    #1000
          LrWe = 1;
    #1000
          MemEn = 1;
    #1000
          nReset = 1;
    #1000
          Op1Sel = 1;
    #1000
          Op2Sel = 1;
    #1000
          PcEn = 1;
    #1000
          PcSel = 1;
    #1000
          PcWe = 1;
    #1000
          RegWe = 1;
    #1000
          Rs1Sel = 1;
    #1000
          RwSel = 1;
    #1000
          SDI = 1;
    #1000
          Test = 1;
    #1000
          WdSel = 1;
    #1000
          AluEn = 0;
    #1000
          AluWe = 0;
    #1000
          CFlag = 0;
    #1000
          Clock = 0;
    #1000
          DataIn = 0;
    #1000
          ImmSel = 0;
    #1000
          IrWe = 0;
    #1000
          LrEn = 0;
    #1000
          LrSel = 0;
    #1000
          LrWe = 0;
    #1000
          MemEn = 0;
    #1000
          nReset = 0;
    #1000
          Op1Sel = 0;
    #1000
          Op2Sel = 0;
    #1000
          PcEn = 0;
    #1000
          PcSel = 0;
    #1000
          PcWe = 0;
    #1000
          RegWe = 0;
    #1000
          Rs1Sel = 0;
    #1000
          RwSel = 0;
    #1000
          SDI = 0;
    #1000
          Test = 0;
    #1000
          WdSel = 0;

    #1000
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", AluEn ,
    ,"%b", AluWe ,
    ,"%b", CFlag ,
    ,"%b", Clock ,
    ,"%b", DataIn ,
    ,"%b", ImmSel ,
    ,"%b", IrWe ,
    ,"%b", LrEn ,
    ,"%b", LrSel ,
    ,"%b", LrWe ,
    ,"%b", MemEn ,
    ,"%b", nReset ,
    ,"%b", Op1Sel ,
    ,"%b", Op2Sel ,
    ,"%b", PcEn ,
    ,"%b", PcSel ,
    ,"%b", PcWe ,
    ,"%b", RegWe ,
    ,"%b", Rs1Sel ,
    ,"%b", RwSel ,
    ,"%b", SDI ,
    ,"%b", Test ,
    ,"%b", WdSel ,
    ,"%b", Flags ,
    ,"%b", Ir ,
    ,"%b", SDO ,
    ,"%b", SysBus ,
    ,"%b", instance1.Pc ,
    ,"%b", instance1.AluOut ,
    ,"%b", instance1.reg0 ,
    ,"%b", instance1.reg1 ,
    ,"%b", instance1.reg2 ,
    ,"%b", instance1.reg3 ,
    ,"%b", instance1.reg4 ,
    ,"%b", instance1.reg5 ,
    ,"%b", instance1.reg6 ,
    ,"%b", instance1.Rd2 ,
    ,"%b", instance1.Rd1 ,
    ,"%b", instance1.ImmProbe ,
    );


//SIMVISION SCRIPT:datapath.tcl

endmodule
