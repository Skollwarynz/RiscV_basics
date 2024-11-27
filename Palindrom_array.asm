    .data
        array: .word 1,2,3,3,2,1
        size:  .word 6
    .text
    _start:
        # chiama palindrome
        la   a0, array
        la   a1, size
        lw   a1, 0(a1)
        jal  ra, palindrome
        
        #exit
        li   a7, 10
        ecall
        
        palindrome:
  addi sp,sp,-32
  sd s1,0(sp)
  sd s2,8(sp)
  sd s3,16(sp)
  sd ra,24(sp)  
  
  li s1,0 #i
  addi s2,a1,-1 #j
  li s3,1
  WHILE:
 bge s1,s2,ENDWHILE
    la a0,array
    mv a1,s1
    mv a2,s2
    jal ra,equal
    and s3,s3,a0
   addi s1,s1,1
   addi s2,s2,-1
   beq x0,x0,WHILE
  ENDWHILE:
  mv a0,s3
  
  ld ra,24(sp)
  ld s3,16(sp)
  ld s2,8(sp)
  ld s1,0(sp)
  addi sp,sp,32
 ret