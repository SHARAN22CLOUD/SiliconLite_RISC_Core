module ex_stage_test;
    reg  [31:0] rd1, rd2, imm_in;
    reg  [4:0]  rs1, rs2, rd;
    reg  [3:0]  alu_op;
    reg  [1:0]  alu_src, forward_a, forward_b;
    reg  [31:0] ex_mem_result, mem_wb_result;
    wire [31:0] alu_result;
    wire        zero;

    ex_stage DUT (
        .rd1(rd1), .rd2(rd2), .imm_in(imm_in),
        .rs1(rs1), .rs2(rs2), .rd(rd),
        .alu_op(alu_op), .alu_src(alu_src),
        .forward_a(forward_a), .forward_b(forward_b),
        .ex_mem_result(ex_mem_result), .mem_wb_result(mem_wb_result),
        .alu_result(alu_result), .zero(zero)
    );

    initial begin
        $dumpfile("ex_stage_test.vcd");
        $dumpvars(0, ex_stage_test);

        // Case 1: Simple ADD
        rd1 = 10; rd2 = 5; imm_in = 0;
        alu_op = 4'b0010; alu_src = 2'b00;
        forward_a = 2'b00; forward_b = 2'b00;
        ex_mem_result = 0; mem_wb_result = 0;
        #10;

        // Case 2: Forward from EX/MEM
        rd1 = 0; rd2 = 0; ex_mem_result = 32'd42;
        forward_a = 2'b10; alu_op = 4'b0010;
        #10;

        // Case 3: Immediate input
        rd1 = 5; imm_in = 7; alu_src = 2'b01;
        alu_op = 4'b0010; #10;

        $finish;
    end
endmodule
