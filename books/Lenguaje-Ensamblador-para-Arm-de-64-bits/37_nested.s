.global _start

.bss
pattern: .skip 36           // reserver space for print

.text
_start:
    ldr x0, =pattern        // load pattern address
    mov x1, #'5'            // end = 5
    mov x2, #'1'            // i = 1

loop1:
    cmp x2, x1              // branch endloop1 if i > end
    bgt endloop1            
    mov x3, #'1'            // j = 1

loop2:
    cmp x3, x2              // branch endloop2 if j > i
    bgt endloop2
    strb w3, [x0]           // store byte j
    add x0, x0, #1          // offset++
    mov x4, #' '            // load space
    strb w4, [x0]           // store space
    add x0, x0, #1          // offset++
    add x3, x3, #1          // j++
    b loop2

endloop2:
    add x2, x2, #1          // i++
    mov x4, #10             // load new line
    strb w4, [x0]           // store new line
    add x0, x0, #1          // offset++
    b loop1

endloop1:
    strb wzr, [x0]          // store EOF
    mov x0, #1              // print pattern
    ldr x1, =pattern
    mov x2, #36
    mov x8, #64
    svc #0

    mov x0, #0              // exit
    mov x8, #93
    svc #0
