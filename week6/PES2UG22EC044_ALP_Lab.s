  .data
array:  .word 8, 3, 1, 6, 2, 5, 4, 7    
n:      .word 8                         
.text
main:
    la x5, array         
    lw x6, n             
    li x7, 0             
outer_loop:
    sub x8, x6, x7       
    addi x8, x8, -1      
    beqz x8, end         
    li x9, 0             
inner_loop:
    beq x9, x8, outer_increment 
    slli x10, x9, 2      
    add x11, x5, x10     
    lw x12, 0(x11)       
    lw x13, 4(x11)       
    ble x12, x13, skip_swap 
    sw x13, 0(x11)       
    sw x12, 4(x11)       
skip_swap:
    addi x9, x9, 1       
    j inner_loop         
outer_increment:
    addi x7, x7, 1       
    j outer_loop         

end:
    nop                  
