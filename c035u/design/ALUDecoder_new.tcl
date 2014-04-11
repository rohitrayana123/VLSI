# SimVision command script ALUDecoder_new.tcl for ALUDecoder_new
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  ALUDecoder_new_stim.ASign
  ALUDecoder_new_stim.Cin
  ALUDecoder_new_stim.COut
  ALUDecoder_new_stim.imm4
  ALUDecoder_new_stim.LastCIn
  ALUDecoder_new_stim.nZ
  ALUDecoder_new_stim.OpCode
  ALUDecoder_new_stim.AND
  ALUDecoder_new_stim.C
  ALUDecoder_new_stim.CIn_slice
  ALUDecoder_new_stim.FAOut
  ALUDecoder_new_stim.LLI
  ALUDecoder_new_stim.N
  ALUDecoder_new_stim.NAND
  ALUDecoder_new_stim.NOR
  ALUDecoder_new_stim.NOT
  ALUDecoder_new_stim.OR
  ALUDecoder_new_stim.Sh1
  ALUDecoder_new_stim.Sh2
  ALUDecoder_new_stim.Sh4
  ALUDecoder_new_stim.Sh8
  ALUDecoder_new_stim.ShB
  ALUDecoder_new_stim.ShInBit
  ALUDecoder_new_stim.ShL
  ALUDecoder_new_stim.ShOut
  ALUDecoder_new_stim.ShR
  ALUDecoder_new_stim.SUB
  ALUDecoder_new_stim.V
  ALUDecoder_new_stim.XOR
  ALUDecoder_new_stim.Z
  ALUDecoder_new_stim.ZeroA
  ALUDecoder_new_stim.instance1.ABC
  ALUDecoder_new_stim.instance1.ABnC
  ALUDecoder_new_stim.instance1.AnBC
  ALUDecoder_new_stim.instance1.AnBnC
  ALUDecoder_new_stim.instance1.nA
  ALUDecoder_new_stim.instance1.nB
  ALUDecoder_new_stim.instance1.nC
  ALUDecoder_new_stim.instance1.nD
  ALUDecoder_new_stim.instance1.nE
  ALUDecoder_new_stim.instance1.ShSign
  ALUDecoder_new_stim.instance1.UseC
}

# View Results
#
window new WaveWindow -name "Waves for magic cell ALUDecoder_new"
waveform add -using "Waves for magic cell ALUDecoder_new" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell ALUDecoder_new" -outfull

}

