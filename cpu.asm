extern printf

section .data
	sf db "%s", 0
	sfn db "%s", 10, 0

section .text
	global cpuinfo

cpuinfo:
	push rbp
	mov rbp, rsp
	push rbx
	push rcx
	push rdx
	push rdi
	push rsi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf

	mov r14, 0x0000000080000002

	xor r15, r15

outer_loop:
	mov rax, r14
	cpuid
	add r14, 0x0000000000000001

	push rdx
	push rcx
	push rbx
	push rax

	xor r13, r13

inner_loop:
	xor rax, rax
	mov rdi, sf
	mov rsi, rsp
	call printf
	pop rbx

	inc r13
	cmp r13, 4 
	jne inner_loop

	inc r15

	cmp r15, 3 
	jne outer_loop

	xor rax, rax
	mov rdi, sfn
	call printf

	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rsi
	pop rdi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	ret

