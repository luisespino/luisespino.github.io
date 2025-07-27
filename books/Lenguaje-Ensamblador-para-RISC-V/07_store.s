.global _start

.data
num1: .word 10              # source var

.bss
num2: .space 4              # target var

.text
_start:
    lw t0, num1             # load num1
    la t1, num2             # load num2 address
    sw t0, (t1)             # store num1 to num2
    lw a0, num2             # load num2

    li a7, 93               # exit syscall
    ecall