module instr_decode(
    input logic clk,
    input logic reset,
    input logic [31:0] inst,          
    input logic [31:0] wr_data,       
    input logic wr_en,                

output logic [31:0] rs1,          
    output logic [31:0] rs2,          
    output logic [31:0] s_imm,        
    output logic [2:0] funct3,        
    output logic [6:0] funct7        
);

    
logic [31:0] imm;
    logic [6:0] opcode;
    logic [4:0] rd_addr, rs1_addr, rs2_addr;

   
 decoder d1(
        .inst(inst),
        .imm(imm),
        .funct3(funct3),
        .funct7(funct7),
        .opcode(opcode),
        .rd_addr(rd_addr),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr)
    );
    regfile rgf(
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_addr(rd_addr),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .wr_data(wr_data),
        .rs1(rs1),
        .rs2(rs2)
    );

    
sign_extend si(
        .imm(imm),
        .opcode(opcode),
        .s_imm(s_imm)
    );

endmodule
