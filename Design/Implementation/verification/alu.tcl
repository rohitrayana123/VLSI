# SimVision command script bitslice.tcl for bitslice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves


simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  alu_stim.Op1
  alu_stim.Op2
  alu_stim.AluOp
  alu_stim.Result
  alu_stim.Flags
  alu_stim.CarryIn
}

# View Results
#
window new WaveWindow -name "Waves for ALU"
waveform add -using "Waves for ALU" -signals $wave_signal_list
waveform xview zoom -using "Waves for ALU" -outfull

}

