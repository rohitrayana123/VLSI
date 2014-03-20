# SimVision command script slice17.tcl for slice17
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  slice17_stim.Ir
  slice17_stim.RwSel
  slice17_stim.RegWe
  slice17_stim.AluOR
  slice17_stim.Cin
  slice17_stim.Flags
  slice17_stim.Rw
  slice17_stim.Rs1
  slice17_stim.Rs2
#  slice17_stim.ZeroA
#  slice17_stim.SUB
#  slice17_stim.CIn_slice
#  slice17_stim.LastCIn
#  slice17_stim.COut
#  slice17_stim.Flags[3]
#  slice17_stim.nZ
#  slice17_stim.FAOut
#  slice17_stim.AND
#  slice17_stim.OR
#  slice17_stim.XOR
#  slice17_stim.NOT
#  slice17_stim.NAND
#  slice17_stim.NOR
#  slice17_stim.ASign
#  slice17_stim.ShB
#  slice17_stim.ShL
#  slice17_stim.ShR
#  slice17_stim.Sh8
#  slice17_stim.Sh4
#  slice17_stim.Sh2
#  slice17_stim.SH1
#  slice17_stim.ShiftIn
#  slice17_stim.ShOut
#  slice17_stim.LLI
}

# View Results
#
window new WaveWindow -name "Waves for magic cell slice17"
waveform add -using "Waves for magic cell slice17" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell slice17" -outfull

}

