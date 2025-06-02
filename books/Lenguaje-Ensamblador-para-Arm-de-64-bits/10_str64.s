str.global _start

.data
a: .dword 0xFFFFFFFF00000000
b: .word 0xFFFFFFFF

.text
_start:
    ldr x1, =a              // x1 = address of a
    ldr x2, =b              // x2 = address of b
    ldr x3, [X2]            // x3 = 0xFFFFFFFF
    str x3, [X1]            // a = 0xFFFFFFFFFFFFFFFF
    ldrb w0, [X1]           // return 0xFF

    mov x8, #93             // exit
    svc #0
	
