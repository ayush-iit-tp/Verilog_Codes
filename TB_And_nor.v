// test bench

module tb_And_nor();

reg a1, b1;
wire y1;

And_nor temp1(.a(a1),.b(b1),.y(y1));
initial 
begin
a1=1'b0; b1=1'b0;
#100 a1=1'b1; b1=1'b0;
#100 a1=1'b0; b1=1'b1;
#100 a1=1'b1; b1=1'b1;
end

endmodule
