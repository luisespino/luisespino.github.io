.global _start

_start:
    li t0, 33               # load immediate 33
    and a0, t0, 1           # a0 = t0 && 1
    
    li a7, 93               # exit syscall
    ecall
