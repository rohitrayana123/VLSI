		; Init
		LUI SP, #7		; Setup SP
		LLI SP, #255
		
		; Read data		
		LUI R0, #8		; Address in R0
		LLI R0, #0
		LDW R0,[R0,#0]	; Read switches into R0
		
		; Generate forever
		LUI R1, #8
		LLI R1, #1		; Address of LEDS
		PUSH R0
.loop	BWL .rand		; 1 		
		BWL .rand		; 2 
		BWL .rand		; 3 
		BWL .rand		; 4 
		BWL .rand		; 5 
		BWL .rand		; 6 
		BWL .rand		; 7 
		BWL .rand		; 8 
		BWL .rand		; 9 
		BWL .rand		; 10 
		BWL .rand		; 11 
		BWL .rand		; 12 
		BWL .rand		; 13 
		BWL .rand		; 14 
		BWL .rand		; 15 
		BWL .rand		; 16
		LDW R0,[SP,#0]	; No POP as re-run
		STW R0,[R1,#0]	; Result on LEDS
		BR .loop


		; Linear feedback shift register sim
.rand 	LDW R2,[SP,#0]
		LUI R3,#0		; Three
		LLI R3,#3
		AND R4,R3,R2	; Bottom two bits of input
		LSR R5,R2,#1	
		CMP R4,R3		; Three
		BE .done
		SUB R3,R3,R3
		CMP R4,R3		; Zero
		BE .done
		LUI R3,#128
		LLI R3,#0
		OR R5,R5,R3		
.done	STW R5,[SP,#0]
		RET
