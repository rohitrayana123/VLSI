# $ rc < controlSynth.cmd
set_attribute hdl_search_path behavioural
read_hdl -sv opcodes.svh
read_hdl -sv control.sv
elaborate control
check_design -unresolved
report sequential -hier
