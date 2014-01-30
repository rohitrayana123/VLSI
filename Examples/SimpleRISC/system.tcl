# =========================================================================
# system.tcl

database -open waves.shm -default

simvision {

  # =========================================================================
  # Source TCL routines used in processor simulation

  source /opt/cad/bim/fcde/tcl/routines.tcl
  source /opt/cad/bim/fcde/tcl/read_fig.tcl

  # =========================================================================
  # Wave Window

  ecsWaves  {
    system.Clock
    system.nReset
    system.Processor.AddressBus
    system.Processor.DataBus
    system.Processor.Mem_Write
    } "Waves for a Simple Microprocessor"

  window  geometry  "Waves for a Simple Microprocessor"  1010x325+50+25

  # =========================================================================
  # Register Window (based on xfig file)

  ecsReadFig system.fig "Architecture View for a Simple Microprocessor" "Architecture"

  # =========================================================================
  # Register Window

  # Open new register window

  window new RegisterWindow  -name  "Memory View for a Simple Microprocessor"
  window  geometry  "Memory View for a Simple Microprocessor"  700x415+0+350
  register  using  "Memory View for a Simple Microprocessor"

  # Add signal values (specified location and format)
  
  # =========================================================================

  register addtype -type text        -x0 10 -y0 15 -text {Memory (code)} \
    -fill red

  register addtype -type text        -x0 10 -y0 40 -text {[0]}
  register addtype -type signalvalue -x0 40 -y0 40 -radix %x \
    {system.Processor.Memory.Data_stored[0]}
  register addtype -type signalvalue -x0 100 -y0 40 -radix %s \
    {system.DisassemblyListing[0]}

  register addtype -type text        -x0 10 -y0 60 -text {[1]}
  register addtype -type signalvalue -x0 40 -y0 60 -radix %x \
    {system.Processor.Memory.Data_stored[1]}
  register addtype -type signalvalue -x0 100 -y0 60 -radix %s \
    {system.DisassemblyListing[1]}

  register addtype -type text        -x0 10 -y0 80 -text {[2]}
  register addtype -type signalvalue -x0 40 -y0 80 -radix %x \
    {system.Processor.Memory.Data_stored[2]}
  register addtype -type signalvalue -x0 100 -y0 80 -radix %s \
    {system.DisassemblyListing[2]}

  register addtype -type text        -x0 10 -y0 100 -text {[3]}
  register addtype -type signalvalue -x0 40 -y0 100 -radix %x \
    {system.Processor.Memory.Data_stored[3]}
  register addtype -type signalvalue -x0 100 -y0 100 -radix %s \
    {system.DisassemblyListing[3]}

  register addtype -type text        -x0 10 -y0 120 -text {[4]}
  register addtype -type signalvalue -x0 40 -y0 120 -radix %x \
    {system.Processor.Memory.Data_stored[4]}
  register addtype -type signalvalue -x0 100 -y0 120 -radix %s \
    {system.DisassemblyListing[4]}

  register addtype -type text        -x0 10 -y0 140 -text {[5]}
  register addtype -type signalvalue -x0 40 -y0 140 -radix %x \
    {system.Processor.Memory.Data_stored[5]}
  register addtype -type signalvalue -x0 100 -y0 140 -radix %s \
    {system.DisassemblyListing[5]}

  register addtype -type text        -x0 10 -y0 160 -text {[6]}
  register addtype -type signalvalue -x0 40 -y0 160 -radix %x \
    {system.Processor.Memory.Data_stored[6]}
  register addtype -type signalvalue -x0 100 -y0 160 -radix %s \
    {system.DisassemblyListing[6]}

  register addtype -type text        -x0 10 -y0 180 -text {[7]}
  register addtype -type signalvalue -x0 40 -y0 180 -radix %x \
    {system.Processor.Memory.Data_stored[7]}
  register addtype -type signalvalue -x0 100 -y0 180 -radix %s \
    {system.DisassemblyListing[7]}

  register addtype -type text        -x0 10 -y0 200 -text {[8]}
  register addtype -type signalvalue -x0 40 -y0 200 -radix %x \
    {system.Processor.Memory.Data_stored[8]}
  register addtype -type signalvalue -x0 100 -y0 200 -radix %s \
    {system.DisassemblyListing[8]}

  register addtype -type text        -x0 10 -y0 220 -text {[9]}
  register addtype -type signalvalue -x0 40 -y0 220 -radix %x \
    {system.Processor.Memory.Data_stored[9]}
  register addtype -type signalvalue -x0 100 -y0 220 -radix %s \
    {system.DisassemblyListing[9]}

  register addtype -type text        -x0 10 -y0 240 -text {[99]}
  register addtype -type signalvalue -x0 40 -y0 240 -radix %x \
    {system.Processor.Memory.Data_stored[99]}
  register addtype -type signalvalue -x0 100 -y0 240 -radix %s \
    {system.DisassemblyListing[99]}

  # =========================================================================
  register addtype -type line -x0 250 -y0 0 -x1 250 -y1 265 \
    -fill green
  # =========================================================================

  register addtype -type text        -x0 260 -y0 15 \
    -text {Memory (constants)} -fill red

  register addtype -type text        -x0 260 -y0 40 -text {[20]}
  register addtype -type signalvalue -x0 310 -y0 40 -radix %d \
    {system.Processor.Memory.Data_stored[20]}
  register addtype -type text        -x0 260 -y0 60 -text {[21]}
  register addtype -type signalvalue -x0 310 -y0 60 -radix %d \
    {system.Processor.Memory.Data_stored[21]}

  # =========================================================================
  register addtype -type line -x0 450 -y0 0 -x1 450 -y1 265 \
    -fill green
  # =========================================================================

  register addtype -type text        -x0 460 -y0 15 -text {Memory (data)} \
    -fill red

  register addtype -type text        -x0 460 -y0 40 -text {[22]}
  register addtype -type signalvalue -x0 510 -y0 40 -radix %d \
    {system.Processor.Memory.Data_stored[22]}
  register addtype -type text        -x0 460 -y0 60 -text {[23]}
  register addtype -type signalvalue -x0 510 -y0 60 -radix %d \
    {system.Processor.Memory.Data_stored[23]}
  register addtype -type text        -x0 460 -y0 80 -text {[24]}
  register addtype -type signalvalue -x0 510 -y0 80 -radix %d \
    {system.Processor.Memory.Data_stored[24]}
  register addtype -type text        -x0 460 -y0 100 -text {[25]}
  register addtype -type signalvalue -x0 510 -y0 100 -radix %d \
    {system.Processor.Memory.Data_stored[25]}

}

# =========================================================================
# Probe

  # Any signals included in register window but not in waveform window
  # should be probed

  probe -create -shm system.Processor.Memory.Data_stored
  probe -create -shm system.DisassemblyListing
# =========================================================================
