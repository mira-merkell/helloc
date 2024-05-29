; helloc.s: x86_64 implementation of hello_world
;
; Copyright 2024 ⧉⧉⧉
;
; This file is part of helloc.
;
; helloc is free software: you can redistribute it and/or modify it under the
; terms of the GNU General Public License as published by the Free Software
; Foundation, either version 3 of the License, or (at your option) any later
; version.
;
; helloc is distributed in the hope that it will be useful, but WITHOUT ANY
; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
; details.
;
; You should have received a copy of the GNU General Public License along with
; this program.  If not, see <https://www.gnu.org/licenses/>.
[bits 64]
default rel

global helloc_world, helloc_iseven


section .rodata

hello_msg	db "Hello from asm!", 10, 0


section .text
	extern printf


; Print a hello message to stdout
;
; Signature:
;	void helloc_world(void);
;
helloc_world:
	push	rbp
	mov	rbp, rsp

	xor	rax, rax
	lea	rdi, [hello_msg]
	call	printf wrt ..plt

	mov	rsp, rbp
	pop	rbp
	ret


; Test if the number is even.
;
; Signature:
;	int helloc_iseven(uint64_t);
;
; Returns:
;	1	- if the first argument is even
;	0	- otherwise
;
helloc_iseven:
	xor	eax, eax
	and	rdi, 1
	setz	al
	ret

