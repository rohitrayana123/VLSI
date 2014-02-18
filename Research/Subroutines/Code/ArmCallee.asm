adder PUSH  lr             ; Link register holds return address
      SUB   sp,sp,#4       ; Make space for locals on the stack
      LDR   r0, [sp,#12]   ; Get arg1 off stack
      LDR   r1, [sp,#8]    ; Get arg2 off stack
      ADD   r0,r0,r1       ; Do the add
      STR   r0,[sp,#0]     ; Store the add as a local
      ADD   sp,sp,#4       ; Destroy local variable space
      POP   pc             ; Restore program counter and return 
