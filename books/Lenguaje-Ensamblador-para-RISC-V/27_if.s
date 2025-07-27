.global _start

_start:
    li a0, 10              # load immediates
    li a1, 10                
if:
    bne a0, a1, end         # (a0 < a1) go to end
    add a0, a0, a1          # a0 = a0 + a1
end:
    li a7, 93               # exit
    ecall
