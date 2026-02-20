module cpu_tb();
reg clk = 0;
reg reset = 1;

cpu DUT(clk, reset);

// clock 100MHz (50/50)
always #5 clk = ~clk;

initial begin
    #20 reset = 0;   // solta o reset depois de 20ns
    #500 $stop;     // para a simulação depois de 500ns
end

endmodule