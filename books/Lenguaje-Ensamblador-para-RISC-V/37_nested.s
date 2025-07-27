.global _start

.bss
pattern: .space 36

.text
_start:
    la t0, pattern          # load pattern address
    li t1, '5'              # end = 5
    li t2, '1'              # i = 1
loop1:
    bgt t2, t1, endloop1    # branch endloop1 if i > end
    li t3, '1'              # j = 1
loop2: 
    bgt t3, t2, endloop2    # branch endloop2 if j > i
    sb t3, (t0)             # store byte j
    addi t0, t0, 1          # offset++
    li t4, ' '              # load space
    sb t4, (t0)             # store space
    addi t0, t0, 1          # offset++
    addi t3, t3, 1          # j++
    j loop2
endloop2:
    addi t2, t2, 1          # i++
    li t4, 10               # load enter
    sb t4, (t0)             # store enter
    addi t0, t0, 1          # offset++
    j loop1
endloop1:
    sb zero, (t0)           # store end of string
    li a0, 1                # print pattern
    la a1, pattern
    li a2, 36
    li a7, 64
    ecall

    li a7, 93               # exit
    ecall
