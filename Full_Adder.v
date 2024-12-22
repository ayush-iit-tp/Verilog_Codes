// Full Adder
//sum =a xor b xor cin 
// Cout = (a xor b)&Cin + a&b

module Full_Adder(a,b,Cin,Coutfinal,sumfinal);

input a , b, Cin;
output Coutfinal,sumfinal;

wire C0, P0;
Half_Adder halfadd1(.a(a),.b(b),.Sum(P0),.Cout(C0));
Half_Adder halfadd2(.a(C0),.b(P0),.Sum(sumfinal),.Cout(Coutfinal));

/*input a,b,Cin;
output Sum,Cout;
assign Sum= a^b^Cin;
assign Cout= (((a^b)&Cin) | (a&b));
*/
endmodule 