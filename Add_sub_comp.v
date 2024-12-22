module add_sub_comp #(parameter N=4 )(a,b,oprtn1,oprtn2,oprtn3,cout,borout,cin,borin,aisbig,bisbig,equal,diff,sum);

input [N-1:0]a,b;
input oprtn1;
input oprtn2;
input oprtn3;
input cin;
input borin;
output cout;
output borout;
output [N-1:0]sum;
output [N-1:0]diff;
output aisbig;
output bisbig;
output equal;
n_bit_adder t1(.a(a),.b(b),.cin(cin),.cout(cout),.enable(oprtn1),.s(sum));
n_bit_subtractor t2(.a(a),.b(b),.D(diff),.enable(oprtn2),.borin(borin),.borout(borout));
n_bit_comparator t3(.a(a),.b(b),.enable(oprtn3) ,.aisbig(aisbig), .bisbig(bisbig), .equal(equal));

endmodule