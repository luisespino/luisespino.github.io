.global _start

.data
a: .byte 0

.text
_start:
    ldr x1, =a              // x1 = address of a
    mov x2, #10             // x2 = 10
    strb w2, [X1]           // a = 10
    ldrb w0, [X1]           // return a

    mov x8, #93             // exit
    svc #0

