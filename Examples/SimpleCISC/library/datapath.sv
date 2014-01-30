module datapath(
  inout [15:0] DataBus,
  output logic [15:0] Address, IR,
  output logic ZReg, 
  input [3:0] Function,
  input UpdateZ,
  input EnableACC, LoadACC, EnableX, LoadX, EnableS, LoadS,
  input EnablePC, LoadPC, IncPC, SelPC, LoadIR, LoadMAR, EnableReg,
  input Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

logic [15:0] ACC, X, S, PC, MAR;

wire [15:0] ALUoutBus, RegBus;

//
// ALU Instance
//
   alu ALU ( ALU_Zflag, ALUoutBus, RegBus, DataBus, Function);

//
// Drive RegBus and DataBus as required
//
   assign RegBus = (EnableACC) ? ACC : 16'bz;
   assign RegBus = (EnableX)   ? X   : 16'bz;
   assign RegBus = (EnableS)   ? S   : 16'bz;
   assign RegBus = (EnablePC)  ? PC  : 16'bz;

   assign DataBus = ( EnableReg ) ? RegBus : 16'bz;

//
// Address multiplexor
//
   assign Address = (SelPC) ? PC : MAR;

//
// Update Registers as required
//
   always_ff @(posedge Clock, negedge nReset)
      if (!nReset)
         begin
            PC   <= 0;
            IR   <= 0;
            ACC  <= 0;
            X    <= 0;
            S    <= 0;
            MAR  <= 0;
            ZReg <= 0;
         end
      else
         begin
            if (LoadPC)  PC   <= #20 ALUoutBus;
             else if (IncPC) PC <= #20 PC + 1;
            if (LoadIR)  IR   <= #20 DataBus;
            if (LoadACC) ACC  <= #20 ALUoutBus;
            if (LoadX)   X    <= #20 ALUoutBus;
            if (LoadS)   S    <= #20 ALUoutBus;
            if (LoadMAR) MAR  <= #20 ALUoutBus;
            if (UpdateZ) ZReg <= #20 ALU_Zflag;
         end
endmodule
