module microcode_rom(
    input  [7:0] uaddr,
    output reg [31:0] uinstr
);

always @(*) begin
    case(uaddr)

        // Example microcode for ADD (just placeholders)
        8'h00: uinstr = 32'b00000000000000000000000000000001;
        8'h01: uinstr = 32'b00000000000000000000000000000010;
        8'h02: uinstr = 32'b00000000000000000000000000000011;
        8'h03: uinstr = 32'b00000000000000000000000000000100;

        // default
        default: uinstr = 32'b00000000000000000000000000000000;

    endcase
end

endmodule