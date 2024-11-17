module sign_extend(
    input logic [11:0] imm,          
    input logic [6:0] opcode,          
    output logic [31:0] s_imm          
);

   always_comb begin
        case(opcode)
            7'b0010011: begin 
                s_imm = {{20{imm[31]}}, imm[11:0]};
            end
            default: s_imm = 32'h0;
        endcase
    end
endmodule
