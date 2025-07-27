.global _start

.data
exception_msg: .asciz "Handled exception!\n"

.text

_start:
    la t0, exception_handler    # define handler address
    csrrw x0, mtvec, t0

    li t1, 9                    # cause a general exception
    csrrw x0, mcause, t1    
    ecall

    li a7, 93                   # exit
    ecall
    
exception_handler:              # print msg
    li a0, 1
    la a1, exception_msg
    li a2, 19
    li a7, 64
    ecall
    ret
