.global _start

_start:
    li t1, 10               # load 10
    li t2, 15               # load 15
    
    slt t0, t1, t2          # (10 < 15) ? 1 : 0
    neg t3, t0              # (t0 == 1) ? 0xFFFFFFFF : 0x00000000

    and t4, t2, t3          # (t0==1) ? t2 : 0
    not t3, t3              # t3 = ~t3
    and t5, t1, t3          # (t0==0) ? t1 : 1
    or  a0, t4, t5          # a2 = max

    li a7, 93               # exit
    ecall
    