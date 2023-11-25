module top_module (          
input clk ,
input reset_n ,
output [31:0]test_value
);

wire MemtoReg, MemWrite, Branch, RegDst, RegWrite, jump;
wire [1:0]ALUSrc ;
wire [2:0]ALU_control;
wire [5:0]opcode,funct;

data_path DP (
.clk(clk),
.reset_n(reset_n),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.jump(jump),
.ALU_control(ALU_control),
.opcode(opcode),
.funct(funct),
.test_value(test_value)
);

control_unit CU(
.opcode(opcode),
.funct(funct),
.MemtoReg(MemtoReg), 
.MemWrite(MemWrite), 
.Branch(Branch), 
.ALUSrc(ALUSrc), 
.RegDst(RegDst), 
.RegWrite(RegWrite), 
.jump(jump),
.ALU_control(ALU_control)
);
endmodule
