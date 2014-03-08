# SimVision command script ALUDecoder.tcl for ALUDecoder
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  ALUDecoder_stim.ASign
  ALUDecoder_stim.Cin
  ALUDecoder_stim.COut
  ALUDecoder_stim.imm4
  ALUDecoder_stim.LastCIn
  ALUDecoder_stim.nZ
  ALUDecoder_stim.OpCode
  ALUDecoder_stim.AND
  ALUDecoder_stim.C
  ALUDecoder_stim.CIn_slice
  ALUDecoder_stim.FAOut
  ALUDecoder_stim.LLI
  ALUDecoder_stim.N
  ALUDecoder_stim.NAND
  ALUDecoder_stim.NOR
  ALUDecoder_stim.NOT
  ALUDecoder_stim.OR
  ALUDecoder_stim.Sh1
  ALUDecoder_stim.Sh2
  ALUDecoder_stim.Sh4
  ALUDecoder_stim.Sh8
  ALUDecoder_stim.ShB
  ALUDecoder_stim.ShInBit
  ALUDecoder_stim.ShL
  ALUDecoder_stim.ShOut
  ALUDecoder_stim.ShR
  ALUDecoder_stim.SUB
  ALUDecoder_stim.V
  ALUDecoder_stim.XOR
  ALUDecoder_stim.Z
  ALUDecoder_stim.ZeroA
  ALUDecoder_stim.instance1.nA
  ALUDecoder_stim.instance1.nB
  ALUDecoder_stim.instance1.nC
  ALUDecoder_stim.instance1.nD
  ALUDecoder_stim.instance1.nE
  ALUDecoder_stim.instance1.ShSign
}

# View Results
#
window new WaveWindow -name "Waves for magic cell ALUDecoder"
waveform add -using "Waves for magic cell ALUDecoder" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell ALUDecoder" -outfull

}

