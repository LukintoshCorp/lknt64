module pc64(
    input clk,
    input reset,
    input load,
    input [63:0] newPC,
    output reg [63:0] PC
);
always @(posedge clk) begin
    if (reset)
        PC <= 0;
    else if (load)
        PC <= newPC;
    else
        PC <= PC + 4; // instruções 32 bits
end
endmodule