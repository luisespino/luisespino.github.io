.globl _start

.data
newline: .ascii "\n"

.text
_start:
    ld a1, 16(sp)           # argv[1]
    mv a2, a1               # pointer copy

strlen_loop:
    lb t0, 0(a2)            # load current byte
    beqz t0, end            # string EOF
    addi a2, a2, 1          # ponter++
    j strlen_loop

end:
    
    li a0, 1                # argument print
    sub a2, a2, a1          # a2 = string length    
    li a7, 64
    ecall
    
    li a0, 1                # print newline
    la a1, newline
    li a2, 1
    li a7, 64
    ecall
    
    li a0, 0                # exit
    li a7, 93
    ecall

