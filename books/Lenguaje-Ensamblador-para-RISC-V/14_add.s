.global _start

.data
a: .word -1, -2, -3

.text
_start:
    la t0, a               # load address of a
    lw t1, 0(t0)            # load index 0 value
    lw t2, 4(t0)            # load index 1 value
    lw t3, 8(t0)            # load index 2 value
    
    add a0, t1, t2          # a0 = t1 + t2
    add a0, a0, t3          # a0 = a0 + x3
    li t4, -1               # t4 = -1
    mul a0, a0, t4          # x0 = a0 * (-1)
    
    li a7, 93               # exit syscall
    ecall
