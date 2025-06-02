.global _start

_start:
    mov x0, #1                  // result and neutral
    mov x1, #4                  // number
    bl factorial                // fact(number)

    mov x8, #93                 // exit
    svc #0

factorial:
    stp fp, lr, [sp, #-16]!     // preserve fp lr 
    mov fp, sp                  // set frame pointer
    cmp x1, #1               
    beq end                     // if x1==1 end
    mul x0, x0, x1              // number * (number-1)
    add x1, x1, #-1             // counter--
    bl factorial
end:  
    ldp fp, lr, [sp], #16       // restore fp lr
    ret
