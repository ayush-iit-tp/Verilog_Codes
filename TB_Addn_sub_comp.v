//TB_N_bit subtractor
module TB_Addn_sub_comp#(parameter N=4) ();

reg [N-1:0]a,b;// declared as inputs // declared as output
wire [N-1:0]diff;
wire [N-1:0]sum;
reg borin;
reg cin;
wire cout;
wire borout;
reg oprtn1;
reg oprtn2;
reg oprtn3;
wire aisbig;
wire bisbig;
wire equal;
//callling module full adder
add_sub_comp t(.a(a),.b(b),.oprtn1(oprtn1),.oprtn2(oprtn2),.oprtn3(oprtn3),.cout(cout),.borout(borout),.cin(cin),.borin(borin),.aisbig(aisbig),.bisbig(bisbig),.equal(equal),.diff(diff),.sum(sum));
initial
begin 
a[0]=1'b1; b[0]= 1'b1;   a[1]=1'b1; b[1]= 1'b0; a[2]=1'b0; b[2]= 1'b1;   a[3]=1'b1; b[3]= 1'b1;borin=1'b1;cin=1'b1;oprtn1=1'b0;oprtn2=1'b1;oprtn3=1'b0;//subtraction ki
#100  a[0]=1'b0; b[0]= 1'b0;   a[1]=1'b0; b[1]= 1'b0;   a[2]=1'b1; b[2]= 1'b1;   a[3]=1'b0; b[3]= 1'b1;borin=1'b0;cin=1'b0;oprtn1=1'b1;oprtn2=1'b0;oprtn3=1'b0;//addition ki  
#100  a[0]=1'b1; b[0]= 1'b1;   a[1]=1'b1; b[1]= 1'b0;   a[2]=1'b0; b[2]= 1'b1;   a[3]=1'b1; b[3]= 1'b1;borin=1'b0;cin=1'b1;oprtn1=1'b0;oprtn2=1'b0;oprtn3=1'b1;//comparison ki 
#100  a[0]=1'b0; b[0]= 1'b1;   a[1]=1'b1; b[1]= 1'b1;   a[2]=1'b1; b[2]= 1'b1;   a[3]=1'b1; b[3]= 1'b1;borin=1'b1;cin=1'b0;oprtn1=1'b0;oprtn2=1'b1;oprtn3=1'b0;//subtraction ki 

end
endmodule