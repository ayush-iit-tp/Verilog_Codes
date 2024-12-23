// 4-1 mux

module four_in_mux(I,s,out);

input [3:0]I;
input [1:0]s;
output out;

assign out= (s[0])&(s[1])&I[3] | (s[0])&(~s[1])&I[2] | (~s[0])&(s[1])&I[1] | (~s[0])&(~s[1])&I[0];

endmodule
