module tb_risc_core;
    reg clk, reset;
    SiliconLiteCore DUT (.clk(clk), .reset(reset));

    initial begin
        $dumpfile("tb_risc_core.vcd");
        $dumpvars(0, tb_risc_core);
        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; #10;
        reset = 0;

        // Run for 100 cycles to exercise pipeline
        repeat (100) @(posedge clk);

        $finish;
    end
endmodule
