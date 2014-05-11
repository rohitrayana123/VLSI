DoFetch(LSL);	
@(posedge Clock);
SyncOutput(0,0,0,nOR,0,ImmShort,0,0,LrSys,0,0,1,0,0,Op1Rd1,Op2Imm,1,Pc1,1,1,Rs1Ra,RwRd,WdAlu,0);
state = fetch;
stateSub = cycle0;
$display("LSL - OK");
