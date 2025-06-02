.global _start

_start:
    mov x1, #0b10010        // initial state
    mov x2, #0b101          // new data from sensors
    orr x0, x1, x2          // update state

    mov x8, #93             // exit syscall
    svc #0


