module instr_fetch (
    input  logic        clk,
    input  logic        rst,
    input  logic [31:0] pc_imm,
    input  logic        sel,
    output logic [31:0] inst
);
    logic [31:0] pc, pc_next, sum;
    program_counter p_c (
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),
        .pc(pc)
    );
half_adder half (
        .a(pc),
        .b(32'h4),
        .sum(sum)
    );
mux mu (
        .a(sum),
        .b(pc_imm),
        .sel(sel),
        .y(pc_next)
    );
memory mem (
        .clk(clk),
        .addr(pc),
        .inst(inst)
    );
endmodule
