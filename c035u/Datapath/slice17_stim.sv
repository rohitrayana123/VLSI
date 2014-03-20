// stimulus file slice17_stim.sv for slice17
// created by ext2svmod 5.5

module slice17_stim;

timeunit 1ns;
timeprecision 10ps;

logic Clock ;		//Globals
logic nReset ;
logic SDI ;
logic Test ;
wire SDO ;

logic [1:0] Rs1Sel ;	//Encoded Source 1 address
logic [15:0] Ir ;	//Intruction register
logic [1:0] RwSel ;	//Encoded Destination register address
logic RegWe ;		//Enable Writing to register
logic [1:0] AluOR ;	//Interrupts ALU operation override
logic Cin ;		//ALU CarryIn
wire [3:0] Flags ;	//ALU Status flags

wire [7:0] Rw ;		//Destination register address
wire [7:0] Rs1 ;	//Source 1 address
wire [7:0] Rs2 ;	//Source 2 address

wire ZeroA ;		//ALUDecoder signals
wire SUB ;
wire CIn_slice ;
logic LastCIn ;
logic COut ;
//N is now Flags[3], input at bottom, output at top. Incorrect testbench recognition but no tests needed.
logic nZ ;
wire FAOut ;
wire AND ;
wire OR ;
wire XOR ;
wire NOT ;
wire NAND ;
wire NOR ;
logic ASign ;
wire ShB ;
wire ShL ;
wire Sh8 ;
wire ShR ;
wire ShiftIn ;//Corresponds to multiple outputs
wire Sh4 ;
wire Sh2 ;
wire Sh1 ;
wire ShOut ;
wire LLI ;

slice17 s17(
	.AND ( AND ),
	.CIn_slice ( CIn_slice ),
	.FAOut ( FAOut ),
	.Flags ( Flags ),
	.LLI ( LLI ),
	.NAND ( NAND ),
	.NOR ( NOR ),
	.NOT ( NOT ),
	.OR ( OR ),
	.Rs1 ( Rs1 ),
	.Rs2 ( Rs2 ),
	.Rw ( Rw ),
	.SDO ( SDO ),
	.Sh8 ( Sh8 ),
	.Sh4 ( Sh4 ),
	.Sh2 ( Sh2 ),
	.Sh1 ( Sh1 ),
	.ShB ( ShB ),
	.ShiftIn ( ShiftIn ),
	.ShL ( ShL ),
	.ShOut ( ShOut ),
	.ShR ( ShR ),
	.SUB ( SUB ),
	.XOR ( XOR ),
	.ZeroA ( ZeroA ),
	.AluOR ( AluOR ),
	.ASign ( ASign ),
	.Cin ( Cin ),
	.Clock ( Clock ),
	.COut ( COut ),
	.Ir ( Ir ),
	.LastCIn ( LastCIn ),
	.nReset ( nReset ),
	.nZ ( nZ ),
	.RegWe ( RegWe ),
	.Rs1Sel ( Rs1Sel ),
	.RwSel ( RwSel ),
	.SDI ( SDI ),
	.Test ( Test )
	);

// stimulus information follows

always
	#50 Clock = ~Clock;

always @(Ir or Cin)	//Flags checking
begin
	#16 assert(Flags[1] == (SUB ^ COut));
	#16 assert(Flags[2] == (LastCIn ^ SUB ^ COut));
	#16 assert(Flags[0] == ~nZ);
