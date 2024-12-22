`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2024 15:27:32
// Design Name: 
// Module Name: even
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


module even(a,even,odd);
input [3:0] a;
output reg even,odd;
always@(*)
 begin
    if(a[0]==1'b1)
       begin
        odd=1'b1;
        even=1'b0;
    end
     else
     begin
     odd=1'b0;
     even=1'b1;
end
end
endmodule
