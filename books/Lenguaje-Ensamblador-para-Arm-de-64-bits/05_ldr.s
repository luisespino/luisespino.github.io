.global _start

.data
a: .word 1, 2, 3

.text
_start:
    ldr x1, =a               // x1 = address of a             
    ldr x0, [x1]	             // x0 = content of a
    
    mov x8, #93              // exit syscall
    svc #0

