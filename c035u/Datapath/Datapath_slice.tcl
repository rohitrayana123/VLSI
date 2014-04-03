# SimVision command script Datapath_slice.tcl for Datapath_slice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  Datapath_slice_stim.AluOut
#  Datapath_slice_stim.AND
#  Datapath_slice_stim.CIn_Slice
#  Datapath_slice_stim.FAOut
  Datapath_slice_stim.Imm
  Datapath_slice_stim.LrEn
  Datapath_slice_stim.LrSel
  Datapath_slice_stim.LrWe
#  Datapath_slice_stim.NAND
#  Datapath_slice_stim.NOR
#  Datapath_slice_stim.NOT
#  Datapath_slice_stim.nZ_prev
  Datapath_slice_stim.Op1Sel
  Datapath_slice_stim.Op2Sel
#  Datapath_slice_stim.OR
  Datapath_slice_stim.PcEn
  Datapath_slice_stim.PcIncCin
  Datapath_slice_stim.PcSel
  Datapath_slice_stim.PcWe
  Datapath_slice_stim.Rs1
  Datapath_slice_stim.Rs2
  Datapath_slice_stim.Rw
#  Datapath_slice_stim.Sh1
#  Datapath_slice_stim.Sh1_L_In
#  Datapath_slice_stim.Sh1_R_in
#  Datapath_slice_stim.Sh2
#  Datapath_slice_stim.Sh2B_R
#  Datapath_slice_stim.Sh2C_L
#  Datapath_slice_stim.Sh4
#  Datapath_slice_stim.Sh4C_R
#  Datapath_slice_stim.Sh4D_L
#  Datapath_slice_stim.Sh8
#  Datapath_slice_stim.Sh8H_L
#  Datapath_slice_stim.Sh8H_R
#  Datapath_slice_stim.ShB
#  Datapath_slice_stim.ShL
#  Datapath_slice_stim.ShOut
#  Datapath_slice_stim.ShR
#  Datapath_slice_stim.SUB
  Datapath_slice_stim.WdSel
#  Datapath_slice_stim.XOR
#  Datapath_slice_stim.ZeroA
  Datapath_slice_stim.A
#  Datapath_slice_stim.COut
#  Datapath_slice_stim.nZ
  Datapath_slice_stim.PcIncCout
#  Datapath_slice_stim.Sh1_L_Out
#  Datapath_slice_stim.Sh1_R_Out
#  Datapath_slice_stim.Sh2A_L
#  Datapath_slice_stim.Sh2Z_R
#  Datapath_slice_stim.Sh4Y_L
#  Datapath_slice_stim.Sh4Z_L
#  Datapath_slice_stim.Sh8Z_L
#  Datapath_slice_stim.Sh8Z_R
#  Datapath_slice_stim.Sum
  Datapath_slice_stim.SysBus
  Datapath_slice_stim.ds.B
  Datapath_slice_stim.ds.Pc
  Datapath_slice_stim.ds.Rd1
  Datapath_slice_stim.ds.Rd2
}

# View Results
#
window new WaveWindow -name "Waves for magic cell Datapath_slice"
waveform add -using "Waves for magic cell Datapath_slice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell Datapath_slice" -outfull

}

