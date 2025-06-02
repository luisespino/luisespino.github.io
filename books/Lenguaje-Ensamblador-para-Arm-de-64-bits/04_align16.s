.global _start

.data
b: .word 1, 2
.align 4                     // .data alignment to 16 bytes         

.text
_start:
    mov X8, #93
    svc #0
    .balign 16               // .text alignment to 16 bytes  

