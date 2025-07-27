.global _start

_start:
    jal fun                 # call fun

    li a7, 93               # exit with return value a0
    ecall

fun:
    addi sp, sp, -4         # reserve 4 bytes in Stack
    sw ra, (sp)             # push ra in new sp
    addi sp, sp, 4          # free 4 bytes in Stack
    li a0, 10               # load return value
    ret                     # return
