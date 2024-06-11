all: shellcode.o
	objcopy -O binary build/shellcode shellcode.bin
	python3 scripts/dump.py
shellcode.o:
	mkdir -p build
	nasm -f elf64 src/shellcode.s -o build/shellcode.o
	ld -m elf_x86_64 -o build/shellcode build/shellcode.o
clean:
	rm -rf build/ shellcode*
