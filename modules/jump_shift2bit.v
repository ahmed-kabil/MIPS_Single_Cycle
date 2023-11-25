module jump_shift2bit (
input [25:0] in ,
output [31:0] out
);

assign out = {{4'b0000},{in},{2'b00}} ;

endmodule
