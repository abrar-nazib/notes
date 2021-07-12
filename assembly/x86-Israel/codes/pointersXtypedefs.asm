;Program to test pointers and typedefs
.386
.model flat
PBYTE TYPEDEF PTR BYTE		;PBYTE = PTR BYTE ->pointer to a byte
PWORD TYPEDEF PTR WORD		;PWORD = PTR WORD ->pointer to a word
PDWORD TYPEDEF PTR DWORD	;PDWORD = PTR DWORD ->pointer to a dword

.data
arrayB BYTE 10h, 20h, 30h
arrayW WORD 1, 2, 3
arrayD DWORD 4, 5, 6

pt_B PBYTE arrayB
pt_W PWORD arrayW
pt_D PDWORD arrayD

.code
start PROC
	mov esi, pt_B
	mov al, [esi]
	mov esi, pt_W
	mov ax, [esi]
	mov esi, pt_D
	mov eax, [esi]

	ret

start ENDP
END start