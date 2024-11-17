module mux3to1 (
    input wire [1:0] sel,  
    input wire a,          
    input wire b,          
    input wire c,          
    output wire y         
);
  always @(*) begin
        case(sel)
            2'b00: y = a;  
            2'b01: y = b;  
            2'b10: y = c;  
            default: y = 1'bx;  
        endcase
    end
    endmodule
