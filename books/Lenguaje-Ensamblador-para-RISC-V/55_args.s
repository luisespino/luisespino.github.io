.global _start

.bss
buffer: .space 512

.text
_start:
	mv t0, sp               # copy sp address
	addi t0, t0, 679        # offset by gdb
	la t1, buffer           # load buffer address
loop:
	lb t2, (t0)             # loop for set buffer bytes
	beqz t2, end
	sb t2, (t1)
	addi t0, t0, 1
	addi t1, t1, 1
	j loop

end:                        # add \n and \0
	li t2, 10
	sb t2, (t1)
	addi t1, t1, 1
	sb zero, (t1)

	li a0, 1                # print buffer
	la a1, buffer
	li a2, 512
	li a7, 64
	ecall

	li a7, 93               # exit
	ecall
	