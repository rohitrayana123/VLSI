main:           ; Main loop  
   mov  ax,42   ; Load arg1
   mov  bx,69   ; Load arg2
   push ax      ; Push arg1 to stack
   push bx      ; Push arg2 to stack
   call adder   ; Call the subroutine  
   pop  ax      ; Dummy pop from arg2 spot
   pop  ax      ; Result pop from arg1 spot
   jmp main          
