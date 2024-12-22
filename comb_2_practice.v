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


module comb_1_practice(
a,y,t0,t1
    );
    input [7:0]a;
    input t0,t1;
    output reg y;
    assign t0 =1'b0;
    assign t1 =1'b1;
    
    always @(*) begin
     if (a[0]==1'b1) begin
     y=t0;
     end
     else begin
     y=t1;
     end
    end
endmodule