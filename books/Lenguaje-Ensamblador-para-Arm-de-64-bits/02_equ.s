.global _start

.equ MAX, 100
 
.text
_start:
      mov x0, MAX            // x0 = 100
      
      mov x8, #93            // exit syscall number
      svc #0	                 // syscall
      
