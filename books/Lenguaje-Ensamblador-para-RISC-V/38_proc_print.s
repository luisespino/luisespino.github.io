.global _start

.data
msg1: .string "First message!!\n"
msg2: .string "Second message!\n"
msg3: .string "Third message!!\n"

.text
_start:
    la a1, msg1        
    jal print               # call print with msg1

    la a1, msg2
    jal print               # call print with msg2

    la a1, msg3
    jal print               # call print with msg3
 
    li a7, 93               # exit 
    ecall                   # (without using a0-a1)
	
print:                      # function print
    li a0, 1
    li a2, 16
    li a7, 64
    ecall
    ret
