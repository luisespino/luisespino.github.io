.global _start

.data
filename: .asciz "test.txt"

.bss
buffer: .space 1024

.text
_start:
    li a0, -100             # load AT_FDCWD
    la a1, filename         # load filename
    li a2, 0                # O_RDONLY
    li a7, 56               # load OPENAT
    ecall                   # syscall
    mv s1, a0               # preserve file descriptor FD

    mv a0, s1               # load FD
    la a1, buffer           # read file in buffer
    li a2, 1024
    li a7, 63
    ecall

    li a0, 1                # print buffer
    la a1, buffer             
    li a2, 1024
    li a7, 64
    ecall

    mv a0, s1               # load FD
    li a7, 57               # close file
    ecall

    li a7, 93               # exit
    ecall 
