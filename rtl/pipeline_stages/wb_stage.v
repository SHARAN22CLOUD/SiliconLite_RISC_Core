module wb_stage (
    input  [31:0] alu_result,
    input  [31:0] mem_out,
    input  [1:0]  mem_to_reg,
    output reg [31:0] wb_data
);
    always @(*) begin
        case (mem_to_reg)
            2'b00: wb_data = alu_result; // ALU result
            2'b01: wb_data = mem_out;    // Memory output
            default: wb_data = alu_result;
        endcase
    end
endmodule
