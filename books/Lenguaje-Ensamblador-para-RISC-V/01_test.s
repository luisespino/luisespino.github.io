.global _start

_start:
    li a0, 55               # return value
    li a7, 93               # exit syscall number
    ecall                   # syscall
