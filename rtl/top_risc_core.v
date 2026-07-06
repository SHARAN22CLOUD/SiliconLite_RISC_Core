module SiliconLiteCore (
    input clk,
    input reset
);
    // IF stage wires
    wire [31:0] pc_if, instr_if, pc_next;

    // ID stage wires
    wire [31:0] rd1_id, rd2_id, imm_id;
    wire [4:0]  rs1_id, rs2_id, rd_id;
    wire        regwrite_id, memwrite_id, memread_id, branch_id;
    wire [1:0]  alu_src_id, mem_to_reg_id;
    wire [3:0]  alu_op_id;

    // EX stage wires
    wire [31:0] alu_result_ex;
    wire        zero_ex;

    // MEM stage wires
    wire [31:0] mem_out_mem;

    // WB stage wires
    wire [31:0] wb_data;

    // Hazard and forwarding
    wire stall;
    wire [1:0] forward_a, forward_b;

    // IF stage
    if_stage IF (
        .clk(clk), .reset(reset),
        .pc_in(pc_if),
        .instr_out(instr_if),
        .pc_out(pc_next)
    );

    // ID stage
    id_stage ID (
        .clk(clk), .reset(reset),
        .instr_in(instr_if), .pc_in(pc_if),
        .rd1(rd1_id), .rd2(rd2_id), .imm_out(imm_id),
        .rs1(rs1_id), .rs2(rs2_id), .rd(rd_id),
        .regwrite(regwrite_id), .memwrite(memwrite_id),
        .memread(memread_id), .branch(branch_id),
        .alu_src(alu_src_id),