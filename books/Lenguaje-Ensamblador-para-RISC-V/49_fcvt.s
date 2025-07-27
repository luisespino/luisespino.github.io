.global _start

.data
float1: .float 2.5

.text
_start:
    la t0, float1           # load float1 address
    flw f0, (t0)            # load float1 value to f0
    fcvt.w.s a0, f0         # convert f0 to int in a0
	
    li a7, 93               # exit
    ecall
