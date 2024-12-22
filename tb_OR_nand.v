module tb_OR_nand;
// test bench for or gate using nand;
reg a,b;//inputs to module
wire sum;

//call or gare module
OR_nand temp(.x1(a),.x2(b),.out(sum));
initial 
begin

#100 a = 1'b0; b =  1'b0;

#100 a = 1'b1; b = 1'b0;
#100 a = 1'b0; b = 1'b1;
#100 a = 1'b1; b = 1'b1;

end

endmodule