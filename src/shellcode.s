section .text
global _start
	_start:
		mov rax, 0x25
		mov rbx, 0x10

		add rax, rbx
		ret
