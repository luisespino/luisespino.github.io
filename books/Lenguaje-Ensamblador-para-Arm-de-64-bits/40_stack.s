.global _start

.text
_start:
    bl fun                      // call fun (branch with link stores return addr in x30)
    
    mov x8, #93                 // exit
    svc #0                      

fun:
    stp lr, fp, [sp, #-16]!     // push lr and fp to stack (16B aligned)
    mov x0, #10                 // load return value into x0
    ldp lr, fp, [sp], #16       // pop lr and fp from stack
    ret                         // return
