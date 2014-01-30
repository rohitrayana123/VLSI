package opcodes;

localparam load_inst			= 4'd0;
localparam store_inst			= 4'd1;
localparam alu_inst			= 4'd2;
localparam control_transfer_inst	= 4'd3;

localparam ACCn		= 2'd0;
localparam Xn		= 2'd1;
localparam Sn		= 2'd2;
localparam PCn		= 2'd3;

localparam Never	= 4'd0;
localparam Always	= 4'd1;
localparam Zequal0	= 4'd2;
localparam Zequal1	= 4'd3;

localparam FnReg	= 4'd0;
localparam FnNOT	= 4'd1;
localparam FnLSL	= 4'd2;
localparam FnLSR	= 4'd3;
localparam FnADD	= 4'd4;
localparam FnSUB	= 4'd5;
localparam FnAND	= 4'd6;
localparam FnOR		= 4'd7;
localparam FnMem	= 4'd8;

localparam NOP		= {load_inst,ACCn,ACCn,FnReg};
localparam LDA		= {load_inst,ACCn,ACCn,FnMem};
localparam LDX		= {load_inst,ACCn,Xn,FnMem};
localparam LDS		= {load_inst,ACCn,Sn,FnMem};
localparam STA		= {store_inst,ACCn,ACCn,FnReg};
localparam STX		= {store_inst,Xn,Xn,FnReg};
localparam STS		= {store_inst,Sn,Sn,FnReg};
localparam ADD		= {alu_inst,ACCn,ACCn,FnADD};
localparam SUB		= {alu_inst,ACCn,ACCn,FnSUB};
localparam AND		= {alu_inst,ACCn,ACCn,FnAND};
localparam OR		= {alu_inst,ACCn,ACCn,FnOR};
localparam COM		= {alu_inst,ACCn,ACCn,FnNOT};
localparam LSL		= {alu_inst,ACCn,ACCn,FnLSL};
localparam LSR		= {alu_inst,ACCn,ACCn,FnLSR};
localparam BA		= {control_transfer_inst,PCn,PCn,Always};
localparam BEQ		= {control_transfer_inst,PCn,PCn,Zequal1};
localparam BNE		= {control_transfer_inst,PCn,PCn,Zequal0};

localparam INHERENT	= 4'd0;
localparam PC_RELATIVE	= 4'd1;
localparam IMMEDIATE	= 4'd2;
localparam DIRECT	= 4'd3;
localparam INDEXED	= 4'd4;

endpackage
