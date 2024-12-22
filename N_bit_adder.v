module n_bit_adder #(parameter N=4)(a,b,cin,cout,enable,s);

input [N-1:0] a,b;
input cin;
input enable;
output cout;
output [N-1:0]s;
wire [N:0]c;
assign c[0]=cin;

genvar i;

generate 

for (i = 0; i < N ; i= i+1) begin : FA //usedefined name 

full_adder_struct name(.a((a[i])&(enable)),.b(b[i]&(enable)),.cin(c[i]&(enable)),.sum(s[i]),.cout(c[i+1])); // {Cout, Sum} = a + b + cin

end
assign cout=c[N];
endgenerate
endmodule