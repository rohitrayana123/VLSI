# SimVision command script datapath.tcl for datapath
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  datapath_stim.AluEn
  datapath_stim.AluWe
  datapath_stim.CFlag
  datapath_stim.Clock
  datapath_stim.DataIn
  datapath_stim.ImmSel
  datapath_stim.IrWe
  datapath_stim.LrEn
  datapath_stim.LrSel
  datapath_stim.LrWe
  datapath_stim.MemEn
  datapath_stim.nReset
  datapath_stim.Op1Sel
  datapath_stim.Op2Sel
  datapath_stim.PcEn
  datapath_stim.PcSel
  datapath_stim.PcWe
  datapath_stim.RegWe
  datapath_stim.Rs1Sel
  datapath_stim.RwSel
  datapath_stim.SDI
  datapath_stim.Test
  datapath_stim.WdSel
  datapath_stim.Flags
  datapath_stim.Ir
  datapath_stim.SDO
  datapath_stim.SysBus
  datapath_stim.instance1.Pc
  datapath_stim.instance1.AluOut
  datapath_stim.instance1.reg0
  datapath_stim.instance1.reg1
  datapath_stim.instance1.reg2
  datapath_stim.instance1.reg3
  datapath_stim.instance1.reg4
  datapath_stim.instance1.reg5
  datapath_stim.instance1.reg6
  datapath_stim.instance1.Rd2
  datapath_stim.instance1.Rd1
  datapath_stim.instance1.ImmProbe
}

# View Results
#
window new WaveWindow -name "Waves for magic cell datapath"
waveform add -using "Waves for magic cell datapath" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell datapath" -outfull

}

