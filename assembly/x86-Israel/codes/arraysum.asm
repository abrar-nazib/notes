.386
.model flat

.data
	intArray DWORD 10000h, 20000h, 30000h, 40000h
.code
start PROC
	mov edi, OFFSET intArray	;edi is called destination index register but here it is being used as source index
	mov ecx, LENGTHOF intArray	;lengthof returns the number of elements inside an array
	mov eax, 0					;cleaning up the eax register

LP:
	add eax, [edi]
	add edi, TYPE intArray		;type returns the size of an element of the array in bytes
	loop LP
	
	ret							;return control to the operating systen
start ENDP
END	 start