# SimVision command script Pc_slice.tcl for Pc_slice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  Pc_slice_stim.ALU
  Pc_slice_stim.LrEn
  Pc_slice_stim.LrSel
  Pc_slice_stim.LrWe
  Pc_slice_stim.PcEn
  Pc_slice_stim.PcIncCin
  Pc_slice_stim.PCI_Value
  Pc_slice_stim.PcSel
  Pc_slice_stim.PcWe
  Pc_slice_stim.Pc
  Pc_slice_stim.PcIncCout
  Pc_slice_stim.SysBus
  Pc_slice_stim.pc.Lr
  Pc_slice_stim.pc.Pc1
  Pc_slice_stim.Clock
  Pc_slice_stim.pc.\mux2_4/Clock
  Pc_slice_stim.nReset
  Pc_slice_stim.Test
}

# View Results
#
window new WaveWindow -name "Waves for magic cell Pc_slice"
waveform add -using "Waves for magic cell Pc_slice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell Pc_slice" -outfull

}

