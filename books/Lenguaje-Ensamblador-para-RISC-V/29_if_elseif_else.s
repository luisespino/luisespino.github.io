.global _start

.data
msg1: .asciz "The number is positive\n"
msg2: .asciz "The number is negative\n"
msg3: .asciz "The number is neutral \n"

.text
_start:
    li t0, 15               # test number

if:                 
    bltz t0, elseif         # (t0 < 0) go to elseif
    beqz t0, else           # (t0 == 0) go to else
    
    la a1, msg1             # load positive message
    beqz zero, endif

elseif:
    la a1, msg2             # load negative message
    beqz zero, endif

else:
    la a1, msg3             # load neutral message

endif:
    li a0, 1                # print 
    li a2, 23
    li a7, 64
    ecall

    li a0, 0                # exit without errors
    li a7, 93               
    ecall
    
