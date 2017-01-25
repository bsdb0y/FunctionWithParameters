#Passing arguments to function using global memory locations.

.data 
	string1:
		.asciz "Hello World\n"
		len1 = . - string1
		
	string2:
		.asciz "Hello Function\n"
		len = . - string2
.bss
	.lcomm StringPointer,4
	.lcomm StringLength,4

.text
	.globl _start
	.type MyFunction,@function
		
	MyFunction:
			movl $4,%eax
			movl $1,%ebx
			movl StringPointer,%ecx
			movl StringLength,%edx
			int $0x80
			ret

	_start:
		nop
		#Print the Hello World string
	
		movl $string1,StringPointer
		movl $len1,StringLength
		call MyFunction
		
		#Exit Routine 
	ExitCall:
		movl $1,%eax
		movl $0,%ebx
		int $0x80
