.global _start

.data
string1: .string "Hello, World!\n"

.bss
string2: .space 15

.text
_start:
    la t0, string1          # load string1 address
    la t1, string2          # load string2 address
loop:
    lb t2, (t0)             # load byte of string1
    beqz t2, end            # branch to end if t2 == 0
    sb t2, (t1)             # store byte to string 2
    addi t0, t0, 1          # implicit offset increment
    addi t1, t1, 1          # implicit offset increment
    j loop                  # jump to loop
end:
    li a0, 1                # print new copied string2
    la a1, string2
    li a2, 15
    li a7, 64
    ecall
	
    li a7, 93               # exit
    ecall 
