.global _start

.data
factCF: .float 1.8          # C to F factor
consCF: .float 32           # C to F constant
celsius: .float 57          # degrees Celsius

.text
_start:
    la t0, factCF           # load CF factor
    flw f0, (t0)
    la t1, consCF           # load CF constant
    flw f1, (t1)
    la t2, celsius          # load degrees Celsius to convert
    flw f2, (t2)

    fmul.s f2, f2, f0       # f2 = degree * 1.8
    fadd.s f2, f2, f1       # f2 = f2 + 32
    fcvt.w.s a0, f2         # conver f2 to a0
 
    li a7, 93               # exit
    ecall
