`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 03:10:15
// Design Name: 
// Module Name: n_bit_rca
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

// made by ayush ee23m114
module n_bit_rca #(parameter N=8)(a,b,cin,sum);
    input [N-1:0]a,b;
    input cin;
    output [N:0]sum;
    
wire [N+1:0]C;
wire c1,c2,c3;      //Carry out of each full adder

assign C[0]=cin;

genvar i;
generate
for(i=0; i<N ;i=i+1)
begin :ayush

fa fa0(.a(a[i]),.b(b[i]),.cin(C[i]),.sum(sum[i]),.cout(C[i+1]));

end:ayush
endgenerate

fa fan(.a(a[N-1]),.b(b[N-1]),.cin(C[N]),.sum(sum[N]),.cout(C[N+1]));

endmodule
