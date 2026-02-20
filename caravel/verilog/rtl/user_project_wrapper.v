
module user_project_wrapper (
    input wb_clk_i,
    input wb_rst_i,
    inout [`MPRJ_IO_PADS-1:0] io
);

    wire clk = wb_clk_i;
    wire reset = wb_rst_i;

    lknt64_8core cpu(
        .clk(clk),
        .reset(reset)
    );

endmodule
