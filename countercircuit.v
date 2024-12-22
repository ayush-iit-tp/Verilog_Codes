`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 14:00:45
// Design Name: 
// Module Name: countercircuit
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


module countercircuit( t,clk,rst,q,qbar);
parameter N=8;
input t,clk,rst;
output [N-1:0]q;
output [N-1:0]qbar;
wire [0:N-2]x;
tfilipflop t1(.t(t),.clk(clk),.rst(rst),.q(q[0]),.qbar(qbar[0]),.x(x[0]));
genvar i;
generate 
for(i=0;i<N-1;i=i+1)
begin
tfilipflop t2(.t(x[i]),.clk(clk),.rst(rst),.q(q[i+1]),.qbar(qbar[i+1]),.x(x[i+1]));
end
endgenerate
TF_MSB tn(.t(x[N-2]),.clk(clk),.rst(rst),.q(q[N-1]),.qbar(qbar[N-1]));
endmodule
