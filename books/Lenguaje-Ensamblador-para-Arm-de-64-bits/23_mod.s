.global _start

_start:
    mov x0, #10             // x
    mov x1, #3              // n

    sdiv x2, x0, x1         // x / n
    mul x2, x2, x1          // x / n * n
    sub x2, x0, x2          // x - (x / n * n)

    mov x0, x2              // exit
    mov x8, #93
    svc #0
