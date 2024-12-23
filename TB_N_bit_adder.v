module TB_n_bit_adder#(parameter N=4) ();

reg [N-1:0]a,b;// declared as inputs // declared as output
reg cin;
wire [N-1:0]sum;
wire cout;

//callling module full adder
n_bit_adder t(.a(a),.b(b),.cin(cin),.cout(cout),.enable(0),.s(sum));

initial
begin 
a[0]=1'b1; b[0]= 1'b1;   a[1]=1'b1; b[1]= 1'b0;   a[2]=1'b0; b[2]= 1'b1;   a[3]=1'b1; b[3]= 1'b1;cin=1'b1;
#100  a[0]=1'b0; b[0]= 1'b0;   a[1]=1'b0; b[1]= 1'b0;   a[2]=1'b1; b[2]= 1'b1;   a[3]=1'b0; b[3]= 1'b1;cin=1'b0;  
#100  a[0]=1'b1; b[0]= 1'b1;   a[1]=1'b1; b[1]= 1'b0;   a[2]=1'b0; b[2]= 1'b1;   a[3]=1'b1; b[3]= 1'b1;cin=1'b1; 
#100  a[0]=1'b0; b[0]= 1'b1;   a[1]=1'b1; b[1]= 1'b1;   a[2]=1'b1; b[2]= 1'b1;   a[3]=1'b1; b[3]= 1'b1;cin=1'b0; 

end
endmodule