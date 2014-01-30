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
    system.Processor.Address
    system.Processor.DataBus
    system.Processor.Mem_Write
    } "Waves for a Simple CISC Style Microprocessor"

  window  geometry  "Waves for a Simple CISC Style Microprocessor"  1010x325+50+25

  # =========================================================================
  # Register Window (based on xfig file)

  ecsReadFig system.fig "Architecture View for a Simple CISC Style Microprocessor" "Architecture"

  # =========================================================================
  # Register Window

  # Open new register window

  window new RegisterWindow  -name  "Memory View for a Simple CISC Style Microprocessor"
  window  geometry  "Memory View for a Simple CISC Style Microprocessor"  700x415+0+350
  register  using  "Memory View for a Simple CISC Style Microprocessor"

  # Add signal values (specified location and format)
  
  # =========================================================================
  register addtype -type text        -x0 10 -y0 15 -text {Memory (code)} \
    -fill red

  register addtype -type text        -x0 10 -y0 40 -text {[0]}
  register addtype -type signalvalue -x0 40 -y0 40 -radix %x \
    {system.Processor.Memory.Data_stored[0]}

  register addtype -type text        -x0 10 -y0 60 -text {[1]}
  register addtype -type signalvalue -x0 40 -y0 60 -radix %x \
    {system.Processor.Memory.Data_stored[1]}

  register addtype -type text        -x0 10 -y0 80 -text {[2]}
  register addtype -type signalvalue -x0 40 -y0 80 -radix %x \
    {system.Processor.Memory.Data_stored[2]}

  register addtype -type text        -x0 10 -y0 100 -text {[3]}
  register addtype -type signalvalue -x0 40 -y0 100 -radix %x \
    {system.Processor.Memory.Data_stored[3]}

  register addtype -type text        -x0 10 -y0 120 -text {[4]}
  register addtype -type signalvalue -x0 40 -y0 120 -radix %x \
    {system.Processor.Memory.Data_stored[4]}

  register addtype -type text        -x0 10 -y0 140 -text {[5]}
  register addtype -type signalvalue -x0 40 -y0 140 -radix %x \
    {system.Processor.Memory.Data_stored[5]}

  register addtype -type text        -x0 10 -y0 160 -text {[6]}
  register addtype -type signalvalue -x0 40 -y0 160 -radix %x \
    {system.Processor.Memory.Data_stored[6]}

  register addtype -type text        -x0 10 -y0 180 -text {[7]}
  register addtype -type signalvalue -x0 40 -y0 180 -radix %x \
    {system.Processor.Memory.Data_stored[7]}

  register addtype -type text        -x0 10 -y0 200 -text {[8]}
  register addtype -type signalvalue -x0 40 -y0 200 -radix %x \
    {system.Processor.Memory.Data_stored[8]}

  register addtype -type text        -x0 10 -y0 220 -text {[9]}
  register addtype -type signalvalue -x0 40 -y0 220 -radix %x \
    {system.Processor.Memory.Data_stored[9]}

  # =========================================================================
  register addtype -type line -x0 250 -y0 0 -x1 250 -y1 270 \
    -fill green
  # =========================================================================

  register addtype -type text        -x0 260 -y0 15 -text {Memory (data)} \
    -fill red

  register addtype -type text        -x0 260 -y0 40 -text {[150]}
  register addtype -type signalvalue -x0 310 -y0 40 -radix %d \
    {system.Processor.Memory.Data_stored[150]}
  register addtype -type text        -x0 260 -y0 60 -text {[151]}
  register addtype -type signalvalue -x0 310 -y0 60 -radix %d \
    {system.Processor.Memory.Data_stored[151]}
  register addtype -type text        -x0 260 -y0 80 -text {[152]}
  register addtype -type signalvalue -x0 310 -y0 80 -radix %d \
    {system.Processor.Memory.Data_stored[152]}
  register addtype -type text        -x0 260 -y0 100 -text {[153]}
  register addtype -type signalvalue -x0 310 -y0 100 -radix %d \
    {system.Processor.Memory.Data_stored[153]}

  register addtype -type text        -x0 260 -y0 140 -text {[200-204]}
  register addtype -type signalvalue -x0 340 -y0 140 -radix %d \
    {system.Processor.Memory.Data_stored[200]}
  register addtype -type signalvalue -x0 400 -y0 140 -radix %d \
    {system.Processor.Memory.Data_stored[201]}
  register addtype -type signalvalue -x0 460 -y0 140 -radix %d \
    {system.Processor.Memory.Data_stored[202]}
  register addtype -type signalvalue -x0 520 -y0 140 -radix %d \
    {system.Processor.Memory.Data_stored[203]}
  register addtype -type signalvalue -x0 580 -y0 140 -radix %d \
    {system.Processor.Memory.Data_stored[204]}

  register addtype -type text        -x0 260 -y0 180 -text {[210-214]}
  register addtype -type signalvalue -x0 340 -y0 180 -radix %d \
    {system.Processor.Memory.Data_stored[210]}
  register addtype -type signalvalue -x0 400 -y0 180 -radix %d \
    {system.Processor.Memory.Data_stored[211]}
  register addtype -type signalvalue -x0 460 -y0 180 -radix %d \
    {system.Processor.Memory.Data_stored[212]}
  register addtype -type signalvalue -x0 520 -y0 180 -radix %d \
    {system.Processor.Memory.Data_stored[213]}
  register addtype -type signalvalue -x0 580 -y0 180 -radix %d \
    {system.Processor.Memory.Data_stored[214]}

  register addtype -type text        -x0 260 -y0 220 -text {[220-224]}
  register addtype -type signalvalue -x0 340 -y0 220 -radix %d \
    {system.Processor.Memory.Data_stored[220]}
  register addtype -type signalvalue -x0 400 -y0 220 -radix %d \
    {system.Processor.Memory.Data_stored[221]}
  register addtype -type signalvalue -x0 460 -y0 220 -radix %d \
    {system.Processor.Memory.Data_stored[222]}
  register addtype -type signalvalue -x0 520 -y0 220 -radix %d \
    {system.Processor.Memory.Data_stored[223]}
  register addtype -type signalvalue -x0 580 -y0 220 -radix %d \
    {system.Processor.Memory.Data_stored[224]}

}

# =========================================================================
# Probe

  # Any signals included in register window but not in waveform window
  # should be probed

  probe -create -shm system.Processor.Memory.Data_stored
# =========================================================================