end
always @(Ir or Cin)  //Address lines checking
begin
	if(RegWe == 1)
	begin
		if (RwSel == 0)
		begin
			#15 assert(Rw == 1'b1 << Ir[7:5]) else $display("Rw = %b, Ir[7:5] = %b", Rw, Ir[7:5]);
		end
		else if (RwSel == 2)
		begin
			#15 assert(Rw == 1'b1 << Ir[10:8]) else $display("Rsw = %b, Ir[10:8] = %b", Rw, Ir[10:8]);
		end
		else
		begin
			#15 assert(Rw == 7) else $display("Rw = %b, 7", Rw);
		end
	end
	
	if (Rs1Sel == 0)
	begin
		#15 assert(Rs1 == 1'b1 << Ir[10:8]) else $display("Rs1 = %b, Ir[10:8] = %b", Rs1, Ir[10:8]);
	end
	else if (Rs1Sel == 2)
		#15 assert(Rs1 == 1'b1 << Ir[7:5]) else $display("Rs1 = %b, Ir[7:5] = %b", Rs1, Ir[7:5]);
	else
		#15 assert(Rs1 == 1'b1 << 7) else $display("Rs1 = %b, 7", Rs1);
	#15 assert(Rs2 == 1'b1 << Ir[4:2]);
	
	if(AluOR == 0)
	begin
		#15 assert(s17.ALUOpCode == Ir[15:11]) else $display("ALUOpCode = %b, Ir[15:11] = %b", s17.ALUOpCode, Ir[15:11]);
		    assert(s17.ALUCin == Cin) else $display("ALUCin = %b, Cin = %b", s17.ALUCin, Cin);
	end
	else if(AluOR == 1)
	begin
		#15 assert(s17.ALUOpCode == Ir[15:11])else $display("ALUOpCode = %b, Ir[15:11] = %b", s17.ALUOpCode, Ir[15:11]);
		    assert(s17.ALUCin == Cin) else $display("ALUCin = %b, Cin = %b", s17.ALUCin, Cin);
	end
	else if(AluOR == 2)
	begin
		#15 assert(s17.ALUOpCode == 5'b00101)else $display("ALUOpCode = %b, 00101", s17.ALUOpCode, Ir[15:11]);
		    assert(s17.ALUCin == 1'b0) else $display("ALUCin = %b, Cin = %b", s17.ALUCin, Cin);
	end
	else
	begin
		#15 assert(s17.ALUOpCode == 5'b01101)else $display("ALUOpCode = %b, 01101", s17.ALUOpCode, Ir[15:11]);
		    assert(s17.ALUCin == 1'b0) else $display("ALUCin = %b, Cin = %b", s17.ALUCin, Cin);
	end
end

initial
  begin
    Clock = 0; nReset = 0; SDI = 0; Test = 0;		//Globals
    Rs1Sel = 0; Ir = 16'b1100000000000000; 		//Control (Ir, Cin, RegWe normal operation)
    RwSel = 0; RegWe = 0; AluOR = 0; Cin = 0;	
    LastCIn = 0; COut = 0; nZ = 0; ASign = 0; 		//ALU Control
	//Outputs: Flags(4), Rw(8), Rs1(8), Rs2(8), ALUDecoder Stuff
    
    #100 nReset = 1;
    #20 RegWe = 1; 	//Enable writing of data
    
    //Normal operation testing
    #100 assert(ShOut == 1);
    #100 Ir = {5'b00010, 3'd0, 3'd0, 3'd0, 2'b00};	//ADD R0, R0, R0 
    #100 assert(FAOut == 1);
    #100 Ir = {5'b00010, 3'd1, 3'd2, 3'd4, 2'b11};	//ADD R1, R2, R4
    #100 assert(FAOut == 1);
    #100 Ir = {5'b00110, 3'd7, 3'd7, 5'd5 };		//ADDI R7, R7, #5
    #100 assert(FAOut == 1);				//CarryIn test
    #100 Cin = 1;
    //Interrupt-specific testing
    #100 RwSel = 2'd1;
    #100 RwSel = 2'd2;
    #100 RwSel = 2'd3;
    #100 Rs1Sel = 2'd1;
    #100 Rs1Sel = 2'd2;
    #100 Rs1Sel = 2'd3;
    #100 AluOR = 2'd1;
    #100 AluOR = 2'd2;
    #100 AluOR = 2'd3;
    //ALUDecoder testing
    
    
    #100 $finish;    
  end

// probe information follows
initial
begin
  $display("                   s || Control Signals                     || Register Addresses         || ALU Decoder Signals");
  $display("                     || s1 Ir               Rw WE OR C Flag || Rw       Rs1      Rs2      ||                    ");
  $monitor($time,
    ,"|| %b", Rs1Sel ,
    ,"%b", Ir ,
    ,"%b", RwSel ,
    ,"%b ", RegWe ,
    ,"%b", AluOR ,
    ,"%b", Cin ,
    ,"%b ||", Flags ,
    ,"%b", Rw ,
    ,"%b", Rs1 ,
    ,"%b ||", Rs2 ,
    ,"%b", ZeroA ,
    ,"%b", SUB ,
    ,"%b", CIn_slice ,
    ,"%b", LastCIn ,
    ,"%b", COut ,
    ,"%b", Flags[3] ,
    ,"%b", nZ ,
    ,"%b", FAOut ,
    ,"%b", AND ,
    ,"%b", OR ,
    ,"%b", XOR ,
    ,"%b", NOT ,
    ,"%b", NAND ,
    ,"%b", NOR ,
    ,"%b", ASign ,
    ,"%b", ShB ,
    ,"%b", ShL ,
    ,"%b", ShR ,
    ,"%b", Sh8 ,
    ,"%b", Sh4 ,
    ,"%b", Sh2 ,
    ,"%b", Sh1 ,
    ,"%b", ShiftIn ,
    ,"%b", ShOut ,
    ,"%b", LLI ,
    );
end


//SIMVISION SCRIPT:slice17.tcl

endmodule
