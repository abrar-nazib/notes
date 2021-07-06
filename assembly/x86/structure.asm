	.file	"struct.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 48		;making room in the stack for storing the returned variables
	call	___main

	lea	eax, [esp+18]	;there is something inside esp+18 address which is getting inside eax
						;most likely it is an address pointing to something 
	mov	DWORD PTR [esp], eax	;this adddress/pointer is getting in the memory where present stack pointer is pointing to
	call	_my_asm
	movzx	eax, BYTE PTR [esp+18]
	movsx	eax, al
	mov	DWORD PTR [esp], eax
	call	_putchar
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_my_asm;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
