module ALU_decoder(
input [1:0]ALUop ,
input [5:0]funct ,
output reg [2:0]ALUcontrol
);

always@(*)
  begin
    case(ALUop)
      2'b00 : ALUcontrol = 3'b010 ;
      2'b01 : ALUcontrol = 3'b110 ;
      2'b10 : begin
                case(funct)
                  6'b100000 : ALUcontrol = 3'b010 ;     //  add
                  6'b100010 : ALUcontrol = 3'b110 ;     //  sub
                  6'b100100 : ALUcontrol = 3'b000 ;     //  and
                  6'b100101 : ALUcontrol = 3'b001 ;     //  or
                  6'b100111 : ALUcontrol = 3'b101 ;     //  nor
                  6'b100110 : ALUcontrol = 3'b100 ;     //  xor
                  6'b000100 : ALUcontrol = 3'b011 ;     // shift left  sllv
                  6'b000000 : ALUcontrol = 3'b011 ;     // shift left  sll
                endcase
              end
      2'b11 : ALUcontrol = 3'b111 ;
    endcase
  end

endmodule
