module hazard_unit (
    input  [4:0] id_rs1, id_rs2,   // source registers in ID stage
    input  [4:0] ex_rd,            // destination register in EX stage
    input        ex_mem_read,      // EX stage is performing a load
    output reg   stall             // stall signal
);
    always @(*) begin
        // Default: no stall
        stall = 0;

        // Load-use hazard: if EX stage is loading into a register
        // that ID stage needs immediately
        if (ex_mem_read && ((ex_rd == id_rs1) || (ex_rd == id_rs2)) && (ex_rd != 0)) begin
            stall = 1;
        end
    end
endmodule
