.global _start

.data
a: .word -1, -2, -3

.text
_start:
    ldr x0, =a              // load address of a
    ldr x1, [x0]            // load index 0 value
    ldr x2, [x0, 4]         // load index 1 value
    ldr x3, [x0, 8]         // load index 2 value
    
    add x0, x1, x2          // x0 = x1 + x2
    add x0, x0, x3          // x0 = x0 + x3
    neg x0, x0              // x0 = -x0
    
    mov x8, #93             // exit syscall
    svc #0
