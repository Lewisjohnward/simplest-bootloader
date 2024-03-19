# $@ = target file
# $< = first dependency
# $^ = all dependencies

# Expand to a list of existing files that match patterns
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS  = $(wildcard kernel/*.h drivers/*.h)
# Create a list of object files to build, replace ".c" with ".o"
OBJ = ${C_SOURCES:.c=.o}

# First rule is the one executed when no parameters are fed to the Makefile
all: run

run: os-image.bin
		qemu-system-i386 -fda $<

os-image.bin: boot/boot_sect.bin kernel.bin
		cat $^ > $@

# Notice how dependencies are built as needed
kernel.bin: kernel/kernel_entry.o ${OBJ}
		ld -o $@ -m elf_i386 -Ttext 0x1000 $^ --oformat binary

%.o : %.c ${HEADERS}
	gcc -m32 -fno-pie -ffreestanding -c $< -o $@

# kernel_entry.o: kernel_entry.asm
# 		nasm $< -f elf -o $@

%.o: %.asm
		nasm  $< -f elf -o $@

%.bin: %.asm
		nasm  $< -f bin -I boot/ -o $@

# Rule to disassemble the kernel - may be useful to debug
kernel.dis: kernel.bin
		ndisasm -b 32 $< > $@

boot_sect.bin: boot_sect.asm
		nasm $< -f bin -o $@

clean:
		rm *.bin *.o *.dis
