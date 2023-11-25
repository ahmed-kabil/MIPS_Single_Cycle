module insruction_memory
#(parameter depth = 8)(
input reset_n ,
input [31:0]A,
output reg [31:0]RD
);

reg [31:0] ins_mem [0:2**depth-1] ;

initial
  begin
/***************************************** sum operation *******************************************/
/*** hi level code *************mips assembly code *************************** machin code *********/
 /* int x = 10 ;                 addi $s0,$0,10      */           //ins_mem[0] = 32'h2010000A ;  
 /* int y = 20 ;                 addi $s1,$0,20      */           //ins_mem[1] = 32'h20110014 ;
 /* int z ;                      addi $s2,$0,0       */           //ins_mem[2] = 32'h20120000 ;    
 /* z = x + y ;                  add $s2,$s0,$s1     */           //ins_mem[3] = 32'h02119020 ;  
 /*                              sw $s2,$0,0         */           //ins_mem[4] = 32'hAC120000 ;       
/***************************************************************************************************/

/********************************* sum of number under 6 *******************************************/
/*** hi level code *************mips assembly code *************************** machin code *********/
 /* int i = 0 ;                  addi $t0,$0,0       */           //ins_mem[0] = 32'h20080000 ;
 /* int sum = 0 ;                addi $s0,$0,0       */           //ins_mem[1] = 32'h20100000 ;
 /* int num = 6 ;                addi $t1,$0,6       */           //ins_mem[2] = 32'h20090006 ;
 /* for(i=0,i<num,i=i+1)         beq $t0,$t1,7       */           //ins_mem[3] = 32'h11090007 ;
 /*   sum = sum + i ;            add $s0,$s0,$t0     */           //ins_mem[4] = 32'h02088020 ;
 /*                              addi $t0,$t0,1      */           //ins_mem[5] = 32'h21080001 ;
 /*                              j : 3               */           //ins_mem[6] = 32'h08000003 ;
 /*                              sw $s0,$0,0         */           //ins_mem[7] = 32'hAC100000 ;
/***************************************************************************************************/

/***************************** testing ssl and sllv *******************************************/
/*** hi level code *************mips assembly code *************************** machin code *********/
 /* int x = 10 ;                 addi $s0,$0,10      */           //ins_mem[0] = 32'h2010000A ;
 /* int y ;                      addi $s1,$0,0       */           //ins_mem[1] = 32'h20110000 ;
 /* y = x << 2 ;                 sll $s1,$s0,2       */           //ins_mem[2] = 32'h02008880 ;
 /* //storing y to memory        sw $s1,$0,0         */           //ins_mem[3] = 32'hAC110000 ;
 /* int a = 3 ;                  addi $t0,$0,3       */           //ins_mem[4] = 32'h20080003 ;
 /* int b = 20 ;                 addi $s2,$0,20      */           //ins_mem[5] = 32'h20120014 ;
 /* int c = 0 ;                  addi $s3,$0,0       */           //ins_mem[6] = 32'h20130000 ;
 /* c = b << a ;                 sllv $s3,$s2,$t0    */           //ins_mem[7] = 32'h02489804 ;
 /* //storing c to memory        sw $s3,$0,0         */           //ins_mem[8] = 32'hAC130000 ;
/***************************************************************************************************/

  end

always@(*)
  begin
    if(!reset_n)
       RD <= ins_mem[0] ;
    else
       RD <= ins_mem[A>>2] ;
  end

endmodule
