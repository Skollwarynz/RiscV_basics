.globl _start
.data
    num: .dword 10
.text
_start:
    # call serief
    la    a0, num
    lw    a0, 0(a0)
    jal   ra, serief

    #exit
    li    a7, 10
    ecall
    
    
    serief:
fib:
    li t0,3
    bgt a0,t0,CASE_1
        li a0,1
        ret
    CASE_1:
        addi sp,sp,-24
        sd ra,0(sp)
        sd s1,8(sp)
        sd a0,16(sp)
        
        li s1,0
        
        addi a0,a0,-1
        jal ra,fib
        add s1,a0,s1
        
        ld a0,16(sp)
        
        addi a0,a0,-2
        jal ra,fib
        add s1,a0,s1
        
        ld a0,16(sp)        
        
        addi a0,a0,-3
        jal ra,fib
        add a0,a0,s1
        
        ld s1,8(sp)
        ld ra,0(sp)
        addi sp,sp,24
        
        ret