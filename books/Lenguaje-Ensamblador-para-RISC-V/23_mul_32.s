.global _start

.data
dword1: .dword 0xFFFFFFFFFFFFFFFF
dword2: .dword 0x00000000FFFFFFF0
 
.text
_start:
    ld t0, dword1           # load dword1
    ld t1, dword2           # load dword2
    subw t2, t0, t1         # t2 = t0 - t1 (32 bits limited)
      
    mv a0, t2               # exit
    li a7, 93
    ecall
    