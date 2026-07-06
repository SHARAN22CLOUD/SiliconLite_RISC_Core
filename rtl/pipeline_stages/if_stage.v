module if_stage (
    input         clk,
    input         reset,
    input  [31:0] pc_in,          // current PC
    output [31:0] instr_out,      // fetched instruction
    output reg [31:0] pc_out      // next PC
);
    reg [31:0] instr_mem [0:255]; // instruction memory (256 words)

    // Preload program into instruction memory
    initial begin
        // Example program
        instr_mem[0] = 32'b0000000_00011_00010_000_00001_0110011; // ADD x1, x2, x3
        instr_mem[1] = 32'b000000000100_00010_010_00101_0000011; // LW x5, 4(x2)
        instr_mem[2] = 32'b0000000_00101_00010_010_01000_0100011; // SW x5, 8(x2)
        instr_mem[3] = 32'b0000000_00101_00001_000_00100_1100011; // BEQ x1, x5, offset=4
        instr_mem[4] = 32'b000000000000_00000_000_00000_0010011; // NOP (ADDI x0, x0, 0)
    end

    // Program counter update
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 0;
        else
            pc_out <= pc_in + 4; // increment PC by 4
    end

    // Instruction fetch
    assign instr_out = instr_mem[pc_in[9:2]]; // word-aligned access
endmodule
