.global _start

_start:
    mov x1, #-180           // load number -180
    neg x0, x1              // calculate the two's complement

    mov x8, #93             // exit syscall
    svc #0
