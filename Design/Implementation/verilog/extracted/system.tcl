# SimVision command script bitslice.tcl for bitslice
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves


simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  system.LEDs
  system.switches
  system.Clock
  system.nReset
  system.nOE
  system.nME
  system.nIRQ
  system.ALE
  system.RnW
  system.Address
  system.Data
  system.CPU.Op
  system.CPU.state
  system.CPU.stateSub
  system.CPU.Ir
  system.CPU.Pc
  system.CPU.Operand1
  system.CPU.Operand2
  system.CPU.reg0
  system.CPU.reg1
  system.CPU.reg2
  system.CPU.reg3
  system.CPU.reg4
  system.CPU.reg5
  system.CPU.reg6
  system.CPU.reg7
  system.Dissembly
  system.RAM.Data_stored
}

# View Results
#
window new WaveWindow -name "Waves for magic cell bitslice"
waveform add -using "Waves for magic cell bitslice" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell bitslice" -outfull

}

