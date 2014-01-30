
# system.tcl

database -open waves.shm -default

simvision {

  source /opt/cad/bim/fcde/tcl/routines.tcl
  source /opt/cad/bim/fcde/tcl/read_fig.tcl

  ecsWaves  {
    system.Clock
    system.nReset
    system.ALE
    system.nME
    system.nOE
    system.RnW
    system.nWait
    system.Data
    system.Address
    } "Waves for Example uP Design"

  ecsRegisters {

    system.RAM.Data_stored[000]
    system.RAM.Data_stored[001]
    system.RAM.Data_stored[002]
    system.RAM.Data_stored[003]
    system.RAM.Data_stored[004]
    system.RAM.Data_stored[005]
    system.RAM.Data_stored[006]
    system.RAM.Data_stored[007]
    system.RAM.Data_stored[008]
    system.RAM.Data_stored[009]
    system.RAM.Data_stored[010]
    system.RAM.Data_stored[011]
    system.RAM.Data_stored[012]
    system.RAM.Data_stored[013]
    system.RAM.Data_stored[014]
    system.RAM.Data_stored[015]
    system.RAM.Data_stored[016]
    system.RAM.Data_stored[017]
    system.RAM.Data_stored[018]
    system.RAM.Data_stored[019]
    system.RAM.Data_stored[020]
    system.RAM.Data_stored[021]
    system.RAM.Data_stored[022]
    system.RAM.Data_stored[023]
    system.RAM.Data_stored[024]
    system.RAM.Data_stored[025]
    system.RAM.Data_stored[026]
    system.RAM.Data_stored[027]
    system.RAM.Data_stored[028]
    system.RAM.Data_stored[029]
    system.RAM.Data_stored[030]
    system.RAM.Data_stored[031]
    system.RAM.Data_stored[032]
    system.RAM.Data_stored[033]
    system.RAM.Data_stored[034]
    system.RAM.Data_stored[035]
    system.RAM.Data_stored[036]
    system.RAM.Data_stored[037]
    system.RAM.Data_stored[038]
    system.RAM.Data_stored[039]
    system.RAM.Data_stored[040]
    system.RAM.Data_stored[041]
    system.RAM.Data_stored[042]
    system.RAM.Data_stored[043]
    system.RAM.Data_stored[044]
    system.RAM.Data_stored[045]
    system.RAM.Data_stored[046]
    system.RAM.Data_stored[047]
    system.RAM.Data_stored[048]
    system.RAM.Data_stored[049]
    } "Registers for Example uP Design" "Memory"

  if { [file exists $::env(LIB)/system.fig] == 1 } {
    ecsReadFig $::env(LIB)/system.fig "Registers for Example uP Design" "Architecture"
  } elseif { [file exists $::env(SYS)/system.fig] == 1 } {
    ecsReadFig $::env(SYS)/system.fig "Default Registers for uP Designs" "Architecture"
  }

  # =========================================================================
  # Register Window

  # Open new register window

  window new RegisterWindow  -name  "Memory View for Example uP Design"
  window  geometry  "Memory View for Example uP Design"  700x450+0+350
  register  using  "Memory View for Example uP Design"

  # Add signal values (specified location and format)
  
  # =========================================================================

  register addtype -type text        -x0 10 -y0 15 -text {Memory (code)} \
    -fill red

  register addtype -type text        -x0 10 -y0 40 -text {[0]}
  register addtype -type signalvalue -x0 40 -y0 40 -radix %x \
    {system.RAM.Data_stored[0]}
  register addtype -type signalvalue -x0 100 -y0 40 -radix %s \
    {system.DisassemblyListing[0]}

  register addtype -type text        -x0 10 -y0 60 -text {[1]}
  register addtype -type signalvalue -x0 40 -y0 60 -radix %x \
    {system.RAM.Data_stored[1]}
  register addtype -type signalvalue -x0 100 -y0 60 -radix %s \
    {system.DisassemblyListing[1]}

  register addtype -type text        -x0 10 -y0 80 -text {[2]}
  register addtype -type signalvalue -x0 40 -y0 80 -radix %x \
    {system.RAM.Data_stored[2]}
  register addtype -type signalvalue -x0 100 -y0 80 -radix %s \
    {system.DisassemblyListing[2]}

  register addtype -type text        -x0 10 -y0 100 -text {[3]}
  register addtype -type signalvalue -x0 40 -y0 100 -radix %x \
    {system.RAM.Data_stored[3]}
  register addtype -type signalvalue -x0 100 -y0 100 -radix %s \
    {system.DisassemblyListing[3]}

  register addtype -type text        -x0 10 -y0 120 -text {[4]}
  register addtype -type signalvalue -x0 40 -y0 120 -radix %x \
    {system.RAM.Data_stored[4]}
  register addtype -type signalvalue -x0 100 -y0 120 -radix %s \
    {system.DisassemblyListing[4]}

  register addtype -type text        -x0 10 -y0 140 -text {[5]}
  register addtype -type signalvalue -x0 40 -y0 140 -radix %x \
    {system.RAM.Data_stored[5]}
  register addtype -type signalvalue -x0 100 -y0 140 -radix %s \
    {system.DisassemblyListing[5]}

  register addtype -type text        -x0 10 -y0 160 -text {[6]}
  register addtype -type signalvalue -x0 40 -y0 160 -radix %x \
    {system.RAM.Data_stored[6]}
  register addtype -type signalvalue -x0 100 -y0 160 -radix %s \
    {system.DisassemblyListing[6]}

  register addtype -type text        -x0 10 -y0 180 -text {[7]}
  register addtype -type signalvalue -x0 40 -y0 180 -radix %x \
    {system.RAM.Data_stored[7]}
  register addtype -type signalvalue -x0 100 -y0 180 -radix %s \
    {system.DisassemblyListing[7]}

  register addtype -type text        -x0 10 -y0 200 -text {[8]}
  register addtype -type signalvalue -x0 40 -y0 200 -radix %x \
    {system.RAM.Data_stored[8]}
  register addtype -type signalvalue -x0 100 -y0 200 -radix %s \
    {system.DisassemblyListing[8]}

  register addtype -type text        -x0 10 -y0 220 -text {[9]}
  register addtype -type signalvalue -x0 40 -y0 220 -radix %x \
    {system.RAM.Data_stored[9]}
  register addtype -type signalvalue -x0 100 -y0 220 -radix %s \
    {system.DisassemblyListing[9]}

  register addtype -type text        -x0 10 -y0 240 -text {[10]}
  register addtype -type signalvalue -x0 40 -y0 240 -radix %x \
    {system.RAM.Data_stored[10]}
  register addtype -type signalvalue -x0 100 -y0 240 -radix %s \
    {system.DisassemblyListing[10]}

  register addtype -type text        -x0 10 -y0 260 -text {[11]}
  register addtype -type signalvalue -x0 40 -y0 260 -radix %x \
    {system.RAM.Data_stored[11]}
  register addtype -type signalvalue -x0 100 -y0 260 -radix %s \
    {system.DisassemblyListing[11]}

  register addtype -type text        -x0 10 -y0 290 -text {[99]}
  register addtype -type signalvalue -x0 40 -y0 290 -radix %x \
    {system.RAM.Data_stored[99]}
  register addtype -type signalvalue -x0 100 -y0 290 -radix %s \
    {system.DisassemblyListing[99]}

  # =========================================================================
  register addtype -type line -x0 250 -y0 0 -x1 250 -y1 300 \
    -fill green
  # =========================================================================

  register addtype -type text        -x0 260 -y0 15 \
    -text {Memory (constants)} -fill red

  register addtype -type text        -x0 260 -y0 40 -text {[20]}
  register addtype -type signalvalue -x0 310 -y0 40 -radix %d \
    {system.RAM.Data_stored[20]}
  register addtype -type text        -x0 260 -y0 60 -text {[21]}
  register addtype -type signalvalue -x0 310 -y0 60 -radix %d \
    {system.RAM.Data_stored[21]}

  # =========================================================================
  register addtype -type line -x0 450 -y0 0 -x1 450 -y1 300 \
    -fill green
  # =========================================================================

  register addtype -type text        -x0 460 -y0 15 -text {Memory (data)} \
    -fill red

  register addtype -type text        -x0 460 -y0 40 -text {[256]}
  register addtype -type signalvalue -x0 510 -y0 40 -radix %d \
    {system.RAM.Data_stored[256]}
  register addtype -type text        -x0 460 -y0 60 -text {[257]}
  register addtype -type signalvalue -x0 510 -y0 60 -radix %d \
    {system.RAM.Data_stored[257]}
  register addtype -type text        -x0 460 -y0 80 -text {[258]}
  register addtype -type signalvalue -x0 510 -y0 80 -radix %d \
    {system.RAM.Data_stored[258]}
  register addtype -type text        -x0 460 -y0 100 -text {[259]}
  register addtype -type signalvalue -x0 510 -y0 100 -radix %d \
    {system.RAM.Data_stored[259]}

}

# =========================================================================
# Probe

  # Any signals included in register window but not in waveform window
  # should be probed

  probe -create -shm system.RAM.Data_stored
  probe -create -shm system.DisassemblyListing
# =========================================================================
