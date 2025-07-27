.global _start

.data                       # class node
node: .dword 0, 0, 0
head: .space 240
tail: .dword 0

.bss
buffer: .space 22

.text
add_node:                   # method: add_node(val)
    la a1, head             # load head address
    la a2, tail             # load tail address
    mv a3, a1               # tmp_head = head
    lw a4, (a2)             # tmp_tail = *tail
    beqz a4, empty          # branch empty if tmp_tail == 0
test_left:
    ld a5, (a3)             # load *tmp_head
    bge a0, a5, test_right  # branch right if val >= *tmp_head 
    ld a6, 8(a3)            # load left address
    beqz a6, add_left       # branch add_left if left == 0
    mv a3, a6               # tmp_head = left
    j test_left             # jump to test_left
add_left:
    add a1, a1, a4          # head += tmp_tail, offset
    sd a1, 8(a3)            # tmp_head.left = offset
    sd a0, 0(a1)            # head.val = val
    sd zero, 8(a1)          # head.left = null
    sd zero, 16(a1)         # head.right = null
    add a4, a4, 24          # tmp_tail += 24
    sd a4, (a2)             # *tail = tmp_tail 
    ret                     # return
test_right:
    ld a6, 16(a3)           # load right address
    beqz a6, add_right      # branch add_right if right == 0
    mv a3, a6               # tmp_head = left
    j test_left             # jump to test_left
add_right:
    add a1, a1, a4          # head += tmp_tail, offset
    sd a1, 16(a3)           # tmp_head.right = offset
    sd a0, 0(a1)            # head.val = val
    sd zero, 8(a1)          # head.left = null
    sd zero, 16(a1)         # head.right = null
    add a4, a4, 24          # tmp_tail += 24
    sd a4, (a2)             # *tail = tmp_tail 
    ret                     # return
empty:
    sd a0, 0(a1)            # head.val = val
    sd zero, 8(a1)          # head.left = null
    sd zero, 16(a1)         # head.right = null
    add a4, a4, 24          # tmp_tail += 24
    sd a4, (a2)             # *tail = tmp_tail 
    ret                     # return	

in_order:                   # method: in_order()
    add sp, sp, -32         # push 4 registers to sp
    sd fp, 0(sp)
    sd ra, 8(sp)
    sd a0, 16(sp)
    sd a2, 24(sp)
    beqz a0, in_order_end   # branch end if head == null 
    mv a2, a0               # tmp_head = head		
    ld a0, 8(a0)            # head = tmp_head.left
    jal in_order            # jump to pre_order

    ld a3, (a2)             # a3 = tmp_head.val
    add a3, a3, '0'         # adjust ASCII
    sb a3, (a1)             # *buffer = temp_head.val
    addi a1, a1, 1          # buffer += 1 (byte)
    li a3, ' '              # a3 = ' '
    sb a3, (a1)             # *buffer = ' '
    addi a1, a1, 1          # buffer += 1 (byte)
    ld a0, 16(a2)           # head = tmp_head.right
    jal in_order            # jump to pre_order

in_order_end:
    ld fp, 0(sp)            # pop 4 registers from sp
    ld ra, 8(sp)
    ld a0, 16(sp)
    ld a2, 24(sp)
    add sp, sp, 32
    ret                     # return

_start:
    li a0, 5                # add_node(5)
    jal add_node

    li a0, 7                # add_node(7)
    jal add_node

    li a0, 2                # add_node(2)
    jal add_node

    li a0, 4                # add_node(4)
    jal add_node

    la a0, head             # pre_order traversal to buffer
    la a1, buffer 
    jal in_order

    li t0, 10               # append enter, endfile to buffer
    sb t0, 0(a1)
    sb zero, 1(a1)

    li a0, 1                # print buffer
    la a1, buffer
    li a2, 22
    li a7, 64
    ecall

    li a7, 93               # exit
    ecall
