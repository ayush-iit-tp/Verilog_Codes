module four_inp_nand(y, a, b, c ,d);

input  a,b,c,d;

wire d1,d2,d3,d4;

output y;

mynand first_level1(.a(a),.b(b),.y(d1));
mynand second_level1(.a(c),.b(d),.y(d2));
mynand not1(.a(d1),.b(d1),.y(d3));
mynand not2(.a(d2),.b(d2),.y(d4));
mynand final(.a(d3),.b(d4),.y(y));

endmodule