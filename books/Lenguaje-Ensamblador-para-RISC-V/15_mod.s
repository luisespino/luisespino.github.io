.global _start

_start:
    li t0, 10               # test value
    li t1, 2
    rem a0, t0, t1          # test % 2

    li a7, 93               # exit syscall
    ecall
