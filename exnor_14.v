`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 02:30:45
// Design Name: 
// Module Name: exnor_14
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
module exnor_14(
a,b,y
    );
    input  [3:0]a;
    input  [3:0]b;
    output  [3:0]y;
    assign y = ~(a ^ b);
endmodule
