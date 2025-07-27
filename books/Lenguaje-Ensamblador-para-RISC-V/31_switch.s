.global _start

.bss
buffer: .space 2

.text
_start:
    li s0, 3                # test value
    la s1, buffer           # load buffer address

switch:                     # switch case
    li s2, 1
    beq s0, s2, case1
    li s2, 2
    beq s0, s2, case2
    li s2, 3
    beq s0, s2, case3   
    beqz zero, default

case1:                      # case1 sentences
    add s0, s0, 48
    sb s0, (s1)
    beqz zero, end

case2:                      # case2 sentences
    add s0, s0, 48
    sb s0, (s1)
    beqz zero, end

case3:                      # case3 sentences
    add s0, s0, 48
    sb s0, 0(s1)
    beqz zero, end

default:
    li s0, '0'
    sb s0, 0(s1)

end:
    li s2, 10               # add new line to buffer
    sb s2, 1(s1)
    li a0, 1                # print buffer
    la a1, buffer
    li a2, 2
    li a7, 64
    ecall

    li a0, 0                # exit without errors
    li a7, 93
    ecall
