module control_test;
    reg  [6:0] opcode;
    wire regwrite, memwrite, memread, branch;
    wire [1:0] alu_src, mem_to_reg;
    wire [3:0] alu_op;

    control_unit DUT (
        .opcode(opcode),
        .regwrite(regwrite), .memwrite(memwrite),
        .memread(memread), .branch(branch),
        .alu_src(alu_src), .mem_to_reg(mem_to_reg),
        .alu_op(alu_op)
    );

    initial begin
        $dumpfile("control_test.vcd");
        $dumpvars(0, control_test);

        // R-type
        opcode = 7'b0110011; #10;
        // Load
        opcode = 7'b0000011; #10;
        // Store
        opcode = 7'b0100011; #10;
        // Branch
        opcode = 7'b1100011; #10;
        // Unknown
        opcode = 7'b1111111; #10;

        $finish;
    end
endmodule
