`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 00:36:43
// Design Name: 
// Module Name: t_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module t_ff(x,t,rst,clk,q_t);
    input t,rst,clk ;
    output reg q_t;
    input wire x;
  always @(posedge clk)
   begin
    
    if(rst)
    q_t <=0;
    else 
     begin
      if(t ==0)
      q_t <= q_t;
  
      else
      q_t <= ~q_t; 
     end
   end
 assign  x= t&q_t;
endmodule
