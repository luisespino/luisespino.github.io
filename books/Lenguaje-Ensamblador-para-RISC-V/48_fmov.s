.global _start

.data
float1: .word 0x40200000

.text
_start:
    la t0, float1           # load float1 address
    flw f0, (t0)            # load float1 value to f0
    fmv.x.w a0, f0          # copy f0 to a0

    li a7, 93               # exit
    ecall
