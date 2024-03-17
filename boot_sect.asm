;
; A simple boot sector program that demonstrates addressing
;

[org 0x7c00] ; This removes the need
             ; to add the offset

mov ah, 0x0e ; int 10/ah = 0eh => scrolling teletype BIOS routine


mov bx, my_string
mov al, [bx]
printchar:
  int 0x10        
  mov cx, 1
  add bx, cx
  mov al, [bx]
  cmp al, 0
  jne printchar

spin:
  jmp $

my_string:
  db "Booting LewOS", 0

; Padding and magic boot sector number
times 510-($-$$) db 0
dw 0xaa55

