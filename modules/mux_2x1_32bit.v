module mux_2x1_32bit (
input sel ,
input [31:0]in1, in2,
output reg [31:0]out
);

always @(*)
  begin
    if(!sel)
      out = in1 ;
    else
      out = in2 ;
  end

endmodule
