.global _start

# class point {udigit x; udigit y; set_point(x, y); get_point();}
.data
point: .byte 0, 0               # x, y
msg: .string "Point:  ,  \n"

.text
set_point:                      # args: a0 = x; a1 = y
    la a2, point                # load point address
    sb a0, 0(a2)                # store x            
    sb a1, 1(a2)                # store y
    ret                         # return

get_point:                      # args: none
    la t0, point
    la t1, msg

    lb t2, 0(t0)                # load x and store in msg
    add t2, t2, 48
    sb t2, 7(t1)

    lb t2, 1(t0)                # load y and store in msg
    add t2, t2, 48
    sb t2, 10(t1)

    li a0, 1                    # print msg
    la a1, msg
    li a2, 12
    li a7, 64
    ecall

    ret                         # return

_start:
    li a0, 3                    # test x = 3, y = 7
    li a1, 7
    jal set_point
    jal get_point	

    li a0, 5                    # test x = 5, y = 2
    li a1, 2
    jal set_point
    jal get_point	

    li a7, 93                   # exit
    ecall
