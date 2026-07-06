module ex_stage (
    input  [31:0] rd1, rd2, imm_in,
    input  [4:0]  rs1, rs2, rd,
    input  [3:0]  alu_op,
    input  [1:0]  alu_src,
    input  [1:0]  forward_a, forward_b,
    input  [31:0] ex_mem_result, mem_wb_result,
    output [31:0] alu_result,
    output        zero
);
    reg [31:0] src_a, src_b;

    // Forwarding logic for src_a
    always @(*) begin
        case (forward_a)
            2'b00: src_a = rd1;
            2'b10: src_a = ex_mem_result;
            2'b01: src_a = mem_wb_result;
            default: src_a = rd1;
        endcase
    end

    // Forwarding logic for src_b
    always @(*) begin
        case (forward_b)
            2'b00: src_b = rd2;
            2'b10: src_b = ex_mem_result;
            2'b01: src_b = mem_wb_result;
            default: src_b = rd2;
        endcase
    end

    // ALU input selection
    wire [31:0] alu_in_b = (alu_src == 2'b01) ? imm_in : src_b;

    // ALU instance
    alu ALU (
