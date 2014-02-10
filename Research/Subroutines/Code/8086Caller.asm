main:                ; Main loop  
      MOV   ax,42    ; Load arg1
      MOV   bx,69    ; Load arg2
      PUSH  ax       ; Push arg1 to stack
      PUSH  bx       ; Push arg2 to stack
      CALL  adder    ; Call the subroutine  
      POP   ax       ; Dummy pop from arg2 spot
      POP   ax       ; Result pop from arg1 spot
      JMP   main          
