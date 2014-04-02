# SimVision command script regBlock_decoder.tcl for regBlock_decoder
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  regBlock_decoder_stim.AluOR
  regBlock_decoder_stim.Cin
  regBlock_decoder_stim.Ir
  regBlock_decoder_stim.Rs1In
  regBlock_decoder_stim.Rs2In
  regBlock_decoder_stim.RwIn
  regBlock_decoder_stim.We
  regBlock_decoder_stim.AluBin
  regBlock_decoder_stim.AluOp
  regBlock_decoder_stim.Rs1
  regBlock_decoder_stim.Rs2
  regBlock_decoder_stim.Rw
}

# View Results
#
window new WaveWindow -name "Waves for magic cell regBlock_decoder"
waveform add -using "Waves for magic cell regBlock_decoder" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell regBlock_decoder" -outfull

}

