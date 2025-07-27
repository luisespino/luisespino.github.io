# itoa procedure
# arguments: a0 number; a1 address of buffer

.global itoa

itoa:
    # initialization
    mv t0, a0               # number
    mv t1, a1               # buffer
    li t2, 10               # base 10
    beqz t0, zero           # handle zero
	
    # count digits
    mv t3, a0
    li t4, 1                # digits counter
count:
    beqz t3, end_count
    div t3, t3, t2          # iterative div
    add t4, t4, 1           # len++
    j count
end_count:
    add t1, t1, t4          # begin at end digits
    sb zero, (t1)           # end of string
    addi t1, t1, -1
    li t5, 10               # new line
    sb t5, (t1)
    addi t1, t1, -1

loop:
    # put last digit in buffer
    rem t3, t0, t2          # last digit
    addi t3, t3, '0'        # adjust ASCII
    sb t3, (t1)             # store byte
    addi t1, t1, -1         # offset--
    div t0, t0, t2          # rm last digit
    bnez t0, loop
    ret

zero:
    # special case when number = 0
    li t0, '0'              # 0 ASCII value
    sb t0, 0(t1)
    li t0, 10               # new line
    sb t0, 1(t1)
    sb zero, 2(t1)          # end of string
    ret
