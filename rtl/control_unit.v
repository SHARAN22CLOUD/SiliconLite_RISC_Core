module control_unit (
    input  [6:0] opcode,
    output reg   regwrite,
    output reg   memwrite,
    output reg   memread,
    output reg   branch,
    output reg [1:0] alu_src,
    output reg [1:0] mem_to_reg,
    output reg [3:0] alu_op
);
    always @(*) begin
        // Default values
        regwrite   = 0;
        memwrite   = 0;
        memread    = 0;
        branch     = 0;
        alu_src    = 2'b00;
        mem_to_reg = 2'b00;
        alu_op     = 4'b0000;

        case (opcode)
            7'b0110011: begin // R-type (ADD, SUB, AND, OR)
                regwrite   = 1;
                alu_src    = 2'b00;
                mem_to_reg = 2'b00;
                alu_op     = 4'b0010; // ADD default
            end
            7'b0000011: begin // Load
                regwrite   = 1;
                memread    = 1;
                alu_src    = 2'b01;
                mem_to_reg = 2'b01;
                alu_op     = 4'b0010; // ADD for address calc
            end
            7'b0100011: begin // Store
                memwrite   = 1;
                alu_src    = 2'b01;
                alu_op     = 4'b0010; // ADD for address calc
            end
            7'b1100011: begin // Branch
                branch     = 1;
                alu_src    = 2'b00;
                alu_op     = 4'b0110; // SUB for comparison
            end
            default: begin
                // NOP / unrecognized instruction
            end
        endcase
    end
endmodule
