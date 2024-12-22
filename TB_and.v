// test bench

module tb_and();

reg a1, b1;
wire y1;

myand temp(.a(a1),.b(b1),.y(y1));
initial 
begin
a1=1'b0; b1=1'b0;
#100 a1=1'b1; b1=1'b0;
#100 a1=1'b0; b1=1'b1;
#100 a1=1'b1; b1=1'b1;
end

endmodule

