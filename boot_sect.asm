;
; A simple boot sector program that demonstrates addressing
;

[org 0x7c00] ; This removes the need
             ; to add the offset

mov ah, 0x0e ; int 10/ah = 0eh => scrolling teletype BIOS routine

mov bx, the_secret
mov al, [bx]
int 0x10        

jmp $

the_secret:
  db "X"

; Padding and magic boot sector number
times 510-($-$$) db 0
dw 0xaa55

