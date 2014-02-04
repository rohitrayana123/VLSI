org 100h

PUSH    DS

; set graphics mode:
; 13h 
; 320x200
; colors: 256
; mem start: A000
MOV AL, 13h
MOV AH, 0
INT 10h

MOV AX, 0A000h
MOV DS, AX

MOV DI, 0         
mov al, 0

mov cx, 255
next_pix:

MOV [DI], al

add di, 1
inc al

loop next_pix


; print star
;mov ah, 0ah
;mov al, '*'
;mov cx, 1
;mov bh, 0
;int 10h



readkey:
  mov ah,00
  int 16h			;wait for keypress
;==========================
end:
  mov ah,00			;again subfunc 0
  mov al,03			;text mode 3
  int 10h			;call int
  

POP DS

ret
