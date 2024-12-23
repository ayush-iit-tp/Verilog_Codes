//test bench for full adder

module TB_FullAdder();
// Sum= a xor b xor Cin
// Cout (a xor b).Cin +a.b
reg a , b, Cin;
wire Sum, Cout;

full_adder_struct name(.a(a),.b(b),.cin(Cin),.sum(Sum),.cout(Cout)); 
initial
begin
    a=1'b0; b=1'b0; Cin=1'b0;
#10 a=1'b0; b=1'b0; Cin=1'b1;
#10 a=1'b0; b=1'b1; Cin=1'b0;
#10 a=1'b0; b=1'b1; Cin=1'b1;
#10 a=1'b1; b=1'b0; Cin=1'b0;
#10 a=1'b1; b=1'b0; Cin=1'b1;
#10 a=1'b1; b=1'b1; Cin=1'b0;
#10 a=1'b1; b=1'b1; Cin=1'b1;

end

endmodule