// This special monitor file is customized for the example cpu

// finish when the processor attempts to read an instruction from address 99
// 
//
//  (for your CPU you may need to change the termination address [99]
//   alternatively you may wish to delete this section altogether
//   and rely on the simulation termination for another reason
//  )
//
//always @(posedge nME)
//   if ( Address == 99 )
//      begin
//         $display("Terminating at address 99\n");
//         @(posedge nME);
//         $stop;
//         $finish;
//      end


int encount; 
always @(negedge Clock)
begin
	encount = 0;
	if(CPU.CPU_core.MemEn) 
		encount++;
	
	if(CPU.CPU_core.PcEn) 
		encount++;
	
	if(CPU.CPU_core.LrEn) 
		encount++;
	
	if(CPU.CPU_core.AluEn) 
		encount++;
	
	if(CPU.CPU_core.StatusRegEn) 
		encount++;
	
	assert(1 == encount) else begin 
		if (encount == 0)
			$display("SysBus is Undriven");
		else begin
			$display("Bus Conention");
			if(CPU.CPU_core.MemEn) 
				$display("Memory driving bus"); 
		
			if(CPU.CPU_core.PcEn) 
				$display("Pc driving bus");
			
			if(CPU.CPU_core.LrEn) 
				$display("Lr driving bus");
		
			if(CPU.CPU_core.AluEn) 
				$display("Alu driving bus");
				
			if(CPU.CPU_core.StatusRegEn) 
				$display("StatusReg driving bus");
		end
	end
	assert (CPU.CPU_core.MemEn == CPU.CPU_core.ENB) else begin $display("MemEn and ENB not asserted together");end
end
