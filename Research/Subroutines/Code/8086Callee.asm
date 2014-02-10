adder PROC           ; Subroutine
      PUSH  bp       ; Push base ptr to stack
      MOV   bp,sp    ; Set base ptr to stack ptr
      ADD   bp,4     ; Move to arg2 in stack
      MOV   ax,[bp]  ; Load into working reg   
      ADD   bp,2     ; Move to arg1 in stack
      ADD   ax,[bp]  ; Add to contents of working reg 
      MOV   [bp],ax  ; Replace arg1 with result         
      POP   bp       ; Restore base ptr
      RET    
adder ENDP           
