.global _start

.data
float1: .float 3.1
float2: .float 1.2

.text
_start:
    la t1, float1           # load values
    flw f1, (t1)
    la t2, float2
    flw f2, (t2)

    fmax.s f0, f1, f2       # get max and convert
    fcvt.w.s a0, f0

    li a7, 93               # exit
    ecall

