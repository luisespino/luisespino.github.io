.global _start

.data
num: .word 1, 2, 3, 4       # array num

.text
_start:
    la t0, num              # load num address
    lw a0, 8(t0)            # load third num word

    li a7, 93               # exit syscall
    ecall
