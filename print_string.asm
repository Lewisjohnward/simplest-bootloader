print_string:
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
