main  MOV   r0,#42   ; Load arg1
      MOV   r1,#69   ; Load arg2
      PUSH  r0       ; Push arg1 to stack
      PUSH  r1       ; Push arg2 to stack
      BL    adder    ; Branch to subroutine
      POP   r0       ; This line is held in the link register
      POP   r0       ; Result pop from arg1 spot
      BL    main 
