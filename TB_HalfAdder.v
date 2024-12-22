// test bench for full adder

module TB_Halfadder();

reg a , b;// declared as inputs // declared as output
wire sum,cout;

//callling module full adder
HalfAdder_Struct n1(.x(a),.y(b),.sum(sum),.cout(cout));

initial
begin 
#100 a=1'b1; b= 1'b1;
#100 a=1'b1; b= 1'b0; 
#100 a=1'b0; b= 1'b1; 
#100 a=1'b0; b= 1'b0; 
end
endmodule