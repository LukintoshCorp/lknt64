module cpu(
    input clk,
    input reset
);

wire [7:0] pc_out;
wire [15:0] instr;

// ====== FALTAVA ISSO AQUI ======
reg pc_load;
reg [7:0] newPC;
wire [7:0] acc_val;   // também estava faltando declarar
// ===============================

pc myPC(clk, reset, pc_load, newPC, pc_out);
rom myROM(pc_out, instr);

// INSTRUÇÃO (4 bits opcode, 8 bits dado)
wire [3:0] opcode = instr[15:12];
wire [7:0] data   = instr[7:0];

reg acc_load;
wire [7:0] alu_out;
wire zeroFlag;
reg [2:0] alu_op;

register8 ACC(clk, acc_load, alu_out, acc_val);
alu ALU(acc_val, data, alu_op, alu_out, zeroFlag);

always @(*) begin
    pc_load = 0;
    acc_load = 0;
    alu_op = 0;
    newPC = 0;

    case(opcode)
        4'b0001: begin // LOAD
            acc_load = 1;
        end

        4'b0010: begin // ADD
            alu_op = 3'b000;
            acc_load = 1;
        end

        4'b0011: begin // SUB
            alu_op = 3'b001;
            acc_load = 1;
        end

        4'b0100: begin // JMP
            pc_load = 1;
            newPC = data;
        end

        4'b0101: begin // JZ
            if(zeroFlag) begin
                pc_load = 1;
                newPC = data;
            end
        end

        4'b1111: begin // HLT
            pc_load = 1;
            newPC = pc_out; // trava
        end
    endcase
end

endmodule