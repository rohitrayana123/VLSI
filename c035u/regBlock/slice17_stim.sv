// stimulus file slice17_stim.sv for slice17
// created by ext2svmod 5.5

module slice17_stim;

timeunit 1ns;
timeprecision 10ps;

logic [2:0] Rs1In ;
logic [2:0] Rs2In ;
logic [2:0] RwIn ;
logic We ;

wire [7:0] Rs1 ;
wire [7:0] Rs2 ;
wire [7:0] Rw ;

slice17 instance1(
	.Rs1 ( Rs1 ),
	.Rs2 ( Rs2 ),
	.Rw ( Rw ),
	.Rs1In ( Rs1In ),
	.Rs2In ( Rs2In ),
	.RwIn ( RwIn ),
	.We ( We )
	);

// stimulus information follows
int errors;
initial
  begin
    Rs1In = 0;
    Rs2In = 0;
    RwIn = 0;
    We = 0;
	errors = 0;
	while(1)
	begin
		#1000 assert(( 2 ** Rs1In ) == Rs1) else begin errors++; $display("Error with Rs1In = %d, Rs1 = %d", Rs1In, Rs1); end
		Rs1In++;
		if(Rs1In == 0)
			break;
		
	end
	
	while(1)
	begin
		#1000 assert(( 2 ** Rs2In ) == Rs2) else begin errors++; $display("Error with Rs2In = %d, Rs2 = %d", Rs2In, Rs2); end
		Rs2In++;
		if(Rs2In == 0)
			break;
		
	end
	while(1)
	begin
		#1000 assert( 0 == Rw) else begin errors++; $display("Error with RwIn = %d, Rw = %d", RwIn, Rw); end
		RwIn++;
		if(RwIn == 0)
			break;
		
	end
	We = 1;
	while(1)
	begin
		#1000 assert(( 2 ** RwIn ) == Rw) else begin errors++; $display("Error with RwIn = %d, Rw = %d", RwIn, Rw); end
		RwIn++;
		if(RwIn == 0)
			break;
		
	end
    
	#1000

	if ( errors == 0)
		$display("Simulation Passed!");
	else
		$display("Simulation FAILED!");
          $stop;
          $finish;
  end

// probe information follows

initial
  $monitor($time,
    ,"%b", Rs1In ,
    ,"%b", Rs2In ,
    ,"%b", RwIn ,
    ,"%b", We ,
    ,"%b", Rs1 ,
    ,"%b", Rs2 ,
    ,"%b", Rw ,
    );


//SIMVISION SCRIPT:slice17.tcl

endmodule
