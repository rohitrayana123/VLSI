main:                   ; Main loop   
      MOV   bp,sp       ; Init base ptr
      MOV   ax,42       ; Load arg1
      MOV   bx,69       ; Load arg2     
      PUSH  bx          ; Push arg1 to stack
      PUSH  ax          ; Push arg2 to stack
      CALL  adder       ; Call the subroutine    
      MOV   cx,[bp-12]  ; Access return value
      POP   ax          ; Restore all registers
      POP   bx
      JMP   main       
