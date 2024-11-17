module decoder(
    input logic [31:0] inst,            
    output logic [11:0] imm,            
    output logic [2:0] funct3,          
    output logic [6:0] funct7,          
    output logic [6:0] opcode,          
    output logic [4:0] rd_addr,         
    output logic [4:0] rs1_addr,        
    output logic [4:0] rs2_addr,        
    
  output logic is_r_type,
    output logic is_i_type,
    output logic is_s_type,
    output logic is_load_type,
    output logic is_b_type
);
    assign opcode    = inst[6:0];
    assign funct3    = inst[14:12];
    
  assign funct7    = (opcode == 7'b0110011) ? inst[31:25] : 7'b0; // Only for R-type
    assign rs1_addr  = inst[19:15];
    assign rs2_addr  = (opcode == 7'b0110011 || opcode == 7'b0100011 || opcode == 7'b1100011) ? inst[24:20] : 5'b0; // R-type, S-type, B-type
    assign rd_addr   = (opcode == 7'b0110011 || opcode == 7'b0010011 || opcode == 7'b0000011) ? inst[11:7] : 5'b0; // R-type, I-type, Load-type

   
   always_comb begin
        case(opcode)
            // I-type, Load-type
            7'b0010011, 7'b0000011: imm = { {20{inst[31]}}, inst[31:20] };
            // S-type
            7'b0100011: imm = { {20{inst[31]}}, inst[31:25], inst[11:7] };
            // B-type
            7'b1100011: imm = { {20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0 };
            default: imm = 32'b0;  // Default to 0 for non-imm types
        endcase
    end

  always_comb begin
        // Initialize all instruction type flags to 0
        is_r_type     = 0;
        is_i_type     = 0;
        is_s_type     = 0;
        is_load_type  = 0;
        is_b_type     = 0;
        
  case(opcode)
            7'b0110011: is_r_type    = 1;  // R-type
            7'b0010011: is_i_type    = 1;  // I-type (Arithmetic Immediate)
            7'b0000011: is_load_type = 1;  // I-type (Load)
            7'b0100011: is_s_type    = 1;  // S-type (Store)
            7'b1100011: is_b_type    = 1;  // B-type (Branch)
            default: begin
            is_r_type     = 0;
                is_i_type     = 0;
                is_s_type     = 0;
                is_load_type  = 0;
                is_b_type     = 0;
            end
        endcase
    end
endmodule
