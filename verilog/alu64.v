module alu64(
    input  [63:0] A,
    input  [63:0] B,
    input  [3:0]  opcode,
    output reg [63:0] R,
    output zero
);

always @(*) begin
    case(opcode)
        4'b0000: R = A + B;    
        4'b0001: R = A - B;    
        4'b0010: R = A & B;    
        4'b0011: R = A | B;    
        4'b0100: R = A ^ B;    
        4'b0101: R = A << 1;   
        4'b0110: R = A >> 1;   
        default: R = 64'h0;
    endcase
end

assign zero = (R == 0);

endmodule