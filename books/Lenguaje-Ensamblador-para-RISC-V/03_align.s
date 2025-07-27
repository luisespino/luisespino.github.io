.global _start

.data
b: .word 1, 2

.text
_start:
	li a7, 93              	# exit sycall 
	ecall
