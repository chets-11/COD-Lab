module instruction_execute(
    input wire clk,                
    input wire reset,              
    input wire [31:0] rs1_data,    
    input wire [31:0] rs2_data,    
    input wire [31:0] imm,         
    input wire [6:0] opcode,       
    input wire [2:0] funct3,       
    input wire [6:0] funct7,       
    input wire branch_taken,       
    input wire [31:0] branch_pc,  
    output reg [31:0] result,      
    output reg zero_flag,          
    output reg branch_flag         
);
    always @(*) begin
        // Default to no branch
        branch_flag = 0;
        zero_flag = 0;
        result = 32'b0;
        if (opcode == 7'b1100011) begin 
            case (funct3)
                3'b000: begin 
                    if (rs1_data == rs2_data) begin
                        branch_flag = 1;
                        result = branch_pc;  
                    end
                    zero_flag = (rs1_data == rs2_data);  
                end
                3'b001: begin 
                    if (rs1_data != rs2_data) begin
                        branch_flag = 1;
                        result = branch_pc;  
                    end
                    zero_flag = (rs1_data != rs2_data); 
                end
                
  default: begin
                    branch_flag = 0;  
                    result = 32'b0;
                end
            endcase
        end
        else begin
            case (funct3)
                3'b000: begin
                    if (funct7 == 7'b0000000) begin
                        result = rs1_data + rs2_data;
                    end else if (funct7 == 7'b0100000) begin
                        result = rs1_data - rs2_data;
                    end
                end
                3'b001: begin
                    result = rs1_data << rs2_data[4:0];
                end
                3'b010: begin
                    result = (rs1_data < rs2_data) ? 1 : 0;
                end
                3'b011: begin
                    result = ($unsigned(rs1_data) < $unsigned(rs2_data)) ? 1 : 0;
                end
                3'b100: begin
                    result = rs1_data ^ rs2_data;
                end
                3'b101: begin
                    result = rs1_data >> rs2_data[4:0];
                end
                3'b110: begin
                    result = rs1_data | rs2_data;
                end
                3'b111: begin
                    result = rs1_data & rs2_data;
                end
                default: begin
                    result = 32'b0;
                end
            endcase
        end
    end

endmodule
