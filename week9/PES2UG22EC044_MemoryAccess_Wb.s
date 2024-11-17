
module MemAccessWriteback(
    input  wire  clk,              
    input  wire  rst,              
    input  wire [31:0] alu_result,       
    input  wire [31:0] write_data,       
    input  wire [31:0] mem_read_data,    
    input  wire [6:0]  opcode,           
    input  wire [2:0]  funct3,           
    input  wire   mem_read_en,      
    input  wire   mem_write_en,     
    output reg  [31:0] wb_result         
);

  always @(*) begin
        wb_result = 32'b0; 

  case (opcode)
            // Load instructions 
            7'b0000011: begin
                if (mem_read_en) begin
                    case (funct3)
                        3'b000: wb_result = {{24{mem_read_data[7]}}, mem_read_data[7:0]};  // LB
                        3'b001: wb_result = {{16{mem_read_data[15]}}, mem_read_data[15:0]}; // LH 
                        3'b010: wb_result = mem_read_data;                                // LW 
                        3'b100: wb_result = {24'b0, mem_read_data[7:0]};                   // LBU 
                        3'b101: wb_result = {16'b0, mem_read_data[15:0]};                  // LHU 
                        default: wb_result = 32'b0; // Invalid funct3
                    endcase
                end
            end
            7'b0110011, 7'b0010011: begin
                wb_result = alu_result; 
            end
            // Store instructions 
            7'b0100011: begin
                if (mem_write_en) begin
                    wb_result = 32'b0; // No writeback
                end
            end
            default: wb_result = 32'b0;
        endcase
    end

endmodule
