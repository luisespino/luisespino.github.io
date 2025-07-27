.global _start

.extern itoa

.data
array: .word 15, 48, 99, 56, 22, 34, 57, 19, 35, 61

.bss
buffer: .space 11

.text
_start:
    la t0, array            # load array address
    li t1, 10               # decrement counter
    li t2, 0                # sum
loop:
    beqz t1, end
    addi t1, t1, -1
    lw t3, (t0)             # load number
    addi t0, t0, 4          # increment offset 4 bytes
    add t2, t2, t3          # sum += number
    j loop
end:
    mv a0, t2               # move result to argument
    la a1, buffer           # load buffer array
    jal itoa                # call itoa

    li a0, 1                # print buffer with sum
    la a1, buffer
    li a2, 11
    li a7, 64
    ecall

    li a7, 93               # exit
    ecall
