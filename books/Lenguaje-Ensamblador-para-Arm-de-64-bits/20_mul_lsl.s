.global _start

_start:
    mov x1, #32             // load number to multiply, 32
    mov x2, #2              // load exp in power 2 of 4
    lslv x0, x1, x2          // s0 = 32 * 4
	
    mov x8, #93             // exit syscall
    svc #0
