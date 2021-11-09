.data
	n: .long 5
	v: .long 11, 12, -8, 345, 501
	ma: .space 4
	p: .long 2
	nr: .space 4
.text
.globl _start
_start:
	movl $0, %ecx
	lea v, %edi
_deplasare:
	cmp n, %ecx
	je _rezultat
	
	movl (%edi, %ecx, 4), %eax
	movl %eax, %ebx
	
	movl $0, %edx
	divl p
	
	cmp $0, %edx
	jne _continuare
_epar:
	addl %ebx, ma
	incl nr
	
_continuare:
	incl %ecx
	jmp _deplasare
	
_rezultat:
	cmp $0, nr
	je _exit
	movl $0, %edx
	movl ma, %eax
	divl nr
	movl %eax, ma	
_exit:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
