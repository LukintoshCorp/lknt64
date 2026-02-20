module rom64(
    input [15:0] addr,
    output reg [31:0] instr
);

always @(*) begin
    case(addr)
        16'h0000: instr = 32'h002081B3; // add x3,x1,x2
        16'h0001: instr = 32'h40310233; // sub x4,x2,x3
        16'h0002: instr = 32'h0000006F; // jal x0,0 (loop)
        default:  instr = 32'h00000013; // nop
    endcase
end

endmodule