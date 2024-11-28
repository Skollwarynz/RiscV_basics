.globl _start
.data
  size:  .word  10
  array: .word  3,4,5,6,2,12,20,30,30,5

.text
_start:
    # chiama issorted
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, issorted
    
    #exit
    li   a7, 10
    ecall
    
 
 issorted:
la t0,size
lw t1,0(t0) #size
addi t1,t1,-1 #size-1
la t0,array 
li t3,0 #i
LOOP:
    bge t3,t1,ENDLOOP
    lw t2,0(t0)
    lw t4,4(t0)
    ble t2,t4,ENDIF
        li a0,0
        j END
    ENDIF:
    addi t0,t0,4
    addi t3,t3,1
    j LOOP
ENDLOOP:
li a0,1
END:
ret