///////////////////////////////////////////////////////////////////////
// code_mem module
//		We use the assembler instead	
///////////////////////////////////////////////////////////////////////
`include "opcodes.sv"
`ifdef prog_file
  // already defined - do nothing
`else
  `define prog_file  "program.hex"
`endif
module code_mem();
reg [15:0] Data_stored [ 0 : 255 ];
initial begin
	Data_stored[0] 	= {`LUI,	11'h707}; 
	Data_stored[1] 	= {`LLI,	11'h7ff);
	Data_stored[2] 	= {`LUI,	11'h008};
	Data_stored[3] 	= {`LLI,	11'h000};
	Data_stored[4] 	= {`LDW,	11'h000};
	Data_stored[5] 	= {`LUI,	11'h000};
	Data_stored[6] 	= {`LLI,	11'h1ff};
	Data_stored[7] 	= {`AND,	11'h104};
	Data_stored[8] 	= {`LSR,	11'h008};
	Data_stored[9] 	= {`STW,	11'h0e0};
	Data_stored[10] = {`SUBIB,	11'h701};
	Data_stored[11] = {`STW,	11'h1e0};
	Data_stored[12] = {`SUBIB,	11'h701};
	Data_stored[13] = {`STW,	11'h2e0};
	Data_stored[14] = {`SUBIB,	11'h701};
	Data_stored[15] = {`BRANCH,	11'h30b};
	Data_stored[16] = {`ADDIB,	11'h701};
	Data_stored[17] = {`LDW,	11'h2e0};
	Data_stored[18] = {`ADDIB,	11'h701};
	Data_stored[19] = {`LDW,	11'h1e0};
	Data_stored[20] = {`ADDIB,	11'h701};
	Data_stored[21] = {`LDW,	11'h0e0};
	Data_stored[22] = {`LUI,	11'h408};
	Data_stored[23] = {`LLI,	11'h401};
	Data_stored[24] = {`STW,	11'h280};
	Data_stored[25] = {`BRANCH,	11'h000};
	Data_stored[26] = {`LDW,	11'h0e2};
	Data_stored[27] = {`LDW,	11'h1e3};
	Data_stored[28] = {`SUB,	11'h248};
	Data_stored[29] = {`ADDIB,	11'h100};
	Data_stored[30] = {`BNE,	11'h604};
	Data_stored[31] = {`ADD,	11'h240};
	Data_stored[32] = {`SUBIB,	11'h101};
	Data_stored[33] = {`BE,		11'h7fe};
	Data_stored[34] = {`STW,	11'h2e1};
	Data_stored[35] = {`RET,	11'h200};
	$writememh( `prog_file, Data_stored );
end
endmodule

