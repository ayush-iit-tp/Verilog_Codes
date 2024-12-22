//tb for 4 input nand

module TB_4inp_nand();

reg a,b,c,d;
wire y;

four_inp_nand temp(.y(y), .a(a), .b(b), .c(c) ,.d(d));

initial
begin
 a=1'b0; b=1'b0;c=1'b0;d=1'b0;
#100 a=1'b0; b=1'b0;c=1'b0;d=1'b1;
#100 a=1'b0; b=1'b0;c=1'b1;d=1'b0;
#100 a=1'b0; b=1'b0;c=1'b1;d=1'b1;
#100 a=1'b0; b=1'b1;c=1'b0;d=1'b0;
#100 a=1'b0; b=1'b1;c=1'b0;d=1'b1;
#100 a=1'b0; b=1'b1;c=1'b1;d=1'b0;
#100 a=1'b0; b=1'b1;c=1'b1;d=1'b1;
#100 a=1'b1; b=1'b0;c=1'b0;d=1'b0;
#100 a=1'b1; b=1'b0;c=1'b0;d=1'b1;
#100 a=1'b1; b=1'b0;c=1'b1;d=1'b0;
#100 a=1'b1; b=1'b0;c=1'b1;d=1'b1;
#100 a=1'b1; b=1'b1;c=1'b0;d=1'b0;
#100 a=1'b1; b=1'b1;c=1'b0;d=1'b1;
#100 a=1'b1; b=1'b1;c=1'b1;d=1'b0;
#100 a=1'b1; b=1'b1;c=1'b1;d=1'b1;
end
endmodule

