.global _start

.text
_start:
    li t0, 15               # load number 15
    li t1, 10               # load min
    li t2, 20               # load max
    slt t3, t1, t0          # t3 = (min < number) ? 1 : 0
    slt t4, t0, t2          # t4 = (number < max) ? 1 : 0
    and t5, t3, t4          # t5 = t3 & t4
    mv a0, t5               # return value a0 = (t0 > min & t0 < max)

    li a7, 93               # exit
    ecall
