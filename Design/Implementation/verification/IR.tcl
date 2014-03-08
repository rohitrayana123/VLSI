# SimVision command script Ir.tcl for Ir
# created by ext2svmod 5.5

database -open waves
probe -all -depth all -database waves
run

simvision {

# List of signals to monitor defined here
#
set wave_signal_list {
  Ir_stim.Clock
  Ir_stim.ImmSel
  Ir_stim.IrWe
  Ir_stim.nReset
  Ir_stim.SDI
  Ir_stim.SysBus
  Ir_stim.Test
  Ir_stim.Imm
  Ir_stim.Ir
}

# View Results
#
window new WaveWindow -name "Waves for magic cell Ir"
waveform add -using "Waves for magic cell Ir" -signals $wave_signal_list
waveform xview zoom -using "Waves for magic cell Ir" -outfull

}

