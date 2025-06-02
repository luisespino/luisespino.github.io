.global _start

.data
a: .word 1, 2, 3, 4          // array a

.text
_start:
    ldr x1, =a               // x1 = address of a
    mov x2, #8               // x2 = 8 (offset)
    ldr x0, [X1, X2]         // x0 = [x1 + x2] (content)

    mov x8, #93              // exit syscall
    svc #0
