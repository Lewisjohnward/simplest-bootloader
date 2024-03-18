print_string:
  mov ah, 0x0e ; int 10/ah = 0eh => scrolling teletype BIOS routine
  print_char:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10        
    mov cx, 1
    add bx, cx
    jmp print_char
  end:
    ret
