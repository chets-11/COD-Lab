module ControlUnit (
    input  wire [6:0] opcode,      
    input  wire [2:0] funct3,      
    input  wire [6:0] funct7,      
    output reg   alu_src,     
    output reg [3:0]  alu_op,     
    output reg   mem_read,    
    output reg   mem_write,   
    output reg   reg_write,   
    output reg   branch,      
    output reg   jump,        
    output reg   mem_to_reg   
);

   always @(*) begin
        alu_src    = 1'b0;
        alu_op     = 4'b0000;
        mem_read   = 1'b0;
        mem_write  = 1'b0;
        reg_write  = 1'b0;
        branch     = 1'b0;
        jump       = 1'b0;
        mem_to_reg = 1'b0;

  case (opcode)
            // R-Type 
            7'b0110011: begin
                alu_src    = 1'b0;          
                reg_write  = 1'b1;          
                alu_op     = (funct7 == 7'b0100000) ? 4'b0001 : 4'b0000; // ADD/SUB
            end
            // I-Type
            7'b0010011: begin
                alu_src    = 1'b1;          
                reg_write  = 1'b1;          
                alu_op     = 4'b0000;       
            end
            7'b0000011: begin
                mem_read   = 1'b1;          
                reg_write  = 1'b1;          
                alu_src    = 1'b1;         
                mem_to_reg = 1'b1;          
            end
            // S-Type
            7'b0100011: begin
                mem_write  = 1'b1;         
                alu_src    = 1'b1;          
            end
            // B-Type 
            7'b1100011: begin
                branch     = 1'b1;          
                alu_op     = 4'b0010;       
            end
            // J-Type 
            7'b1101111: begin
                jump       = 1'b1;          
                reg_write  = 1'b1;          
            end
            // U-Type 
            7'b0110111: begin
                reg_write  = 1'b1;          
            end
            7'b0010111: begin
                alu_src    = 1'b1;         
                reg_write  = 1'b1;         
            end
            default: begin
            end
        endcase
    end
endmodule
