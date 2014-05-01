LUI 	SP,#7
LLI 	SP,#208		; Set SP to 0x07D0
PUSH 	R0			; R0 written to address 0x07CF
PUSH 	R1			; R1 written to address 0x07CE
LDW 	R0,[SP,#0]	; R0 = Mem[0x07CE] (R1 initially)
LDW 	R1,[SP,#1]	; R1 = Mem[0x07CF] (R0 initially)
POP 	R1			; SP moves to 0x07CF
POP 	R0			; SP moves to 0x07D0

