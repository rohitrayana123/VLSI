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
  system.nIRQ
  system.ALE
  system.RnW
  system.Address
  system.Data
  system.cpu.Data_in
  system.cpu.Data_out
  system.cpu.CPU_core.MemEn
  system.cpu.ENB
  system.cpu.CPU_core.datapath.SysBus
  system.cpu.CPU_core.control.state
  system.cpu.CPU_core.control.fetchSub
  system.cpu.CPU_core.control.Opcode
  system.cpu.CPU_core.ImmSel
  system.cpu.CPU_core.CFlag
  system.cpu.CPU_core.Flags
  system.cpu.CPU_core.control.StatusReg
  system.cpu.CPU_core.control.StatusRegWe
  system.cpu.CPU_core.Op1Sel
  system.cpu.CPU_core.datapath.a.Op1
  system.cpu.CPU_core.Op2Sel
  system.cpu.CPU_core.datapath.a.Op2
  system.cpu.CPU_core.AluOp
  system.cpu.CPU_core.datapath.a.Result
  system.cpu.CPU_core.AluEn
  system.cpu.CPU_core.AluWe
  system.cpu.CPU_core.datapath.Reg_ALUOUT.DataOut
  system.cpu.CPU_core.IrWe
  system.cpu.CPU_core.datapath.Reg_IR.DataOut
  system.cpu.CPU_core.LrEn
  system.cpu.CPU_core.LrSel
  system.cpu.CPU_core.LrWe
  system.cpu.CPU_core.datapath.Reg_LR.DataOut
  system.cpu.CPU_core.PcWe
  system.cpu.CPU_core.PcEn
  system.cpu.CPU_core.datapath.Reg_PC.DataOut
  system.cpu.CPU_core.Rs1Sel
  system.cpu.CPU_core.SpEn
  system.cpu.CPU_core.SpWe
  system.cpu.CPU_core.datapath.Reg_SP.Dataout
  system.cpu.CPU_core.WdSel
  system.cpu.CPU_core.datapath.regBlock.Rs1
  system.cpu.CPU_core.datapath.regBlock.Rs2
  system.cpu.CPU_core.datapath.regBlock.regs
  system.cpu.CPU_core.datapath.regBlock.Rd1
  system.cpu.CPU_core.datapath.regBlock.Rd2
  system.cpu.CPU_core.RegWe
  system.cpu.CPU_core.datapath.regBlock.Rw
  system.cpu.CPU_core.datapath.regBlock.WData
  system.RAM.Data_stored
}

# View Results
#
window new WaveWindow -name "Waves for magic cell bitslice"
waveform add -using "Waves for magic cell bitslice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell bitslice" -outfull

}

