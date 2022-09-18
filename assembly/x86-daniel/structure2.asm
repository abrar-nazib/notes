	.file	"struct2.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "%c\12\0"
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
	sub	esp, 80
	
	call	___main
	mov	BYTE PTR [esp+46], 65
	mov	BYTE PTR [esp+47], 66
	mov	BYTE PTR [esp+48], 67
	mov	eax, DWORD PTR [esp+46]
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR [esp+50]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+54]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+58]
	mov	DWORD PTR [esp+12], eax
	mov	eax, DWORD PTR [esp+62]
	mov	DWORD PTR [esp+16], eax
	mov	eax, DWORD PTR [esp+66]
	mov	DWORD PTR [esp+20], eax
	mov	eax, DWORD PTR [esp+70]
	mov	DWORD PTR [esp+24], eax
	movzx	eax, WORD PTR [esp+74]
	mov	WORD PTR [esp+28], ax
	call	_my_asm
	
	mov	DWORD PTR [esp+76], eax
	mov	eax, DWORD PTR [esp+76]
	movsx	eax, al
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_my_asm;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
