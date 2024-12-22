`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 00:49:54
// Design Name: 
// Module Name: practice
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
module practice(
a,b,y,t1,t2,t3,t4,s0,s1
    );
   input [3:0]a;
   input [3:0]b;
   input s0,s1;
   input wire [3:0]t1;
   input wire [3:0]t2;
   input wire [3:0]t3;
   input wire [3:0]t4;
   output[3:0]y;
   
add_14 b1(.a(a),.b(b),.y(t1));
mul_14 b2(.a(a),.b(b),.y(t2));
exor_14 b3(.a(a),.b(b),.y(t3));
exnor_14 b4(.a(a),.b(b),.y(t4));

assign y =s0 ?(s1?(t4) :(t3)):(s1?(t2) : (t1));

 endmodule