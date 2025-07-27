.global _start

.data
msg: .string "Enter a digit, 0 to exit: "

.bss
buffer: .space 2            # no initialized

.text
_start:
do:                         # do

    li a0, 1                # print msg
    la a1, msg
    li a2, 26
    li a7, 64
    ecall

    li a0, 0                # read buffer from stdin
    la a1, buffer
    li a2, 2
    li a7, 63
    ecall

    la t0, buffer           # transform digit
    lb t1, (t0)
    addi t1, t1, -48

while:                      # while t1 != 0
    bnez t1, do

end:
    li a7, 93               # exit
    ecall
