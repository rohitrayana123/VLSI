module processor(
  input Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

wire [15:0] DataBus;
wire [11:0] AddressBus;
wire [3:0] Function;
wire [3:0] Opcode;
wire Zflag, Mem_Write;

   control Control ( Function, SelInc, LoadPC, LoadIR,
                TrisOperand, TrisPC, TrisAcc, Mem_Write,
		Opcode, Zflag, Clock, nReset );

   datapath Datapath ( DataBus, AddressBus,
                Opcode, Zflag,
		Function, SelInc, LoadPC, LoadIR,
		TrisOperand, TrisPC, TrisAcc,
		Clock, nReset );

   memory Memory ( DataBus, AddressBus, Mem_Write, Clock );

endmodule
