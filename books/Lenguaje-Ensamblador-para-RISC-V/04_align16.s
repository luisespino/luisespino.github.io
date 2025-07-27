.global _start

.data
b: .word 1, 2
.align 4                    # .data alignment to 16 bytes         

.text
_start:
    li a7, 93
    ecall
    .balign 16              # .text alignment to 16 bytes  

