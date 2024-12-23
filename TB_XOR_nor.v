// test bench

module tb_XOR_nor();

reg a2, b2;
wire y2;

XOR_nor temp(.a1(a2),.b1(b2),.y1(y2));
initial 
begin
a2=1'b0; b2=1'b0;
#100 a2=1'b1; b2=1'b0;
#100 a2=1'b0; b2=1'b1;
#100 a2=1'b1; b2=1'b1;
end
endmodule