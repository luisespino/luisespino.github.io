.global _start

.extern itoa

.data
head: .word 0

.bss
buffer: .space 11

.text
_start:
    li a0, 30               # val
    lw a1, head             # head
    jal push                # push(val, head)

    li a0, 20               # val
    lw a1, head             # head
    jal push                # push(val, head)

    li a0, 10               # val
    lw a1, head             # head
    jal push                # push(val, head)

    lw a0, head             # print list
    jal print

    li a7, 93               # exit
    ecall

push:
    mv t0, a0               # val
    mv t1, a1               # head
	
    li a7, 214              # new_node address
    ecall
    mv t2, a0		

    addi a0, a0, 8          # allocate new_node 8 bytes
    li a7, 214
    ecall

    sw t0, 0(t2)            # new_node.val = val
    sw t1, 4(t2)            # new_node.next = head
    la t3, head
    sw t2, (t3)             # head = new_node
    ret

print:
    addi sp, sp, -4         # push ra
    sw ra, (sp)
    mv s1, a0               # tmp = head
loop:		
    beqz s1, end            # branch end if tmp == 0

    lw a0, 0(s1)            # itoa(tmp.val, buffer)
    la a1, buffer
    jal itoa

    li a0, 1                # print buffer
    la a1, buffer
    li a2, 11
    li a7, 64
    ecall

    lw s1, 4(s1)            # tmp = tmp.next
    j loop
end:
    lw ra, (sp)             # pop ra
    addi sp, sp, 4
    ret
