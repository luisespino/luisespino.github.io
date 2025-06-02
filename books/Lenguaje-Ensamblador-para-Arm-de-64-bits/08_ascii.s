.global _start

.data
a: .word 0
s: .string "hola"

.text
_start:
    ldr x1, =s              // x1 = address of a
    ldr x2, [x1, #3]        // x2 = x1 content
    ldr x3, =a              // x3 = address of b
    strb w2, [x3]           // b = w2
    ldr x0, [x3]            // return b

    mov x8, #93             // exit
    svc #0	
