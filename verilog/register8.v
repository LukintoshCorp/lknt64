module register8(
    input clk,
    input load,
    input [7:0] D,
    output reg [7:0] Q
);
always @(posedge clk) begin
    if(load)
        Q <= D;
end
endmodule