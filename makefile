SRC = src/shellcode.s
BIN = build/shellcode
BIN_EXE = build/shellcode.exe
OBJ = build/shellcode.o
OUT_BIN = shellcode.bin

ifeq ($(filter win64,$(MAKECMDGOALS)),win64)
	SRC = src/shellcode.c
endif

all: shellcode.o linkelf
	python3 scripts/dump.py
shellcode.o:
	rm -f dump.txt
	mkdir -p build
	nasm -f elf64 $(SRC) -o $(OBJ)
	objcopy -O binary $(BIN) $(OUT_BIN)
linkelf: shellcode.o
	ld -m elf_x86_64 -o build/shellcode build/shellcode.o
clean:
	rm -rf build/ shellcode* dump.txt
win64:
	rm -f dump.txt
	mkdir -p build
	x86_64-w64-mingw32-cc $(SRC) -o $(BIN)
	objcopy -O binary $(BIN_EXE) $(OUT_BIN)
	python3 scripts/dump.py
