
module tb_Not_nand();

reg a2; 
wire y2;

Not_nand tb(.a1(a2),.y1(y2));

initial
begin
a2 = 1'b0;
#100 a2 = 1'b1;
end
endmodule