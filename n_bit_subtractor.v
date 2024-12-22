// n bit subtractor

module n_bit_subtractor #(parameter  N=4)(a,b,D,enable,borin,borout);

input [N-1:0]a,b;
input borin,enable;
output [N-1:0]D;
wire [N:0]diff;
output borout;
assign diff[0]=borin;

genvar i;
generate
    for(i=0;i<N;i=i+1) begin: FS
    full_subtractor FS_inst (
            .a(a[i]&enable),
            .b(b[i]&enable),
            .borin(diff[i]&enable),
            .diff(D[i]),
            .borout(diff[i+1])
        );
end
endgenerate
assign borout=diff[N];
   
endmodule