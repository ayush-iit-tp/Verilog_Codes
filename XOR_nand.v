/* Or gate with 2 1 bit inputs
Sum = a or b*/   /* */  //is used for multiline commmenting

module XOR_nand(a1,b1,y1);

input a1 ,b1;
wire d1,d3,d4;
output y1;

mynand nand1 (.a(a1),.b(b1),.y(d1));
mynand nand2 (.a(a1),.b(d1),.y(d3));
mynand nand3 (.a(b1),.b(d1),.y(d4));
mynand nand4 (.a(d3),.b(d4),.y(y1));

endmodule
//things in red mean preassigned things!!!