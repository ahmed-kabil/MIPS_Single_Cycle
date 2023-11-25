module mux_3in(
input [1:0]sel ,
input[31:0]in1,in2,
input [4:0]in3,
output reg[31:0]out
);

always@(*)
  begin
    case(sel)
      2'b00 : out = in1 ;
      2'b01 : out = in2 ;
      2'b10 : out = in3 ;
      2'b11 : out = in3 ;
    endcase
  end
endmodule
