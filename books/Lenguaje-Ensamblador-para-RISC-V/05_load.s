.global _start

.data
num: .word 10

.text
_start:
    la t0, num              # load num address  
    lw a0, (t0)             # load num content 

    li a7, 93               # load exit number
    ecall                   # syscall
