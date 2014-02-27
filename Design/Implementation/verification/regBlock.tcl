# SimVision command script bitslice.tcl for bitslice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves


simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  regBlock_stim.Clock
  regBlock_stim.nReset
  regBlock_stim.Rs1
  regBlock_stim.Rd1
  regBlock_stim.Rs2
  regBlock_stim.Rd2
  regBlock_stim.Rw
  regBlock_stim.WData
  regBlock_stim.RnW
  regBlock_stim.r.regs
}

# View Results
#
window new WaveWindow -name "Waves for regBlock"
waveform add -using "Waves for regBlock" -signals $wave_signal_list
waveform xview zoom -using "Waves for regBlock" -outfull

}

