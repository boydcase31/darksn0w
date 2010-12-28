pwn:
	arm-elf-gcc darksn0w.S -o darksn0w.elf -nostdlib -mthumb-interwork -lc -lgcc
	arm-elf-objcopy -O binary darksn0w.elf darksn0w.bin
	dd if=iboot.orig of=payload.bin bs=0x2000 count=1
	cat darksn0w.bin >> payload.bin

clean:
	rm -f darksn0w.elf darksn0w.bin payload.bin

exploit: pwn
	irecovery -k payload
