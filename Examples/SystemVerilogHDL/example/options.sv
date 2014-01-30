// The following line indicates that a file "monitor.sv" exists and contains
// custom monitoring information
//
`define special_monitor

// The following line indicates that a file "stimulus.sv" exists and contains
// custom stimulus information
// (not required for simple simulations)
//
//`define special_stimulus

// The following line specifies the appropriate address map to be supported
// by the address decoder - the possible values are
//    reduced_address_map, full_address_map, address_map_0209
// (changing this line modifies the addresses for the Switches and LEDs!)
//
`define reduced_address_map

// The following line indicates that the processor has no 'nIRQ' input
//
//`define nointerrupt

// The following line indicates that the processor has no 'nWait' input
//
//`define nowait

// The following code specifies the default value of the input switches
// for the simulation in not already defined from the command line
//
`ifdef switch_value
  // already defined - do nothing
`else
  `define switch_value	7
`endif

