section .data
	dividend dq 100
	divisor  dq 50

section .text
global _start
	_start:
		mov rax, qword [dividend]
		mov edx, 0
		mov eax, dword [divisor]

		div eax
		ret

		mov rax, 0x25
		mov rbx, 0x10

		add rax, rbx
		ret
