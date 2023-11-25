module data_memory
#(parameter depth = 8)(   ///    vsim -debugDB data_memory
input clk ,
input reset_n ,
input WE ,
input [31:0]A ,
input [31:0]WD ,
output reg [31:0]RD,
output [31:0]test_value
);

reg [31:0]data_mem[0:2**depth-1] ;

always@(posedge clk)
   begin
     if(!reset_n)
       RD <= 32'd0 ;
     else if(WE)
       begin
         RD <= 32'd0 ;
         data_mem[A>>2] <= WD ;
       end
     else
       data_mem[A>>2] <= data_mem[A>>2] ;
   end 

always @(*)
  begin
   if(!reset_n)
      RD <= 32'd0 ;
   else if (!WE)
      RD <= data_mem[A>>2] ;
   else 
      RD <= RD ;
  end

assign test_value = data_mem[0] ;

endmodule
