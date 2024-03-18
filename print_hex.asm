print_hex:
  mov bl, 0xE

  ;print upper 4 bits
  mov al, bl
  shr al, 4 ; remove the lower 4 bits
  add al, 0x30 ; ascii 0 starts here
  int 0x10

  ; print lower 4 bits
  mov al, bl
  and al, 0x0F
  ; shl al, 12
  ; shr al, 12
  ; shl al, 1 ; double
  ; mov cl, 0x30
  ; add al, cl

  cmp al, 0x9
  jg print_letter
  jmp print_number
  ;
  print_letter:
  add al, 0x37 ; ascii 0 starts here
  jmp print
  ;   int 0x10
  print_number:
  add al, 0x30
  print:
  ;print upper byte
  ;shr al, 4 ; remove the lower 4 bits
  ;add al, 0x30 ; ascii 0 starts here
  int 0x10




  ret
