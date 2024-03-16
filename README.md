a simple bootloader. The following command generates the bootloader using the nasm assembler

```
nasm boot_sect.asm -f bin -o boot_sect.bin
```

To see exactly what bytes the assembler created

```
od -t x1 -A n boot_sect.bin
```
