.global _start

.data
dword1: .dword 0x00FFFFFFFFFFFFFF
dword2: .dword 0x000000FF00000001
 
.text
_start:
    ldr x1, =dword1         // load dword1 address
    ldr x2, [x1]            // load dword1 value
    ldr x3, =dword2         // load dword2 address
    ldr x4, [x3]            // load dword2 value    
    mul w0, w2, w4          // w0 = lo:dword1 * lo:dword2 (32 bits limited)

    mov x8, #93             // exit syscall
    svc #0
