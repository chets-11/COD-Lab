  .data
a:  .word 0x1234, 0x5678, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777, 0x8888, 0x9999 
b:  .word 0x1234, 0x5678, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777, 0x8888, 0x9999 
c:  .word 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 

.text
main:
    la x5, a              
    la x6, b              
    la x7, c             
    li x8, 0              
loop:
    li x9, 10             
    bge x8, x9, end       
    lh x10, 0(x5)         
    lh x11, 0(x6)         
    mul x12, x10, x11     
    beqz x8, no_prev      
    lh x13, -2(x7)        
    add x12, x12, x13     
no_prev:
    sh x12, 0(x7)         
    addi x5, x5, 2        
    addi x6, x6, 2        
    addi x7, x7, 2        
    addi x8, x8, 1       
    j loop               

end:
    nop                
