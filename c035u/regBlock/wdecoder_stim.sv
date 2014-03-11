// stimulus file wdecoder_stim.sv for wdecoder
// created by ext2svmod 5.5

module wdecoder_stim;

timeunit 1ns;
timeprecision 10ps;

logic [2:0] In ;
logic We ;

wire [7:0] Out ;

wdecoder instance1(
	.Out ( Out ),
	.In ( In ),
	.We ( We )
	);

// stimulus information follows

int errors;
initial
  begin
	errors = 0;
	In = 0;
	We = 0;
	while(1)
	begin
		#1000 assert( 0 == Out) else begin errors++; $display("Error with In = %d, Out = %d", In, Out); end
		In++;
		if(In == 0)
			break;
		
	end
	We = 1;
	while(1)
	begin
		#1000 assert(( 2 ** In ) == Out) else begin errors++; $display("Error with In = %d, Out = %d", In, Out); end
		In++;
		if(In == 0)
			break;
		
	end

	if ( errors == 0)
		$display("Simulation Passed!");
	else
		$display("Simulation FAILED!");

	$stop();
  end
// probe information follows

initial
  $monitor($time,
    ,"%b", In ,
    ,"%b", We ,
    ,"%b", Out ,
    );


//SIMVISION SCRIPT:wdecoder.tcl

endmodule
