.global _start

_start:
    mov x1, #07400          // load number to divide, 3840
    lsr x0, x1, #04         // x0 = 3840/16
    
    mov x8, #93             // exit syscall
    svc #0

