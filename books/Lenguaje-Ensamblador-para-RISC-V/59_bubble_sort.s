.global _start

.data
array: .byte 7, 4, 3, 9, 1
.equ array_len, 5

.bss
buffer: .space 12
.equ buffer_len, 12

.text
_start:
    la a0, array                # load array address
    li a1, array_len            # load array_len
    jal sort                    # sort(a0, a1)

    la a0, array                # load array address
    li a1, array_len            # load array_len
    la a2, buffer               # load buffer address
    jal array_to_buffer         # array_to_buufer(a0, a1, a2)

    li a0, 1                    # print buffer
    la a1, buffer
    li a2, buffer_len
    li a7, 64
    ecall

    li a7, 93                   # exit
    ecall

sort:
    li a2, 0                    # i = 0
    li a3, 0                    # j = 0
for_i:
    addi a4, a1, -1             # n-1 index
    bge a2, a4, end_for_i       # branch endj if i >= n-1 
    add a3, a2, 1               # j = i + 1
for_j:
    bge a3, a1, end_for_j       # branch endi if j >= n
    add t0, a2, a0              # t0 = array addr + i
    add t1, a3, a0              # t1 = array addr + j
    lb t2, (t0)                 # t2 = array[i]
    lb t3, (t1)                 # t3 = array[j]
    ble t2, t3, no_swap         # branch no_swap if t2 <= t3
    sb t3, (t0)                 # array[i] = j
    sb t2, (t1)                 # array[j] = i
no_swap:
    add a3, a3, 1               # j++
    j for_j
end_for_j:
    add a2, a2, 1               # i++
    j for_i
end_for_i:
    ret                         # return

array_to_buffer:
loop:
    beqz a1, end_loop           # branch end if a1 == 0
    lb a3, (a0)                 # a3 = array[i]
    addi a3, a3, '0'            # ASCII adjust
    sb a3, (a2)                 # buffer[j] = array[i]
    addi a0, a0, 1              # i++
    addi a2, a2, 1              # j++
    li a3, ' '                  # a3 = ' '
    sb a3, (a2)                 # buffer[j] = ' '
    addi a2, a2, 1              # j++
    addi a1, a1, -1             # array_len--
    j loop
end_loop:
    li a3, 10                   # append enter and end
    sb a3, 0(a2)
    sb zero, 1(a2)             
    ret
