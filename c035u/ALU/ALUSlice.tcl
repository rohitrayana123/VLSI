# SimVision command script ALUSlice.tcl for ALUSlice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  ALUSlice_stim.A
  ALUSlice_stim.B
  ALUSlice_stim.SUB
  ALUSlice_stim.ZeroA
  ALUSlice_stim.CIn_Slice
  ALUSlice_stim.a.FA_1
  ALUSlice_stim.a.FA_2
  ALUSlice_stim.Sum
  ALUSlice_stim.COut
  ALUSlice_stim.ALUOut
  ALUSlice_stim.nZ_prev
  ALUSlice_stim.nZ
  ALUSlice_stim.FAOut

  ALUSlice_stim.AND
  ALUSlice_stim.OR
  ALUSlice_stim.XOR
  ALUSlice_stim.NOT
  ALUSlice_stim.NAND
  ALUSlice_stim.NOR

  ALUSlice_stim.ShL
  ALUSlice_stim.ShR
  ALUSlice_stim.ShB
  ALUSlice_stim.ShOut
  ALUSlice_stim.Sh8
  ALUSlice_stim.Sh4
  ALUSlice_stim.Sh2
  ALUSlice_stim.Sh1
  ALUSlice_stim.Sh8A_L
  ALUSlice_stim.Sh4A_L
  ALUSlice_stim.Sh2A_L
  ALUSlice_stim.Sh1_L_Out
  ALUSlice_stim.Sh8Z_R
  ALUSlice_stim.Sh4Z_R
  ALUSlice_stim.Sh2Z_R
  ALUSlice_stim.Sh1_R_Out
  ALUSlice_stim.ALUOut
}

# View Results
#
window new WaveWindow -name "Waves for magic cell ALUSlice"
waveform add -using "Waves for magic cell ALUSlice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell ALUSlice" -outfull

}

