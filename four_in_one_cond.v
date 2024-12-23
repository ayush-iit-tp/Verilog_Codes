//four in one mux via condtionals
module four_i_one_cond(i,s,out);

input [3:0]i;
input [1:0]s;
output out;
reg [1:0]i1;
reg [1:0]i2;
wire [1:0]w1;

    assign i1[0]=i[0];
    assign i1[1]=i[1];
    assign i2[0]=i[2];
    assign i2[1]=i[3];

two_in_one_cond one(.a(i1),.s(s[0]),.out(w1[0]));
two_in_one_cond two(.a(i2),.s(s[0]),.out(w1[1]));
two_in_one_cond three(.a(w1),.s(s[1]),.out(out));
endmodule