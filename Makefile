# $@ = target file
# $< = first dependency
# $^ = all dependencies

# First rule is the one executed when no parameters are fed to the Makefile
all: run

run: os-image.bin
		qemu-system-i386 -fda $<

os-image.bin: boot_sect.bin kernel.bin
		cat $^ > $@


# Notice how dependencies are built as needed
kernel.bin: kernel_entry.o kernel.o
		ld -o $@ -m elf_i386 -Ttext 0x1000 $^ --oformat binary

kernel.o: kernel.c
		gcc -m32 -fno-pie -ffreestanding -c $< -o $@

kernel_entry.o: kernel_entry.asm
		nasm $< -f elf -o $@

# Rule to disassemble the kernel - may be useful to debug
kernel.dis: kernel.bin
		ndisasm -b 32 $< > $@

boot_sect.bin: boot_sect.asm
		nasm $< -f bin -o $@

clean:
		rm *.bin *.o *.dis
