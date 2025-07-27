.global _start

_start:
    li t0, 0b10010          # initial state
    li t1, 0b101            # new data from sensors
    or a0, t0, t1           # update state

    li a7, 93               # exit syscall
    ecall


