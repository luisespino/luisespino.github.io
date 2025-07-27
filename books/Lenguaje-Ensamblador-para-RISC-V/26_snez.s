.global _start

.text
_start:
    li t0, 15               # load number 15
    li t1, 10               # load min
    li t2, 20               # load max
    addi t3, t0, -15        # make value for snez

    slt t4, t1, t0          # t4 = (min < number) ? 1 : 0 (A)
    slt t5, t0, t2          # t5 = (number < max) ? 1 : 0 (B)
    and t6, t4, t5          # t6 = (A) & (B) 
	
    snez t4, t3             # t4 = (t2 != 0) ? 1 : 0 (C)
    and t5, t4, t6          # t5 = t6 & (C)

    mv a0, t5               # return value a0 = (A) & (B) & (C)
	
	li a7, 93               # exit
	ecall
