module cache_l2(
    input clk,
    input [63:0] addr,
    input we,
    input [63:0] wdata,
    output reg [63:0] rdata,
    output hit
);

reg [63:0] data [1023:0];
reg [63:0] tags [1023:0];
reg valid [1023:0];

wire [9:0] index = addr[15:6];
wire [63:0] tag = addr[63:16];

assign hit = valid[index] && (tags[index] == tag);

always @(posedge clk) begin
    if (we) begin
        data[index] <= wdata;
        tags[index] <= tag;
        valid[index] <= 1;
    end

    rdata <= data[index];
end

endmodule