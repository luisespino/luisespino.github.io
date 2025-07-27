.global _start

.extern fact
.extern itoa

.bss
buffer: .space 11

.text
_start:
    li a0, 10                # call fact(a0=10)
    jal fact
	
    la a1, buffer           # call itoa(a0=fact, a1=buffer)
    jal itoa

    li a0, 1                # print buffer
    la a1, buffer
    li a2, 11
    li a7, 64
    ecall

    li a7, 93               # exit
    ecall
