#!/bin/bash

echo -e -n '\xe9\xfd\xff' >boot_sect.bin
for i in {1..507}; do echo -e -n '\x00' >>boot_sect.bin; done
echo -e -n '\x55\xaa' >>boot_sect.bin

qemu-system-i386 boot_sect.bin

