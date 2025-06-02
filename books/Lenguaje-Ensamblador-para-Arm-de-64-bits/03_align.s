.global _start

.data
b: .word 1, 2

.text
_start:
	mov x8, #93                 // exit sycall 
	svc #0
	
