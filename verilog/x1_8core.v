module x1_8core(
    input clk,
    input reset
);

core64 C0(clk, reset);
core64 C1(clk, reset);
core64 C2(clk, reset);
core64 C3(clk, reset);
core64 C4(clk, reset);
core64 C5(clk, reset);
core64 C6(clk, reset);
core64 C7(clk, reset);

endmodule