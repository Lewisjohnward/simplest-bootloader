;
; A simple boot sector program that demonstrates addressing
;

mov ah, 0x0e ; int 10/ah = 0eh => scrolling teletype BIOS routine

; First attempt
mov al, the_secret
int 0x10            ; Does this print an X?
                    ; No, loads the offset 
                    ; but not the character

; Second attempt
mov al, [the_secret] ; Does this print an X?
int 0x10             ; No, CPU treats the offset
                     ; as though it was from
                     ; the start of memory,
                     ; rather than start
                     ; address of loaded code

; Third attempt
mov bx, the_secret   ; Does this print an X?
add bx, 0x7c00       ; Yes, memory location
mov al, [bx]         ; is correct
int 0x10        

; Fourth attempt
mov al, [0x7c1e]
int 0x10             ; Does this print an X?
                     ; Yes, memory location
                     ; is correct

jmp $

the_secret:
  db "X"

; Padding and magic boot sector number
times 510-($-$$) db 0
dw 0xaa55

