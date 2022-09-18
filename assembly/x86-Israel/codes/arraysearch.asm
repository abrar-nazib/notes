;Code for finding out a non zero element of the array
.386				;lowest required processor type
.model flat			;code for flat memory segmentation style

.data
;	intArray SWORD 0, 0, 0, 0, -1, 3, 0, -34, -56, 7, 8	;sword means signed word. Size two bytes  	
	intArray SWORD 0, 0, 0, 0, 0, 0, 0, 0
.code
start PROC
	mov ebx, OFFSET intArray	;ebx is a general purpose register storing the address of the array
	mov ecx, LENGTHOF intArray	;lengthof returns the number of elements inside an array
	mov eax, 0					;cleaning up the eax register

LP:
	cmp WORD PTR[ebx], 0		;ptr is overriding the size of the 
	jnz found					;if not equal to zero, jump to found label
	add ebx, TYPE intArray		;TYPE returns the size of an element in bytes
	loop LP

	jmp notFound

found:
	movsx eax, WORD PTR[ebx]		;movsx: move signed number
	jmp quit

notFound:
	jmp quit

quit:
	ret							;return control to the operating systen
start ENDP
END	 start