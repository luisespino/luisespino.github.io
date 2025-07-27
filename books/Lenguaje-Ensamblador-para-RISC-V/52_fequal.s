.global _start

.data
float1: .float 2.5
float2: .float 2.5

.text
_start:
    la t0, float1           # load float1 address
    la t1, float2           # load float2 address
    flw f0, (t0)            # load float1 value to f0
    flw f1, (t1)            # load float2 value to f1
    
    li t3, 96               # RUP 1100000
    csrrw t3, fcsr, t3      # write fcsr with RUP

    feq.s t2, f0, f1        # t2 = (f0 == f1) ? 1 : 0
if:     
    beqz t2, else           # branch to else if t2 == 0
    fcvt.w.s a0, f0         # convert f0 to int in a0
    j end                   # jump to end
else:   
    fsub.s f2, f0, f1       # f2 = f0 - f1
    fcvt.w.s a0, f2         # convert f2 to int in a0
end:    
    li a7, 93               # exit
    ecall
