module regfile(
    input logic clk,
    input logic reset,
    input logic wr_en,                
    input logic [4:0] rd_addr,         
    input logic [4:0] rs1_addr,        
    input logic [4:0] rs2_addr,        
    input logic [31:0] wr_data,       
    output logic [31:0] rs1,           
    output logic [31:0] rs2            
);

    
  logic [31:0] registers [31:0];

    
  assign rs1 = registers[rs1_addr];
    assign rs2 = registers[rs2_addr];

   
   always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            registers[0] <= 32'h0; 
        end else if (wr_en) begin
            registers[rd_addr] <= wr_data;
        end
    end
endmodule
