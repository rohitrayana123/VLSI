# SimVision command script bitslice.tcl for bitslice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves


simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  system.Clock
  system.nReset
  system.nOE
  system.nME
  system.nWE
  system.nIRQ
  system.ALE
  system.RnW
  system.Address
  system.Data
  system.CPU.Data_in
  system.CPU.Data_out
  system.CPU.CPU_core.MemEn
  system.CPU.ENB
  system.CPU.CPU_core.datapath.SysBus
  system.CPU.CPU_core.control.state
  system.CPU.CPU_core.control.fetchSub
  system.CPU.CPU_core.ImmSel
  system.CPU.CPU_core.CFlag
  system.CPU.CPU_core.Flags
  system.CPU.CPU_core.Op1Sel
  system.CPU.CPU_core.Op2Sel
  system.CPU.CPU_core.datapath.a.Op1
  system.CPU.CPU_core.datapath.a.Op2
  system.CPU.CPU_core.AluOp
  system.CPU.CPU_core.datapath.a.Result
  system.CPU.CPU_core.AluEn
  system.CPU.CPU_core.AluWe
  system.CPU.CPU_core.datapath.Reg_ALUOUT.DataOut
  system.CPU.CPU_core.IrWe
  system.CPU.CPU_core.datapath.Reg_IR.DataOut
  system.CPU.CPU_core.LrEn
  system.CPU.CPU_core.LrSel
  system.CPU.CPU_core.LrWe
  system.CPU.CPU_core.datapath.Reg_LR.DataOut
  system.CPU.CPU_core.PcWe
  system.CPU.CPU_core.PcEn
  system.CPU.CPU_core.datapath.Reg_PC.DataOut
  system.CPU.CPU_core.Rs1Sel
  system.CPU.CPU_core.SpEn
  system.CPU.CPU_core.SpWe
  system.CPU.CPU_core.datapath.Reg_SP.Dataout
  system.CPU.CPU_core.WdSel
  system.CPU.CPU_core.datapath.regBlock.Rs1
  system.CPU.CPU_core.datapath.regBlock.Rs2
  system.CPU.CPU_core.datapath.regBlock.regs
  system.CPU.CPU_core.datapath.regBlock.Rd1
  system.CPU.CPU_core.datapath.regBlock.Rd2
  system.CPU.CPU_core.RegWe
  system.CPU.CPU_core.datapath.regBlock.Rw
  system.CPU.CPU_core.datapath.regBlock.WData
  system.RAM.Data_stored
}

# View Results
#
window new WaveWindow -name "Waves for magic cell bitslice"
waveform add -using "Waves for magic cell bitslice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell bitslice" -outfull

}

