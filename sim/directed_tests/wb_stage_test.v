module wb_stage_test;
    reg  [31:0] alu_result, mem_out;
    reg  [1:0]  mem_to_reg;
    wire [31:0] wb_data;

    wb_stage DUT (
        .alu_result(alu_result), .mem_out(mem_out),
        .mem_to_reg(mem_to_reg), .wb_data(wb_data)
    );

    initial begin
        $dumpfile("wb_stage_test.vcd");
        $dumpvars(0, wb_stage_test);

        // Case 1: Select ALU result
        alu_result = 32'd10; mem_out = 32'd99; mem_to_reg = 2'b00; #10;

        // Case 2: Select Memory output
        alu_result = 32'd10; mem_out = 32'd99; mem_to_reg = 2'b01; #10;

        $finish;
    end
endmodule
