module alu_test;
    reg  [31:0] a, b;
    reg  [3:0]  alu_ctrl;
    wire [31:0] result;
    wire        zero;

    alu DUT (.a(a), .b(b), .alu_ctrl(alu_ctrl), .result(result), .zero(zero));

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, alu_test);

        // Test ADD
        a = 10; b = 5; alu_ctrl = 4'b0010; #10;
        // Test SUB
        a = 10; b = 10; alu_ctrl = 4'b0110; #10;
        // Test AND
        a = 3; b = 1; alu_ctrl = 4'b0000; #10;
        // Test OR
        a = 3; b = 1; alu_ctrl = 4'b0001; #10;
        // Test SLT
        a = 5; b = 10; alu_ctrl = 4'b0111; #10;

        $finish;
    end
endmodule
