/* Or gate with 2 1 bit inputs
Sum = a or b*/   /* */  //is used for multiline commmenting

module And_nand(a1,b1,y1);

input a1 ,b1;
wire d1;
output y1;

mynand nand1 (.a(a1),.b(b1),.y(d1));
mynand nand2 (.a(d1),.b(d1),.y(y1));


endmodule
//things in red mean preassigned things!!!