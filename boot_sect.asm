;
; A simple boot sector program that demonstrates the stack
;

mov ah, 0x0e

mov al, [a]          ; Prints incorrectly
int 0x10

mov bx, 0x7c0        ; Can't set ds directly
mov ds, bx           ; so set bx then copy
mov al, [b]          ; bx to ds
int 0x10             ; prints b

mov al, [es:c]       ; Prints incorrectly
int 0x10

mov bx, 0x7c0        ; Prints d
mov es, bx
mov al, [es:d]
int 0x10

jmp $

a:
  db "a"
b:
  db "b"
c:
  db "c"
d:
  db "d"

; Padding and magic boot sector number
times 510-($-$$) db 0
dw 0xaa55

