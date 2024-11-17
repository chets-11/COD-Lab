module ALU(
    input  wire [31:0] A,            
    input  wire [31:0] B,            
    input  wire [3:0] ALU_ctrl,     
    input  wire [6:0] opcode,        
    input  wire [2:0] funct3,        
    input  wire [6:0] funct7,        
    input  wire branch_taken,        
    input  wire [31:0] branch_pc,    
    output reg [31:0] result,        
    output reg zero_flag,            
    output reg branch_flag           
);
    always @(*) begin
        result = 32'b0;            
        zero_flag = 0;             
        branch_flag = 0;           
      
  if (opcode == 7'b0110011) begin
            case (funct3)
                3'b000: begin
                    if (funct7 == 7'b0000000) begin
                        result = A + B;      
                    end else if (funct7 == 7'b0100000) begin
                        result = A - B;       
                    end
                end
                3'b001: begin
                    result = A << B[4:0];    
                end
                3'b010: begin
                    result = (A < B) ? 1 : 0; 
                end
                3'b100: begin
                    result = A ^ B;           
                end
                3'b101: begin
                    if (funct7 == 7'b0000000) begin
                        result = A >> B[4:0];   
                    end else if (funct7 == 7'b0100000) begin
                        result = $signed(A) >>> B[4:0]; 
                    end
                end
                3'b110: begin
                    result = A | B;          
                end
                3'b111: begin
                    result = A & B;         
                end
                default: result = 32'b0;   
            endcase
        end
        
       
   else if (opcode == 7'b0010011) begin
            case (funct3)
                3'b000: begin
                    result = A + B;           
                end
                3'b100: begin
                    result = A ^ B;           
                end
                3'b110: begin
                    result = A | B;           
                end
                3'b111: begin
                    result = A & B;           
                end
                3'b001: begin
                    result = A << B[4:0];     
                end
                3'b101: begin
                    result = A >> B[4:0];     
                end
                default: result = 32'b0;     
            endcase
        end
        else if (opcode == 7'b0100011) begin
            // Store operation: Address calculation (rs1 + imm)
            result = A + B;               // Result is address calculation (rs1 + imm)
        end
        
        
  else if (opcode == 7'b1100011) begin
            case (funct3)
                3'b000: begin
                    if (A == B) begin
                        branch_flag = 1;
                        result = branch_pc;  
                    end
                    zero_flag = (A == B); 
                end
                3'b001: begin 
                    if (A != B) begin
                        branch_flag = 1;
                        result = branch_pc;  
                    end
                    zero_flag = (A != B); 
                end
                3'b100: begin 
                    if ($signed(A) < $signed(B)) begin
                        branch_flag = 1;
                        result = branch_pc; 
                    end
                    zero_flag = ($signed(A) < $signed(B));
                end
                3'b101: begin 
                    if ($signed(A) >= $signed(B)) begin
                        branch_flag = 1;
                        result = branch_pc;  
                    end
                    zero_flag = ($signed(A) >= $signed(B));
                end
                default: result = 32'b0;  
            endcase
        end
      else if (opcode == 7'b1101111) begin
            result = branch_pc;  
            branch_flag = 1;     
        end
        
  else if (opcode == 7'b0110111) begin
            result = {B[31:12], 12'b0};  
        end
        else if (opcode == 7'b0010111) begin
            result = A + {B[31:12], 12'b0};  
        end
        else begin
            result = 32'b0;  
        end
    end
endmodule
