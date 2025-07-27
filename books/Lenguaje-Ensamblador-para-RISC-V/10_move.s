.global _start

.data
a: .byte 0

.text
_start:
    la t0, a                # load address of a
    li t1, 10               # load 10
    mv t2, t1               # move t1 to t2
    sb t2, (t0)             # a = 10
    lb a0, (t0)             # return a

    li a7, 93               # exit
    ecall

