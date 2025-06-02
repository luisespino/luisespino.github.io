.global _start

.data
a: .quad 7, 4, 3, 9, 1
b = 5

.bss
c: .space 11

.text
_start:
    ldr x0, =a                  // load array and call sort
    mov x1, b
    bl sort

    ldr x0, =a                  // load array and call array_to_buffer
    mov x1, b
    ldr x2, =c
    bl array_to_buffer

    mov x0, #1                  // print buffer
    ldr x1, =c
    mov x2, #11
    mov x8, #64
    svc #0

    mov x8, #93                 // exit
    svc #0

sort:
    mov x2, #0                  // initialization
    mov x3, #0
    mov x4, #0
for_i:
    sub x5, x1, #1              // condition of i
    cmp x3, x5
    bge end_for_i
    add x4, x3, #1
for_j:
    cmp x4, x1                  // condition of j
    bge end_for_j
    lsl x19, x3, #3
    lsl x20, x4, #3
    add x19, x19, x0
    add x20, x20, x0
    ldr x21, [x19]
    ldr x22, [x20]
    cmp x21, x22                // if x21 <= x22
    ble no_swap
    ldr x23, [x19]              // swap
    ldr x24, [x20]
    str x24, [x19]
    str x23, [x20]
    add x2, x2, #1
no_swap:                        // j++
    add x4, x4, #1
    b for_j
end_for_j:                      // i++
    add x3, x3, #1
    b for_i
end_for_i: 
    ret


array_to_buffer:                // convert array to buffer
loop:
    cmp x1, #0
    beq end_loop
    ldr x3, [x0]
    add x3, x3, #'0'            // adjust ASCII
    strb w3, [x2]
    add x0, x0, #8
    add x2, x2, #1
    mov x3, ' '                 // add white space
    strb w3, [x2]
    add x2, x2, #1
    sub x1, x1, #1
    b loop
end_loop:                       // add new linea an oef
    mov x3, #10
    strb w3, [x2]
    strb wzr, [x2, #1]
    ret


 
