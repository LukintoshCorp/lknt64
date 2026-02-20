module core64(
    input clk,
    input reset
);

// ===== PC =====
wire [63:0] pc_out;
reg pc_load;
reg [63:0] newPC;

pc64 PC64(
    .clk(clk),
    .reset(reset),
    .load(pc_load),
    .newPC(newPC),
    .PC(pc_out)
);

// ===== instruction memory =====
wire [31:0] instr;
rom64 ROM(pc_out[15:0], instr);

// ===== microcode =====
reg [7:0] upc;
wire [31:0] uinstr;

microcode_rom USTORE(
    .uaddr(upc),
    .uinstr(uinstr)
);

wire PC_LOAD   = uinstr[31];
wire REG_WE    = uinstr[30];
wire [3:0] ALU_OP = uinstr[29:26];
wire [4:0] RS1 = uinstr[25:21];
wire [4:5] RS2 = uinstr[20:16];
wire [4:0] RD  = uinstr[15:11];
wire [7:0] NEXT = uinstr[7:0];

always @(posedge clk) begin
    if (reset)
        upc <= 8'h00;
    else
        upc <= NEXT;
end

// ===== register file =====
wire [63:0] rs1;
wire [63:0] rs2;
reg  [63:0] wdata;

regfile64 RF(
    .clk(clk),
    .we(REG_WE),
    .r1(RS1),
    .r2(RS2),
    .waddr(RD),
    .wdata(wdata),
    .out1(rs1),
    .out2(rs2)
);

// ===== ALU =====
wire [63:0] alu_out;
wire zero;

alu64 ALU(
    .A(rs1),
    .B(rs2),
    .opcode(ALU_OP),
    .R(alu_out),
    .zero(zero)
);

always @(*) begin
    wdata = alu_out;
    pc_load = PC_LOAD;
    newPC = pc_out + 4;
end

endmodule