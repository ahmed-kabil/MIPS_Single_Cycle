module data_path (  
input clk ,
input reset_n ,
input MemtoReg, MemWrite, Branch, RegDst, RegWrite, jump,
input [1:0] ALUSrc,
input [2:0]ALU_control,
output [5:0]opcode,funct,
output [31:0]test_value
);

wire  ALU_zero_flag  ;
wire [31:0]instr , result, RD1, RD2 ,PC_in , PC_out , PCPlus4, PCBranch,
 PCJump, SignImm, ALU_result, ReadData, SrcB, mux1_out ;
wire [4:0]WriteReg ;

assign opcode = instr[31:26] ;
assign funct = instr[5:0] ;

mux_2x1_32bit mux1 (               
.sel(ALU_zero_flag & Branch),
.in1(PCPlus4),
.in2(PCBranch),
.out(mux1_out)
);

mux_2x1_32bit mux2 (    
.sel(jump),
.in1(mux1_out),
.in2(PCJump),
.out(PC_in)
);

program_counter PC (       //////////
.clk(clk),
.reset_n(reset_n),
.pc_in(PC_in),
.pc_out(PC_out)
);

insruction_memory/////////////
#(.depth(8)) IM (
.reset_n(reset_n),
.A(PC_out),
.RD(instr)
);

register_file RF ( /////////////////////
.clk(clk),
.reset_n(reset_n),
.WE3(RegWrite),
.A1(instr[25:21]),
.A2(instr[20:16]),
.A3(WriteReg),
.WD3(result),
.RD1(RD1),
.RD2(RD2)
);

mux_2x1_5bit mux3 (      //////////
.sel(RegDst),
.in1(instr[20:16]),
.in2(instr[15:11]),
.out(WriteReg)
);

data_memory    //////////////
#(.depth(8)) DM (
.clk(clk),
.reset_n(reset_n),
.WE(MemWrite),
.A(ALU_result),
.WD(RD2),
.RD(ReadData),
.test_value(test_value)
);

sign_extend SE (  ///////////////
.in(instr[15:0]),
.out(SignImm)
);
 
ALU alu (        /////////////////
.ctrl(ALU_control),
.srcA(RD1),
.srcB(SrcB),
.zero_flag(ALU_zero_flag),
.result(ALU_result)
);

add4 add_4 (      ////////////
.in(PC_out),
.out(PCPlus4)
);

beq_shift2bit shifter1 (    //////////
.in(SignImm),
.out(PCBranch)
);

jump_shift2bit shifter2 (   /////////
.in(instr[25:0]),
.out(PCJump)
);

mux_3in mux4 (
.sel(ALUSrc),
.in1(RD2),
.in2(SignImm),
.in3(instr[10:6]),
.out(SrcB)
);

mux_2x1_32bit mux5 (
.sel(MemtoReg),
.in1(ALU_result),
.in2(ReadData),
.out(result)
);

endmodule
