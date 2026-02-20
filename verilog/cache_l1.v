module cache_l1(
    input clk,
    input [63:0] addr,
    input [63:0] wdata,
    input we,
    output reg [63:0] rdata,
    output hit
);

reg [63:0] data [255:0];
reg [63:0] tags [255:0];
reg        valid[255:0];

wire [7:0] index = addr[11:4];
wire [63:0] tag = addr[63:12];

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