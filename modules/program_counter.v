module program_counter(
input clk ,
input reset_n ,
input [31:0]pc_in ,
output reg[31:0]pc_out
);
always@(posedge clk or negedge reset_n)
   begin
     if(!reset_n)
        pc_out <= 32'd0 ;
     else
        pc_out <= pc_in ;
   end
endmodule
