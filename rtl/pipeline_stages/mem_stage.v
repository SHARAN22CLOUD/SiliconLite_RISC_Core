module mem_stage (
    input         clk,
    input         memwrite, memread,
    input  [31:0] alu_result, rd2,
    output [31:0] mem_out
);
    reg [31:0] data_mem [0:255]; // simple data memory (256 words)

    // Memory read
    assign mem_out = (memread) ? data_mem[alu_result[9:2]] : 32'd0;

    // Memory write
    always @(posedge clk) begin
        if (memwrite) begin
            data_mem[alu_result[9:2]] <= rd2;
        end
    end
endmodule
