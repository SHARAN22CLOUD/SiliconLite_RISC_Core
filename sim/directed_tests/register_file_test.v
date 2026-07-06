module register_file_test;
    reg clk, we;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wd;
    wire [31:0] rd1, rd2;

    register_file DUT (
        .clk(clk), .we(we),
        .rs1(rs1), .rs2(rs2), .rd(rd),
        .wd(wd), .rd1(rd1), .rd2(rd2)
    );

    initial begin
        $dumpfile("register_file_test.vcd");
        $dumpvars(0, register_file_test);

        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
        // Write 42 into x5
        we = 1; rd = 5; wd = 32'd42;
        #10 we = 0;

        // Read x5 into rd1
        rs1 = 5; rs2 = 0;
        #10;

        // Write 99 into x10
        we = 1; rd = 10; wd = 32'd99;
        #10 we = 0;

        // Read x10 into rd2
        rs2 = 10;
        #10;

        $finish;
    end
endmodule
