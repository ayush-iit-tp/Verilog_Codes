module full_adder_struct(a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;
assign sum= (a^b^cin);
assign cout= (((a^b)&cin) | (a&b));

wire t1,t2,t3;
wire struct_sum,struct_cout;
Half_Adder one(.a(a),.b(b),.Sum(t1),.Cout(t2));
Half_Adder two(.a(t1),.b(cin),.Sum(struct_sum),.Cout(t3));
or (struct_cout,t3,t2);

reg behav_sum,behav_cout;
always @(a or b or cin)
begin
if(a^b==cin)
	behav_sum=1'b0;
	
else
	behav_sum=1'b1;
if((a^b)&cin==1 || a&b==1)
	behav_cout=1'b1;
else
	behav_cout=1'b0;
end
endmodule