module mux_2x1_5bit (
input sel ,
input [4:0]in1, in2,
output reg [4:0]out
);

always @(*)
  begin
    if(!sel)
      out = in1 ;
    else
      out = in2 ;
  end

endmodule
