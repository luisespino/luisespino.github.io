    # SET POINTERS OF PD Y PD DATA
    
    li a0, 0x02000000           # GPIO base address
    addi a1, a0, 0x0094         # PD configuration
    addi a2, a0, 0x00A0         # PD data
    
    # ENABLE PD14

    li t0, 0xF0FFFFFF           # mask to clean PD14
    li t1, 0x01000000           # mask to set 0b0001 in PD14
    lw t2, (a1)                 # load PD configuration
    and t3, t0, t2              # clean PD14
    or t3, t1, t2               # set 0b0001 in PD14
    sw t3, (a1)                 # store word with new PD14
    
    # SET 1 TO PD14 DATA

    
    li t0, 1                    # load 1
    sw t0, (a2)                 # set 1 in PD data
    
    # SET 0 TO PD14 DATA

    li t0, 0                    # load 0
    sw t0, (a2)                 # set 1 in PD data
    
    # DISABLE PD14

    li t0, 0xF0FFFFFF           # mask to clean PD14
    li t1, 0x0F000000           # mask to set 0b1111 in PD14
    lw t2, (a1)                 # load PD configuration
    and t3, t0, t2              # clean PD14
    or t3, t1, t2               # set 0b1111 in PD14
    sw t3, (a1)                 # store word with new PD14
    