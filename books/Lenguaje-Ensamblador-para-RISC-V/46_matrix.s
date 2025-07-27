# determinant = a - b
#
# a = matrix[0, 0] * matrix[1, 1] 
# b = matrix[1, 0] * matrix[0, 1]

.global _start

.extern itoa

.data
matrix: 
    .word 25, 11
    .word 10, 20

.bss
buffer: .space 11

.text
_start:
    la t0, matrix              # load matrix address

    li a0, 0                   # t1 = offset matrix[0, 0]
    li a1, 0
    li a2, 2
    jal offset
    mv t1, a0

    li a0, 1                   # t2 = offset matrix[1, 1]
    li a1, 1
    li a2, 2
    jal offset
    mv t2, a0

    add t1, t0, t1             # load values with offset
    lw t1, (t1)
    add t2, t0, t2
    lw t2, (t2)
    mul t3, t1, t2             # t3 = t1 * t2

    li a0, 1                   # t1 = offset matrix[1, 0]
    li a1, 0
    li a2, 2
    jal offset
    mv t1, a0

    li a0, 0                   # t2 = offset matrix[0, 1]
    li a1, 1
    li a2, 2
    jal offset
    mv t2, a0

    add t1, t0, t1             # load values with offset
    lw t1, (t1)
    add t2, t0, t2
    lw t2, (t2)
    mul t4, t1, t2             # t4 = t1 * t2

    sub t1, t3, t4             # t1 = t3 - t4
 
    mv a0, t1
    la a1, buffer
    jal itoa                   # call itoa

    li a0, 1                   # print buffer
    la a1, buffer
    li a2, 11
    li a7, 64
    ecall

    li a7, 93                  # exit
    ecall

offset:                            # row-major offset
    mul a3, a0, a2
    add a3, a3, a1
    li a4, 4
    mul a0, a3, a4
    ret
