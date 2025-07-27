.global _start

_start:
    lui t0, 0xFFEED         # load upper 20 bits
    li t1, 0xDCC            # load lower 12 bits
    or t0, t0, t1           # merge

    li t1, 0xFF             # load mask 0xFF
    and a0, t0, t1          # clean with and

    li a7, 93               # exit
    ecall
