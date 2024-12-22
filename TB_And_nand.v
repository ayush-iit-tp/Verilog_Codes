// test bench

module tb_And_nand();

reg a1, b1;
wire y1;

And_nand temp(.a1(a1),.b1(b1),.y1(y1));
initial 
begin
a1=1'b0; b1=1'b0;
#100 a1=1'b1; b1=1'b0;
#100 a1=1'b0; b1=1'b1;
#100 a1=1'b1; b1=1'b1;
end

endmodule
