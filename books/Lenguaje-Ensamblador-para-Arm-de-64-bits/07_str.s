.global _start

.data
a: .word 10

.bss
b: .space 8

.text
_start:
    ldr x1, =a                      // X1 = address of a
    ldr x2, [X1]                    // X2 = X1 content
    ldr x3, =b                      // X3 = address of b
    str x2, [X3]                    // b = X2
    ldr x0, [X3]                    // return b

    mov x8, #93                     // exit
    svc #0
    
