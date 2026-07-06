module if_stage_test;
    reg clk, reset;
    reg [31:0] pc_in;
    wire [31:0] instr_out, pc_out;

    if_stage DUT (
        .clk(clk), .reset(reset),
        .pc_in(pc_in),
        .instr_out(instr_out),
        .pc_out(pc_out)
    );

    initial begin
        $dumpfile("if_stage_test.vcd");
        $dumpvars(0, if_stage_test);

        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; pc_in = 0; #10;
        reset = 0;

        // Fetch first instruction
        pc_in = 0; #10;

        // Fetch second instruction
        pc_in = 4; #10;

        // Fetch third instruction
        pc_in = 8; #10;

        $finish;
    end
endmodule
