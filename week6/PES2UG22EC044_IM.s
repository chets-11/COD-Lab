module memory (
    input  logic        clk,
    input  logic [31:0] addr,
    output logic [31:0] inst
);
    logic [31:0] mem [0:255];  
    initial begin
        mem[0] = 32'h00000001; // Example instruction
        mem[1] = 32'h00000002; // Example instruction
    end
  assign inst = mem[addr[7:0]];  
endmodule
