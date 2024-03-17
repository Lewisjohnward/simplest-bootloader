;
; A simple boot sector program that demonstrates the stack
;

mov ah, 0x0e ; int 10/ah = 0eh => scrolling teletype BIOS routine

mov bp, 0x8000 ; Set the base of the stack a little above where
mov sp, bp     ; the BIOS loads our boot sector - so it doesn't
               ; get overwritten

push 'A'       ; Push some chars on the stack for later
push 'B'       ; These are pushed on as 16-bit values, so
push 'C'       ; the most significant byte will be added 
               ; by the assembler as 0x00

pop bx         ; We can only pop 16-bits, so pop to bx
mov al, bl     ; then copy bl (i.e. 8-bit char) to al
int 0x10       ; print(al)

pop bx
mov al, bl
int 0x10

mov al, [0x7ffe] ; To prove the stack frows downwards from bp
int 0x10         ; fetch the char at 0x8000 - 0x2 (i.e. 16-bits)
                 ; and print
jmp $

; Padding and magic boot sector number
times 510-($-$$) db 0
dw 0xaa55

