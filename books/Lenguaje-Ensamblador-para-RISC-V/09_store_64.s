.global _start

.data
a: .dword 0xFFFFFFFF00000000
b: .word 0xFFFFFFFF

.text
_start:
    la t0, a                # load address of a
    la t1, b                # load address of b
    lw t2, (t1)             # load word from b
    sw t2, (t0)             # store b in a = 0xFFFFFFFFFFFFFFFF
    ld t3, (t0)             # load doubleword fromm a
    lb a0, 0(t0)            # return 0x00000000000000FF  

    li a7, 93               # exit
    ecall
