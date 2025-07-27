.global _start

.data
filename: .asciz "test.txt"
buffer: .asciz "Hello\nWorld!\n"

.text
_start:
    li a0, -100             # load AT_FDCWD
    la a1, filename         # load filename
    li a2, 101              # O_CREAT | O_WRONLY
    li a3, 0777             # load octal 777 
    li a7, 56               # load OPENAT
    ecall                   # syscall
    mv s1, a0               # preserve file descriptor FD

    mv a0, s1               # load FD
    la a1, buffer           # write buffer in file
    li a2, 14
    li a7, 64
    ecall

    mv a0, s1               # load FD
    li a7, 57               # close file
    ecall

    li a7, 93               # exit
    ecall   
