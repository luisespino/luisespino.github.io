.global _start

.data
message: .asciz "Woke up after 8 seconds!\n"
len = . - message

.section .rodata
timespec:
    .quad 5                 // tv_sec: 8 seconds (64 bits)
    .quad 0                 // tv_nsec: 0 nanoseconds (64 bits)

.text
_start:
    ldr x0, =timespec       // timespec struct (aligned)
    mov x1, #0              // rem = NULL
    mov x8, #101            // load NANOSLEEP
    svc #0

    mov x8, #64             // print MSG
    mov x0, #1           
    ldr x1, =message     
    ldr x2, =len         
    svc #0

    mov x0, #0              // exit
    mov x8, #93          
    svc #0
