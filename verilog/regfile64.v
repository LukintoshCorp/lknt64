module regfile64(
    input clk,
    input we,
    input [4:0] r1, r2, waddr,
    input [63:0] wdata,
    output [63:0] out1,
    output [63:0] out2
);

reg [63:0] regs [31:0];

assign out1 = regs[r1];
assign out2 = regs[r2];

always @(posedge clk) begin
    if (we && waddr != 0)
        regs[waddr] <= wdata;
end

endmodule