module OR_nand(x1,x2,out);
input x1 ,x2;
output out;

wire temp1, temp2;

mynand first(.a(x1),.b(x1),.y(temp1));
mynand second(.a(x2),.b(x2),.y(temp2));
mynand final(.a(temp1),.b(temp2),.y(out));

endmodule