;
; A simple boot sector program that demonstrates the stack
;

[org 0x7c00]

mov [BOOT_DRIVE], dl ; BIOS stores out boot drive in dl
                     ; so best remember it


mov bp, 0x8000       ; Set the stack
mov sp, bp

mov bx, 0x9000       ; Load 5 sectors to 0x0000(ES):0x9000(BX)
mov dh, 5            ; from the boot disk
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]     ; Print out the first loaded word
;call print_hex


mov bx, TEST_STRING
call print_string


jmp $


%include "disk_load.asm"
%include "print_string.asm"

; Global variables
BOOT_DRIVE: db 0

TEST_STRING db "hello", 0

; Bootsector padding
times 510-($-$$) db 0
dw 0xaa55

; We know that BIOS will load only the first 512-byte sector
; from the disk, so if we purposely add a few more sectors
; to our code by repeating some familiar numbers, we can prove
; to ourselves that we actually loaded those additional two
; sectors from the disk we booted from

times 256 dw 0xdada
times 256 dw 0xface

