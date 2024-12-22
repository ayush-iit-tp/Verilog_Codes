`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2024 01:54:34
// Design Name: 
// Module Name: comb_1_practice
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


module comb_2_practice(
a,y
    );
    
    
    input [15:0]a;
    output [15:0]y;
    assign y[15:0]= {a[7:4],a[3:0],a[15:12],a[11:8]};  
endmodule
