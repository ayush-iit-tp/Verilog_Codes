// test bench for full adder

module TB_Halfsubtractor();

reg a , b;// declared as inputs // declared as output
wire diff,borout;

//callling module full adder
half_subtractor n1(.a(a),.b(b),.diff(diff),.bor(borout));
initial
begin 
#100 a=1'b1; b= 1'b1;
#100 a=1'b1; b= 1'b0; 
#100 a=1'b0; b= 1'b1; 
#100 a=1'b0; b= 1'b0; 
end
endmodule