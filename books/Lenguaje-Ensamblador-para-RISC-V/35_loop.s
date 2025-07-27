.global _start

.bss
str: .space 27

.text
_start:
    la t0, str              # initialization
    li t1, 26
    li t2, 'a'
loop:                       
    sb t2, (t0)
    addi t2, t2, 1
    addi t1, t1, -1
    addi t0, t0, 1
    bnez t1, loop           # branch to loop if t1 != 0
	
    li t2, 10               # add enter symbol
    sb t2, (t0)

    li a0, 1                # print str
    la a1, str
    li a2, 27
    li a7, 64
    ecall

    li a7, 93               # exit
    ecall
