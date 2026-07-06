module mem_stage_test;
    reg clk;
    reg memwrite, memread;
    reg [31:0] alu_result, rd2;
    wire [31:0] mem_out;

    mem_stage DUT (
        .clk(clk),
        .memwrite(memwrite), .memread(memread),
        .alu_result(alu_result), .rd2(rd2),
        .mem_out(mem_out)
    );

    initial begin
        $dumpfile("mem_stage_test.vcd");
        $dumpvars(0, mem_stage_test);

        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
        // Case 1: Write data
        alu_result = 32'd8; rd2 = 32'd42;
        memwrite = 1; memread = 0; #10;
        memwrite = 0;

        // Case 2: Read data
        alu_result = 32'd8; memread = 1; #10;

        $finish;
    end
endmodule
