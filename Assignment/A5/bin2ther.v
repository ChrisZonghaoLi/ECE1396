`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Manohar Mohanta
//
// Create Date:    07:31:52 08/10/2016
// Design Name:
// Module Name:    Btother
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
/* module Btother(
    input [2:0] b,
    output [6:0] t
    );
reg [6:0]t;
always @ (b)
begin
 if(b==3'b000)
  t=7'b0000000;
 else if(b==3'b001)
  t=7'b0000001;
 else if(b==3'b010)
  t=7'b0000011;
 else if(b==3'b011)
  t=7'b0000111;
 else if(b==3'b100)
  t=7'b0001111;
 else if(b==3'b101)
  t=7'b0011111;
 else if(b==3'b110)
  t=7'b0111111;
 else
  t=7'b1111111;
end
endmodule */


module Btother(
    input b0, b1, b2,
    output t0, t1, t2, t3, t4, t5, t6
    );
reg t0, t1, t2, t3, t4, t5, t6;
always @ (b0 or b1 or b2)
begin
 if(b0 ==1'b0 && b1 ==1'b0 && b2 ==1'b0)
 begin
  t0=1'b0; t1=1'b0; t2=1'b0; t3=1'b0; t4=1'b0; t5=1'b0; t6=1'b0; 
 end
 else if(b0 ==1'b0 && b1 ==1'b0 && b2 ==1'b1)
 begin
  t0=0'b1; t1=0'b1; t2=1'b0; t3=1'b0; t4=1'b0; t5=1'b0; t6=1'b1; 
 end
 else if(b0 ==1'b0 && b1 ==1'b1 && b2 ==1'b0)
 begin
  t0=0'b1; t1=0'b1; t2=1'b0; t3=1'b0; t4=1'b0; t5=1'b1; t6=1'b1; 
 end
 else if(b0 ==1'b0 && b1 ==1'b1 && b2 ==1'b1)
 begin
  t0=1'b0; t1=1'b0; t2=1'b0; t3=1'b0; t4=1'b1; t5=1'b1; t6=1'b1; 
 end
 else if(b0 ==1'b1 && b1 ==1'b0 && b2 ==1'b0)
 begin
  t0=1'b0; t1=1'b0; t2=1'b0; t3=1'b1; t4=1'b1; t5=1'b1; t6=1'b1; 
 end
 else if(b0 ==1'b1 && b1 ==1'b0 && b2 ==1'b1)
 begin
  t0=1'b0; t1=1'b0; t2=1'b1; t3=1'b1; t4=1'b1; t5=1'b1; t6=1'b1; 
 end
 else if(b0 ==1'b1 && b1 ==1'b1 && b2 ==1'b0)
 begin
  t0=1'b0; t1=1'b1; t2=1'b1; t3=1'b1; t4=1'b1; t5=1'b1; t6=1'b1; 
 end
 else
 begin
  t0=1'b1; t1=1'b1; t2=1'b1; t3=1'b1; t4=1'b1; t5=1'b1; t6=1'b1; 
 end
end
endmodule