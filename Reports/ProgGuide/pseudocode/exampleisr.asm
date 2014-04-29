LUI 	R7, #7 		;set up stack pointer
LLI 	R7, #208
ENAI			;enable the interrupts
BR .main 		;go to main
.isr	STF	;store flags
	PUSH R0 ;free some registers to use
	PUSH R1
	PUSH R2
	;clear interrupt source
	ENAI 	;enable interrupts
	;process data if necessary
	POP R2 	;restore the registers in reverse order
	POP R1
	POP R0
	LDF	;load the flags
	RETI	;end of the ISR

