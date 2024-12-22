//two_in one via conditionals

module two_in_one_cond(a,s,out);

input [1:0]a;
input s;
output out;
assign out=s? a[1] : a[0];
endmodule 