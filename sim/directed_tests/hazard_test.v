module hazard_test;
    reg  [4:0] id_rs1, id_rs2, ex_rd;
    reg        ex_mem_read;
    wire       stall;

    hazard_unit DUT (
        .id_rs1(id_rs1), .id_rs2(id_rs2),
        .ex_rd(ex_rd), .ex_mem_read(ex_mem_read),
        .stall(stall)
    );

    initial begin
        $dumpfile("hazard_test.vcd");
        $dumpvars(0, hazard_test);

        // Case 1: No hazard
        id_rs1 = 1; id_rs2 = 2; ex_rd = 3; ex_mem_read = 0; #10;

        // Case 2: Hazard on rs1
        id_rs1 = 5; id_rs2 = 2; ex_rd = 5; ex_mem_read = 1; #10;

        // Case 3: Hazard on rs2
        id_rs1 = 1; id_rs2 = 7; ex_rd = 7; ex_mem_read = 1; #10;

        // Case 4: No hazard when ex_rd = 0
        id_rs1 = 0; id_rs2 = 0; ex_rd = 0; ex_mem_read = 1; #10;

        $finish;
    end
endmodule
