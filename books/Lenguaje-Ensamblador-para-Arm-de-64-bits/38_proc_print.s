.global _start

.data
msg1: .asciz "First message  !!\n"
msg2: .asciz "Second message !!\n"
msg3: .asciz "Third message  !!\n"

.text
_start:
    ldr x1, =msg1           // Load address of msg1 into x1
    bl print                // Branch to print (msg1)

    ldr x1, =msg2           // Load address of msg2 into x1
    bl print                // Branch to print (msg2)

    ldr x1, =msg3           // Load address of msg3 into x1
    bl print                // Branch to print (msg3)

    mov x8, #93             // exit
    svc #0                  

print:
    mov x0, #1              // stdout
    mov x2, #18             // length of message
    mov x8, #64             // syscall number for write
    svc #0
    ret
