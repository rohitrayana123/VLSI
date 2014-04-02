# SimVision command script Pc_Block.tcl for Pc_Block
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  Pc_Block_stim.Clock
  Pc_Block_stim.LrEn
  Pc_Block_stim.LrSel
  Pc_Block_stim.LrWe
  Pc_Block_stim.nReset
  Pc_Block_stim.PcIncCin
  Pc_Block_stim.PcSel
  Pc_Block_stim.Test
  Pc_Block_stim.PcIncCout
  Pc_Block_stim.Scan
}

# View Results
#
window new WaveWindow -name "Waves for magic cell Pc_Block"
waveform add -using "Waves for magic cell Pc_Block" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell Pc_Block" -outfull

}

