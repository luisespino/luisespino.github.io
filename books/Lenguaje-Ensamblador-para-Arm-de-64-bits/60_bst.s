.global _start

.bss
memory: .space 240
offset: .quad 0 
buffer: .space 22

.text
_start:
    mov x0, #5                  // add_node(5)
    ldr x1, =memory
    ldr x2, =offset
    bl add_node

    mov x0, #7                  // add_node(7)
    ldr x1, =memory
    ldr x2, =offset
    bl add_node

    mov x0, #2                  // add_node(2)
    ldr x1, =memory
    ldr x2, =offset
    bl add_node
    
    mov x0, #4                  // add_node(4)
    ldr x1, =memory
    ldr x2, =offset
    bl add_node

    ldr x0, =memory             // inorder traversal
    ldr x1, =buffer
    bl inorder
    
    mov x2, #10                 // add newline and eof
    strb w2, [x1], #1
    strb wzr, [x1]

    mov x0, #1                  // print buffer
    ldr x1, =buffer
    mov x2, #22
    mov x8, #64
    svc #0

    mov x8, #93                 // exit
    svc #0

add_node:                       // add_node(val)
    mov x3, x1
    ldr x4, [x2]
    cmp x4, #0
    beq empty
test_left:                      
    ldr x5, [x3]
    cmp x0, x5
    bge test_right              // if val >= *tmp_head
    ldr x6, [x3, #8]
    cmp x6, #0
    beq add_left                // if left == 0
    mov x3, x6
    b test_left
add_left:
    add x1, x1, x4
    str x1, [x3, #8]
    str x0, [x1]                // head.val = val
    str xzr, [x1, #8]           // head.left = null
    str xzr, [x1, #16]          // head.right = null
    add x4, x4, #24
    str x4, [x2]
    ret
test_right:
    ldr x6, [x3, #16]
    cmp x6, #0
    beq add_right               // if right == 0
    mov x3, x6
    b test_left                 // if val < *tmp_head
add_right:
    add x1, x1, x4
    str x1, [x3, #16]
    str x0, [x1]                // head.val = val
    str xzr, [x1, #8]           // head.left = null
    str xzr, [x1, #16]          // head.left = null
    add x4, x4, #24
    str x4, [x2]
    ret
empty:
    str x0, [x1]                // head.val = val
    str xzr, [x1, #8]           // head.left = null
    str xzr, [x1, #16]          // head.left = null
    add x4, x4, #24
    str x4, [x2]
    ret

inorder: 
    stp fp, lr, [sp, #-16]!
    stp x0, x2, [sp, #-16]!
    cbz x0, end_inorder         // if head == null
    mov x2, x0
    ldr x0, [x0, #8]            // head = tmp_head.left
    bl inorder
    ldr x3, [x2]                // load tmp_head.val
    add x3, x3, #'0'
    strb w3, [x1], #1
    mov x3, #' '
    strb w3, [x1], #1
    ldr x0, [x2, #16]           // head = tmp_head.right
    bl inorder 
end_inorder:
    ldp x0, x2, [sp], #16
    ldp fp, lr, [sp], #16
    ret
