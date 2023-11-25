module ALU(
input [2:0]ctrl,
input [31:0]srcA , srcB ,
output zero_flag,
output reg[31:0]result
);

always@(*)
  begin
    case(ctrl)
      3'b000 : result = srcA & srcB ;
      3'b001 : result = srcA | srcB ;
      3'b010 : result = srcA + srcB ;
      3'b011 : result = srcA<<srcB ;
      3'b100 : result = srcA ^ srcB ;
      3'b101 : result = ~(srcA | srcB) ;
      3'b110 : result = srcA - srcB ;
      3'b111 : result = result ;
    endcase
  end

assign zero_flag =(result == 32'd0) ;

endmodule
