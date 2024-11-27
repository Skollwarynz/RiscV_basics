.globl _start
.data
    num: .dword 5
.text
_start:
    # call fib
    la    a0, num
    ld    a0, 0(a0)
    jal   ra, fib

    #exit
    li    a7, 10
    ecall
    
    
    fib:
    bne a0,zero,CASE_1
        li a0,0
        ret
    CASE_1:
        li t0,1
        bne a0,t0,CASE_2
        li a0,1
        ret
    CASE_2:
        addi sp,sp,-24
        sd ra,0(sp)
        sd s1,8(sp)
        sd a0,16(sp)
        
        
        addi a0,a0,-1
        jal ra,fib
        addi s1,a0,0
        
        ld a0,16(sp)
        
        addi a0,a0,-2
        jal ra,fib
        add a0,a0,s1
        
        ld s1,8(sp)
        ld ra,0(sp)
        addi sp,sp,24
        
        ret
    
    
        