module register_file (
    input         clk,
    input         we,             // write enable
    input  [4:0]  rs1, rs2, rd,   // register addresses
    input  [31:0] wd,             // write data
    output [31:0] rd1, rd2        // read data
);
    reg [31:0] regs [31:0];       // 32 registers, each 32 bits

    // Read ports (combinational)
    assign rd1 = regs[rs1];
    assign rd2 = regs[rs2];

    // Write port (synchronous)
    always @(posedge clk) begin
        if (we && rd != 0) begin
            regs[rd] <= wd;
        end
    end
endmodule
