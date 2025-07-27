.global _start

.data
a: .word 0
s: .ascii "hola"

.text
_start:
    la t0, s                # load s address
    lb t1, 3(t0)            # load third byte of s
    
    la t2, a                # load a address
    sw t1, (t2)             # store s[3] in a
    lw a0, (t2)             # return a

    li a7, 93               # exit
    ecall
