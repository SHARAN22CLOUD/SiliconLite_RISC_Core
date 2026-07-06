module forwarding_unit (
    input  [4:0] id_ex_rs1, id_ex_rs2,   // source registers in EX stage
    input  [4:0] ex_mem_rd, mem_wb_rd,   // destination registers in later stages
    input        ex_mem_regwrite, mem_wb_regwrite,
    output reg [1:0] forward_a, forward_b
);
    always @(*) begin
        // Default: no forwarding
        forward_a = 2'b00;
        forward_b = 2'b00;

        // Forward from EX/MEM stage
        if (ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs1))
            forward_a = 2'b10;
        if (ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == id_ex_rs2))
            forward_b = 2'b10;

        // Forward from MEM/WB stage
        if (mem_wb_regwrite && (mem_wb_rd != 0) && (mem_wb_rd == id_ex_rs1)
            && !(ex_mem_regwrite && (ex_mem_rd == id_ex_rs1)))
            forward_a = 2'b01;

        if (mem_wb_regwrite && (mem_wb_rd != 0) && (mem_wb_rd == id_ex_rs2)
            && !(ex_mem_regwrite && (ex_mem_rd == id_ex_rs2)))
            forward_b = 2'b01;
    end
endmodule
