# SimVision command script Datapath_slice.tcl for Datapath_slice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  Datapath_slice_stim.AluOut
  Datapath_slice_stim.Imm
  Datapath_slice_stim.LrEn
  Datapath_slice_stim.LrSel
  Datapath_slice_stim.LrWe
  Datapath_slice_stim.Op1Sel
  Datapath_slice_stim.Op2Sel
  Datapath_slice_stim.PcEn
  Datapath_slice_stim.PcIncCin
  Datapath_slice_stim.PcSel
  Datapath_slice_stim.PcWe
  Datapath_slice_stim.Rs1
  Datapath_slice_stim.Rs2
  Datapath_slice_stim.Rw
  Datapath_slice_stim.WdSel
  Datapath_slice_stim.PcIncCout
  Datapath_slice_stim.SysBus
  Datapath_slice_stim.ds.B
  Datapath_slice_stim.ds.Pc
  Datapath_slice_stim.ds.Rd1
  Datapath_slice_stim.ds.Rd2
  Datapath_slice_stim.ds.Regs
  Datapath_slice_stim.Clock
  Datapath_slice_stim.ds.WData
  Datapath_slice_stim.nReset
}

# View Results
#
window new WaveWindow -name "Waves for magic cell Datapath_slice"
waveform add -using "Waves for magic cell Datapath_slice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell Datapath_slice" -outfull

}

