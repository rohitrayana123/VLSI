# SimVision command script datapath.tcl for datapath
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
#  datapath_stim.AluEn
#  datapath_stim.AluOR
#  datapath_stim.AluWe
#  datapath_stim.CFlag
#  datapath_stim.Clock
  datapath_stim.DataIn
#  datapath_stim.ImmSel
  datapath_stim.IrWe
#  datapath_stim.LrEn
#  datapath_stim.LrSel
#  datapath_stim.LrWe
  datapath_stim.MemEn
#  datapath_stim.nReset
#  datapath_stim.Op1Sel
#  datapath_stim.Op2Sel
#  datapath_stim.PcEn
#  datapath_stim.PcSel
#  datapath_stim.PcWe
#  datapath_stim.RegWe
#  datapath_stim.Rs1Sel
#  datapath_stim.RwSel
#  datapath_stim.SDI
#  datapath_stim.StatusReg
#  datapath_stim.StatusRegEn
#  datapath_stim.Test
#  datapath_stim.WdSel
  datapath_stim.DataOut
#  datapath_stim.Flags
  datapath_stim.Ir
#  datapath_stim.SDO
#  datapath_stim.instance1.Aluout
  datapath_stim.d.Rs1
  datapath_stim.d.Rs2
  datapath_stim.d.Rw
  datapath_stim.d.ImmProbe
  datapath_stim.d.AluRegOut
  datapath_stim.d.AluOut
  datapath_stim.d.Lr
  datapath_stim.d.Pc
  datapath_stim.d.PcPlus1
  datapath_stim.d.WD
  datapath_stim.d.reg0
}
# View Results
  window new WaveWindow -name "Waves for magic cell datapath"
  waveform add -using "Waves for magic cell datapath" -signals $wave_signal_list
  waveform xview zoom -using "Waves for magic cell datapath" -outfull

#Register window
  window new RegisterWindow -name "GPR Register List"
  window geometry "GPR Register List" 460x275+0+500
  register using "GPR Register List"

#Register window signals
#  register add datapath_stim.d.reg0
#  register add datapath_stim.d.reg1
#  register add datapath_stim.d.reg2
#  register add datapath_stim.d.reg3
#  register add datapath_stim.d.reg4
#  register add datapath_stim.d.reg5
#  register add datapath_stim.d.reg6
#  register add datapath_stim.d.reg7

#Signal Values
  register addtype -type signalvalue -x0 100 -y0 15 -radix %d datapath_stim.d.reg0
  register addtype -type signalvalue -x0 100 -y0 30 -radix %d datapath_stim.d.reg1
  register addtype -type signalvalue -x0 100 -y0 45 -radix %d datapath_stim.d.reg2
  register addtype -type signalvalue -x0 100 -y0 60 -radix %d datapath_stim.d.reg3
  register addtype -type signalvalue -x0 100 -y0 75 -radix %d datapath_stim.d.reg4
  register addtype -type signalvalue -x0 100 -y0 90 -radix %d datapath_stim.d.reg5
  register addtype -type signalvalue -x0 100 -y0 105 -radix %d datapath_stim.d.reg6
  register addtype -type signalvalue -x0 100 -y0 120 -radix %d datapath_stim.d.reg7

#Shapes and text
  register addtype -type text -x0 60 -y 15 -text {R0}
  register addtype -type text -x0 60 -y 30 -text {R1}
  register addtype -type text -x0 60 -y 45 -text {R2}
  register addtype -type text -x0 60 -y 60 -text {R3}
  register addtype -type text -x0 60 -y 75 -text {R4}
  register addtype -type text -x0 60 -y 90 -text {R5}
  register addtype -type text -x0 60 -y 105 -text {R6}
  register addtype -type text -x0 60 -y 120 -text {R7}
  register addtype -type rectangle -x0 50 -y0 5 -x1 110 -y1 130 -outline green
}

