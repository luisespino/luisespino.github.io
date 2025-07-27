.global _start

.equ MAX, 100

.text
_start:
    li a0, MAX              # return equ value

    li a7, 93               # exit syscall number
    ecall                   # syscall
