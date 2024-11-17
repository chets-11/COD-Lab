.data
a: .byte 0b00000011        
.text
    la x1, a               
    lbu x2, 0(x1)          
    addi x4, x0, 0x20      
    bltu x2, x4, loop      
    beq x0, x0, false      
loop:
    addi x6, x0, 0         
count_ones:
    andi x5, x2, 0x01      
    add x6, x6, x5         
    srli x2, x2, 1         
    bne x2, x0, count_ones 
    addi x4, x0, 0x02      
    bgtu x6, x4, false     
    bltu x6, x4, false     
    addi x20, x0, 0x01     
    beq x0, x0, exit       
false:
    addi x20, x0, 0x02     
exit:
    addi x0, x0, 0
