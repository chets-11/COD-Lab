   .data
    .text
start:
    li x1, 5            
    li x2, 1            
    factorial_loop:
    mul x2, x2, x1      
    addi x1, x1, -1     
    bgt x1, x0, factorial_loop 
    halt:
    j halt              
