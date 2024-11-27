.globl _start
.data
    srcstr: .string  "string to copy"
    dststr: .string  "string of destinazion"
.text
_start:
    
    # chiama strcpy    
    la   a0, srcstr
    la   a1, dststr
    jal  ra, strcpy

    #exit
    li   a7, 10
    ecall
    
strcpy:
    addi sp,sp,-40
    sd ra,0(sp)
    sd s1,8(sp)
    sd s2,16(sp)
    sd s3,24(sp)
    sd s4,32(sp)
    
    la s3,srcstr
    la s4,dststr

    jal ra,strlen
    mv s1,a0 #n
    mv a0,s4
    jal ra,strlen
    mv s2,a0 #m
    
    li t0,0
    LOOP:
        bge t0,s1,ENDLOOP
        add t1,s3,t0  #srcstr[i]
        add t2,s4,t0  #dststr[i]
        lbu t3,0(t1)
        sb t3,0(t2)
        addi t0,t0,1
        j LOOP
    ENDLOOP:
    
    FOOR:
        bge t0,s2,ENDFOOR
        add t2,s4,t0  #dststr[i]
        li t3,0
        sb t3,0(t2)
        addi t0,t0,1
        j FOOR
    ENDFOOR:
    
    ld s4,32(sp)
    ld s3,24(sp)
    ld s2,16(sp)
    ld s1,8(sp)
    ld ra,0(sp)
    addi sp,sp,40

ret 