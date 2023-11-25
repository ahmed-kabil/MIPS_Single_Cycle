module register_file (   //  vsim -debugDB register_file
input clk ,
input reset_n ,
input WE3 ,
input [4:0]A1,A2,A3 ,
input [31:0]WD3,
output reg [31:0]RD1,RD2
);

reg [31:0]reg_file[0:31] ;
initial  begin  reg_file[0]=32'd0 ;  end

always@(posedge clk or negedge reset_n)             //  write data
  begin

    if(!reset_n)
      reg_file[A3] <= reg_file[A3] ;
    else if(WE3)
      reg_file[A3] <= WD3 ;
    else
      reg_file[A3] <= reg_file[A3] ;

  end

always@(*)
  begin

    if(!reset_n)
       begin
         RD1 <= 32'd0 ;
         RD2 <= 32'd0 ;
       end
    else
       begin
         RD1 <= reg_file[A1] ;
         RD2 <= reg_file[A2] ;
       end

  end

endmodule
