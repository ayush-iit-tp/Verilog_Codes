`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 01:34:04
// Design Name: 
// Module Name: adds_sub
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


module adds_sub #(parameter N=8)(x0,x1,x2,x3,x4,x5,x6,x7,y);
    input [N-1:0] x0,x1,x2,x3,x4,x5,x6,x7;
    output [N-3:0]y;
    wire [N:0] t0,t1,t2,t3;
    wire [N+1:0] p0,p1;
    
    n_bit_rca rca1(.a(),.b(),.cin(),.sum());
    
endmodule





