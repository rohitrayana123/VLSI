package opcodes;

// Define Opcodes:
//
localparam NOP		= 4'd0;
localparam JMP		= 4'd1;
localparam JMPZ		= 4'd2;
localparam JMPNZ	= 4'd3;
localparam LDA		= 4'd4;
localparam ADD		= 4'd5;
localparam SUB		= 4'd6;
localparam AND		= 4'd7;
localparam OR		= 4'd8;
localparam NOT		= 4'd9;
localparam LSL		= 4'd10;
localparam LSR		= 4'd11;
localparam STA		= 4'd15;

// Define ALU Function Codes:
//
localparam FnACC	= 4'd0;
localparam FnMem	= 4'd4;
localparam FnADD	= 4'd5;
localparam FnSUB	= 4'd6;
localparam FnAND	= 4'd7;
localparam FnOR		= 4'd8;
localparam FnNOT	= 4'd9;
localparam FnLSL	= 4'd10;
localparam FnLSR	= 4'd11;

endpackage
