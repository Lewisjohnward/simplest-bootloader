;
; A simple boot sector program that demonstrates the stack
;

[org 0x7c00] ; This removes the need
             ; to add the offset

mov ah, 0x0e ; int 10/ah = 0eh => scrolling teletype BIOS routine

mov bx, BOOTING
call print_string

jmp $

%include "print_string.asm"

BOOTING:
  db "Booting LewOS", 0

; Padding and magic boot sector number
times 510-($-$$) db 0
dw 0xaa55

