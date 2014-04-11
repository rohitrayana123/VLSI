# SimVision command script regBlock_slice.tcl for regBlock_slice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  regBlock_slice_stim.Rs1
  regBlock_slice_stim.Rs2
  regBlock_slice_stim.Rw
  regBlock_slice_stim.WData
  regBlock_slice_stim.Rd1
  regBlock_slice_stim.Rd2
  regBlock_slice_stim.instance1.Reg0
  regBlock_slice_stim.instance1.Reg1
  regBlock_slice_stim.instance1.Reg2
  regBlock_slice_stim.instance1.Reg3
  regBlock_slice_stim.instance1.Reg4
  regBlock_slice_stim.instance1.Reg5
  regBlock_slice_stim.instance1.Reg6
  regBlock_slice_stim.instance1.Reg7Out
}

# View Results
#
window new WaveWindow -name "Waves for magic cell regBlock_slice"
waveform add -using "Waves for magic cell regBlock_slice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell regBlock_slice" -outfull

}

