main:           ; Main loop  
   mov  ax,42   ; Load arg1
   mov  bx,69   ; Load arg2
   push ax      ; Push arg1 to stack
   push bx      ; Push arg2 to stack
   call adder   ; Call the subroutine  
   pop  ax      ; Dummy pop from arg2 spot
   pop  ax      ; Result pop from arg1 spot
   jmp main
adder proc      ; Subroutine
   push bp      ; Push base ptr to stack
   mov  bp,sp   ; Set base ptr to stack ptr
   add  bp,4    ; Move to arg2 in stack
   mov  ax,[bp] ; Load into working reg   
   add  bp,2    ; Move to arg1 in stack
   add  ax,[bp] ; Add to contents of working reg 
   mov  [bp],ax ; Replace arg1 with result         
   pop  bp      ; Restore base ptr
   ret    
adder endp           