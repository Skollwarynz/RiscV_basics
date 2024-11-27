    .globl _start
    .data        
        array: .word 1,1,2,2,3,4,4,1
        x:     .word 6
        y:     .word 0
        
    .text
    _start:
        # chiama equal
        la   a0, array
        la   a1, x
        lw   a1, 0(a1)
        la   a2, y
        lw   a2, 0(a2)
        jal  ra, equal
        
        #exit
        li   a7, 10
        ecall
        
        equal:
      slli a1,a1,2
      slli a2,a2,2
      add a1,a0,a1
      add a2,a0,a2
      lw a1,0(a1)
      lw a2,0(a2)
      bne a1,a2,ELSE
      li a0,1
     ELSE:
      beq a2,a1,ENDELSE
      li a0,0
      ENDELSE:
    ret