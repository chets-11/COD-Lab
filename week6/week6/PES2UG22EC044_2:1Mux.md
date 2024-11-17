module mux2to1 (
    input wire sel,  
    input wire a,    
    input wire b,    
    output wire y  
);
  always @(*) begin
        if (sel)         
            y = b;
        else             
            y = a;
    end
endmodule
