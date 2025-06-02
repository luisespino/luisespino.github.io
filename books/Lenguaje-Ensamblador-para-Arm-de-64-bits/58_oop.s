.global _start

/*
class point {
    udigit x; 
    udigit y; 
    set_point(x, y); 
    get_point();
}
*/

.data
point: .byte 0, 0               // x, y
msg:   .asciz "Point:  ,  \n"

.text
set_point:                      // set_point: args x0 = x, x1 = y
    ldr x2, =point              // load point address
    strb w0, [x2]               // store x
    strb w1, [x2, #1]           // store y
    ret                         // return

get_point:                      // get_point: no args
    ldr x3, =point              // x3 = &point
    ldr x4, =msg                // x4 = &msg

    ldrb w5, [x3]               // load x into w5
    add  w5, w5, #48            // convert to ASCII
    strb w5, [x4, #7]           // store at msg[7]

    ldrb w5, [x3, #1]           // load y into w5
    add  w5, w5, #48            // convert to ASCII
    strb w5, [x4, #10]          // store at msg[10]

    mov  x0, #1                 // print msg
    ldr  x1, =msg                
    mov  x2, #12                 
    mov  x8, #64               
    svc  #0
    ret

_start:
    mov x0, #3                  // test x = 3, y = 7
    mov x1, #7
    bl set_point
    bl get_point

    mov x0, #5                  // test x = 5, y = 2
    mov x1, #2
    bl set_point
    bl get_point

    mov x0, #0                  // exit
    mov x8, #93                   
    svc #0
