.global _start

_start:
    li a0, 10               # set arguments
    li a1, 15
    jal max                 # call max function

    li a7, 93               # exit
    ecall                   # (using a0)

max:
    blt a0, a1, end         # (a0 < a1) ? a1 ; a0
    ret
end:
    mv a0, a1
    ret
