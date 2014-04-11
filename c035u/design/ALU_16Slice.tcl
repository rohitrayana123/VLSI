# SimVision command script ALU_16Slice.tcl for ALU_16Slice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  ALU_16Slice_stim.ALUEnable

  ALU_16Slice_stim.A
  ALU_16Slice_stim.B

  ALU_16Slice_stim.CIn
  ALU_16Slice_stim.SUB
  ALU_16Slice_stim.ZeroA
  ALU_16Slice_stim.FAOut

  ALU_16Slice_stim.AND
  ALU_16Slice_stim.OR
  ALU_16Slice_stim.XOR
  ALU_16Slice_stim.NOT
  ALU_16Slice_stim.NAND
  ALU_16Slice_stim.NOR

  ALU_16Slice_stim.ShSignIn
  ALU_16Slice_stim.Sh1
  ALU_16Slice_stim.Sh2
  ALU_16Slice_stim.Sh4
  ALU_16Slice_stim.Sh8
  ALU_16Slice_stim.ShB
  ALU_16Slice_stim.ShL
  ALU_16Slice_stim.ShR
  ALU_16Slice_stim.ShOut

  ALU_16Slice_stim.LLI

  ALU_16Slice_stim.ALUOut
  ALU_16Slice_stim.CIn_Slice
  ALU_16Slice_stim.COut
  ALU_16Slice_stim.nZ
  ALU_16Slice_stim.Sum
}

# View Results
#
window new WaveWindow -name "Waves for magic cell ALU_16Slice"
waveform add -using "Waves for magic cell ALU_16Slice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell ALU_16Slice" -outfull

}

