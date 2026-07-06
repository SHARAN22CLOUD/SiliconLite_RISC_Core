module id_stage (
    input         clk,
    input         reset,
    input  [31:0] instr_in, pc_in,
    output [31:0] rd1, rd2, imm_out,
    output [4:0]  rs1, rs2, rd,
    output        regwrite, memwrite, memread, branch,
    output [1:0]  alu_src, mem_to_reg,
    output [3:0]  alu_op
);
    // Instruction fields
    assign rs1 = instr_in[19:15];
    assign rs2 = instr_in[24:20];
    assign rd  = instr_in[11:7];
    wire [6:0] opcode = instr_in[6:0];

    // Immediate generation (simplified for I-type)
    assign imm_out = {{20{instr_in[31]}}, instr_in[31:20]};

    // Register file instance
    register_file RF (
        .clk(clk),
        .we(regwrite),
        .rs1(rs1), .rs2(rs2), .rd(rd),
        .wd(pc_in), // placeholder write data
        .rd1(rd1), .rd2(rd2)
    );

    // Control unit instance
    control_unit CU (
        .opcode(opcode),
        .regwrite(regwrite), .memwrite(memwrite),
        .memread(memread), .branch(branch),
        .alu_src(alu_src), .mem_to_reg(mem_to_reg),
        .alu_op(alu_op)
    );
endmodule
