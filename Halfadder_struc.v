module HalfAdder_Struct(x,y,sum,cout);

input x,y;
output sum,cout;
assign sum= (x^y);
assign cout= (x&y);

wire stuct_sum,stuct_cout;

xor n1(stuct_sum,x,y);
and n2(stuct_cout,x,y);

reg behav_sum,behav_cout;
always @(x or y)
begin
if(x==1'b1 && y==1'b1)
	behav_cout=1;
else
	behav_cout=0;

if((x==1'b0 && y==1'b1) || (x==1'b1 && y==1'b0))
	behav_sum=1;
else
	behav_sum=0;
end


endmodule
