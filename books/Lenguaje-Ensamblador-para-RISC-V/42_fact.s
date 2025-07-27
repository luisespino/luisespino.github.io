.global fact

fact:
    mv t0, a0               # number
    li t1, 1                # neutral value

rec: 
    beqz t0, end_rec        # if num == 0 end
    mul t1, t1, t0          # 2i num *= (num-1)
    add t0, t0, -1          # num--
    j rec

end_rec:
    mv a0, t1               # return fact(number)
    ret
    