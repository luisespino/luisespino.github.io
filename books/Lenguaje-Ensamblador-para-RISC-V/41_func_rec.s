.global _start

_start:
    li a0, 1                # set arguments
    li a1, 4
    jal fact                # call fact

    li a7, 93               # exit
    ecall

fact:
    addi sp, sp, -4
    sw ra, (sp)             # push ra
    li t0, 1
    beq a1, t0, end
    beq a1, zero, end
    mul a0, a0, a1          # n * fact(n-1)
    addi a1, a1, -1
    jal fact                # recursive call
end:
    lw ra, (sp)             # return condition
    addi sp, sp, 4
    ret
