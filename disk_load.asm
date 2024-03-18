; load DH sectors to ES:BX from drive DL
disk_load:
  push dx        ; Store DX on stack to recall
                 ; how many sectors were 
                 ; requested

  mov ah, 0x02   ; BIOS read sector function
  mov al, dh     ; Read DH sectors
  mov ch, 0x00   ; Select cylinder 0
  mov dh, 0x00   ; Select head 0
  mov cl, 0x02   ; Start reading from 2nd sector

  int 0x13       ; BIOS interrupt

  mov bx, DEBUG_STRING
  call print_string

  jc disk_error  ; Jump if error (carry flag set)

  pop dx         ; Restore DX from the stack
  cmp dh, al     ; if AL (sectors read) != DH (sectors expected) display error message
  jne disk_error
  ret

  disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    jmp $

  DISK_ERROR_MSG db "Disk read error!", 0
  DEBUG_STRING db "debug", 0

