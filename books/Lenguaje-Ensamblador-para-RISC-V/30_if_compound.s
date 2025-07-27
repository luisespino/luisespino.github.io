.global _start

.data
msg1: .string "It is positive and odd    \n"
msg2: .string "It is not positive and odd\n"

.text
_start:
    li t0, 15               # load test value

    sgtz t1, t0             # t1 = (t0 > 0) ? 1 : 0
    andi t2, t0, 1          # t2 = (t0 && 1) ? 1 : 0
    and t1, t1, t2          # t1 = t1 && t2
if:
    beqz t1, else           # (t1 <= 0) go to else
    
    la a1, msg1             # load msg1 address
    beqz x0, end

else:
    la a1, msg2             # load msg2 address

end:
    li a0, 1                # print
    li a2, 27
    li a7, 64
    ecall
	
    li a0, 0                # exit without errors
    li a7, 93
    ecall
