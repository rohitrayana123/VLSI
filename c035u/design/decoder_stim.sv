// stimulus file decoder_stim.sv for decoder
// created by ext2svmod 5.5

module decoder_stim;

timeunit 1ns;
timeprecision 10ps;

logic [2:0] In ;

wire [7:0] Out ;

decoder instance1(
	.Out ( Out ),
	.In ( In )
	);

// stimulus information follows

int errors;
initial
  begin
	errors = 0;
	In = 0;
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
    ,"%b", Out ,
    );


//SIMVISION SCRIPT:decoder.tcl

endmodule
