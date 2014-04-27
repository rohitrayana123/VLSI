// This is a blank options.sv file in which various compile time options
// may be set

// The following line indicates that a file "monitor.sv" exists and contains
// custom monitoring inforamtion
//
`define special_monitor
`define behavioural
// The following line indicates that a file "stimulus.sv" exists and contains
// custom stimulus inforamtion
//
//`define special_stimulus

// The following line specifies the appropriate address map to be supported
// by the address decoder (the possible values are
//   reduced_address_map
//   full_address_map
//   address_map_0209
// )
//
//`define full_address_map

// The following code specifies the default value of the input switches
// for the simulation in not already defined from the command line
//
//`ifdef switch_value
//  // already defined - do nothing
//`else
//  `define switch_value	7
//`endif
//`define crosssim
