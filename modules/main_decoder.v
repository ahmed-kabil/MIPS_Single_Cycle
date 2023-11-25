module main_decoder (
input [5:0]opcode ,
input [5:0]funct ,
output reg [1:0]ALUop ,
output reg MemtoReg , MemWrite, Branch, RegDst, RegWrite , jump ,
output reg [1:0]ALUSrc
);

always@(*)
  begin
    case(opcode)
      6'b000000 : begin
                     if(funct == 6'b000000)
                        begin
                          ALUop = 2'b10 ; 
                          MemtoReg = 1'b0 ;
                          MemWrite = 1'b0 ;
                          Branch = 1'b0 ;
                          ALUSrc = 2'b10 ;
                          RegDst = 1'b1 ;
                          RegWrite = 1'b1 ;
                          jump = 1'b0 ;
                        end
                      else
                        begin
                          ALUop = 2'b10 ; 
                          MemtoReg = 1'b0 ;
                          MemWrite = 1'b0 ;
                          Branch = 1'b0 ;
                          ALUSrc = 2'b00 ;
                          RegDst = 1'b1 ;
                          RegWrite = 1'b1 ;
                          jump = 1'b0 ;
                         end
                  end

      6'b100011 : begin      //   load word instruction
                    ALUop = 2'b00 ;
                    MemtoReg = 1'b1 ;
                    MemWrite = 1'b0 ;
                    Branch = 1'b0 ;
                    ALUSrc = 2'b01 ;
                    RegDst = 1'b0 ;
                    RegWrite = 1'b1 ;
                    jump = 1'b0 ;
                  end

      6'b101011 : begin      //   store word instruction
                    ALUop = 2'b00 ;
                    MemtoReg = 1'bx ;
                    MemWrite = 1'b1 ;
                    Branch = 1'b0 ;
                    ALUSrc = 2'b01 ;
                    RegDst = 1'bx ;
                    RegWrite = 1'b0 ;
                    jump = 1'b0 ;
                  end

      6'b000100 : begin     //  beq  instruction
                    ALUop = 2'b01 ;
                    MemtoReg = 1'bx ;
                    MemWrite = 1'b0 ;
                    Branch = 1'b1 ;
                    ALUSrc = 2'b00 ;
                    RegDst = 1'bx ;
                    RegWrite = 1'b0 ;
                    jump = 1'b0 ;
                  end

      6'b001000 : begin     //  addi  instruction
                    ALUop = 2'b00 ;
                    MemtoReg = 1'b0 ;
                    MemWrite = 1'b0 ;
                    Branch = 1'b0 ;
                    ALUSrc = 2'b01 ;
                    RegDst = 1'b0 ;
                    RegWrite = 1'b1 ;
                    jump = 1'b0 ;
                  end

      6'b000010 : begin     //  j  instruction
                    ALUop = 2'b11 ;
                    MemtoReg = 1'bx ;
                    MemWrite = 1'b0 ;
                    Branch = 1'b0 ;
                    ALUSrc = 2'bxx ;
                    RegDst = 1'bx ;
                    RegWrite = 1'b0 ;
                    jump = 1'b1 ;
                  end
    endcase
  end

endmodule
