module control_unit (
input [5:0]opcode,funct,
output MemtoReg, MemWrite, Branch, RegDst, RegWrite, jump,
output [1:0] ALUSrc,
output [2:0]ALU_control
);

wire [1:0]ALUop ;

ALU_decoder ALU_dec (
.ALUop(ALUop),
.funct(funct),
.ALUcontrol(ALU_control)
);

main_decoder MD (
.opcode(opcode),
.funct(funct),
.ALUop(ALUop),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.jump(jump)
);

endmodule
