adder PROC           ; Subroutine   
      PUSH  bp          ; Push base ptr to stack
      MOV   bp,sp       ; Set base ptr to stack ptr  
      SUB   sp,4        ; Allocate local variable space (2 ints)
      MOV   ax,[bp+4]   ; Load arg1 into Working 
      MOV   [bp-2],ax   ; Load arg1 into Local1   
      MOV   ax,[bp+6]   ; Load arg2 into Working     
      ADD   ax,[bp-2]   ; Add to contents of working reg 
      MOV   [bp-4],ax   ; Write Local2 with result 
      MOV   sp,bp       ; Return stack ptr 
      POP   bp          ; Restore base ptr
      RET               ; Done
adder ENDP                 
