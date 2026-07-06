module id_stage_test;
    reg clk, reset;
    reg [31:0] instr_in, pc_in;
    wire [31:0] rd1, rd2, imm_out;
    wire [4:0] rs1, rs2, rd;
    wire regwrite, memwrite, memread, branch;
    wire [1:0] alu_src, mem_to_reg;
    wire [3:0] alu_op;

    id_stage DUT (
        .clk(clk), .reset(reset),
        .instr_in(instr_in), .pc_in(pc_in),
        .rd1(rd1), .rd2(rd2), .imm_out(imm_out),
        .rs1(rs1), .rs2(rs2), .rd(rd),
        .regwrite(regwrite), .memwrite(memwrite),
        .memread(memread), .branch(branch),
        .alu_src(alu_src), .mem_to_reg(mem_to_reg),
        .alu_op(alu_op)
    );

    initial begin
        $dumpfile("id_stage_test.vcd");
        $dumpvars(0, id_stage_test);

        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; pc_in = 0; instr_in = 0; #10;
        reset = 0;

        // Example: R-type ADD instruction
        instr_in = 32'b0000000_00011_00010_000_00001_0110011; #10;

        // Example: LW instruction
        instr_in = 32'b000000000100_00010_010_00101_0000011; #10;

        $finish;
    end
endmodule
