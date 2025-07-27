.global _start

.data
msg1: .asciz "The number is natural\n"
msg2: .asciz "The number is not natural\n"

.text
_start:
    li t0, 15               # test number

if:                 
    bltz t0, else           # (t0 < 0) go to else
    
    li a0, 1                # print natural
    la a1, msg1
    li a2, 22
    li a7, 64
    ecall
    beqz zero, endif

else:
    li a0, 1                # print not natural
    la a1, msg2
    li a2, 26
    li a7, 64
    ecall

endif:
    li a0, 0                # exit without errors
    li a7, 93               
    ecall
    