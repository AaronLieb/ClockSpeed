;Program Name        : Main (Harmonic Sum)
;Programming Language: x86 Assembly
;Program Description : This file is responsible for 
;
;Author              : Aaron Lieberman
;Email               : AaronLieberman@csu.fullerton.edu
;Institution         : California State University, Fullerton
;Course              : CPSC 240
;
;Copyright (C) 2020 Aaron Lieberman
;This program is free software: you can redistribute
;it and/or modify it under the terms of the GNU General Public License
;version 3 as published by the Free Software Foundation. This program is
;distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY
;without even the implied Warranty of MERCHANTABILITY or FITNESS FOR A
;PARTICULAR PURPOSE. See the GNU General Public License for more details.
;A copy of the GNU General Public License v3 is available here:
;<https://www.gnu.org/licenses/>.

extern printf      ; c function
extern scanf       ; c function
extern read_clock  ; user defined function
extern getfreq     ; Professor's user defined function
extern cpuinfo 
extern cpuinfo_debug

section .data

section .text
	global start 

start:
	; 17 pushs
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
	push rax

	xor rax, rax
	call cpuinfo
	xor rax, rax
	call cpuinfo_debug

	; 17 pops
	pop rax
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
	ret ; return result
