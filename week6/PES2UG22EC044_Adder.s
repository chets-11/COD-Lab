module adder (
    input wire [3:0] a,    
    input wire [3:0] b,   
    input wire cin,        
    output wire [3:0] sum, 
    output wire cout       
);
 assign {cout, sum} = a + b + cin; // Perform addition with carry-in and produce sum and carry-out
endmodule
