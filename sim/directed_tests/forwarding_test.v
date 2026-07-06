module forwarding_test;
    reg  [4:0] id_ex_rs1, id_ex_rs2, ex_mem_rd, mem_wb_rd;
    reg        ex_mem_regwrite, mem_wb_regwrite;
    wire [1:0] forward_a, forward_b;

    forwarding_unit DUT (
        .id_ex_rs1(id_ex_rs1), .id_ex_rs2(id_ex_rs2),
        .ex_mem_rd(ex_mem_rd), .mem_wb_rd(mem_wb_rd),
        .ex_mem_regwrite(ex_mem_regwrite), .mem_wb_regwrite(mem_wb_regwrite),
        .forward_a(forward_a), .forward_b(forward_b)
    );

    initial begin
        $dumpfile("forwarding_test.vcd");
        $dumpvars(0, forwarding_test);

        // Case 1: No forwarding
        id_ex_rs1 = 1; id_ex_rs2 = 2;
        ex_mem_rd = 0; mem_wb_rd = 0;
        ex_mem_regwrite = 0; mem_wb_regwrite = 0; #10;

        // Case 2: Forward from EX/MEM
        id_ex_rs1 = 5; ex_mem_rd = 5; ex_mem_regwrite = 1; #10;

        // Case 3: Forward from MEM/WB
        id_ex_rs2 = 7; mem_wb_rd = 7; mem_wb_regwrite = 1; #10;

        $finish;
    end
endmodule
