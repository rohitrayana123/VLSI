// stimulus file datapath_stim.sv for datapath
// created by ext2svmod 5.5

module datapath_stim;

timeunit 1ns;
timeprecision 10ps;

logic AluEn ;
logic [1:0] AluOR ;
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
logic [1:0] Op2Sel ;
logic PcEn ;
logic [2:0] PcSel ;
logic PcWe ;
logic RegWe ;
logic [1:0] Rs1Sel ;
logic [1:0] RwSel ;
logic SDI ;
logic [3:0] StatusReg ;
logic StatusRegEn ;
logic Test ;
logic WdSel ;

wire [15:0] DataOut ;
wire [3:0] Flags ;
wire [15:0] Ir ;
wire SDO ;

datapath instance1(
	.DataOut ( DataOut ),
	.Flags ( Flags ),
	.Ir ( Ir ),
	.SDO ( SDO ),
	.AluEn ( AluEn ),
	.AluOR ( AluOR ),
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
	.StatusReg ( StatusReg ),
	.StatusRegEn ( StatusRegEn ),
	.Test ( Test ),
	.WdSel ( WdSel )
	);

// stimulus information follows

initial
  begin
    AluEn = 0;
    AluOR = 0;
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
    StatusReg = 0;
    StatusRegEn = 0;
    Test = 0;
    WdSel = 0;

  end

//SIMVISION SCRIPT:datapath.tcl

endmodule
