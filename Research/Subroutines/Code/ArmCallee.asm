adder PUSH  lr             ; Link register holds return address
      LDR   r0, [sp,#12]   ; Get arg1 off stack
      LDR   r1, [sp,#8]    ; Get arg2 off stack
      ADD   r0,r1          ; Do the add
      STR   [sp,#12], r0   ; Replace arg1 on the stack
      POP   pc             ; Restore program counter and return 
