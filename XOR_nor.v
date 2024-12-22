/* Or gate with 2 1 bit inputs
Sum = a or b*/   /* */  //is used for multiline commmenting

module XOR_nor(a1,b1,y1);

input a1 ,b1;
wire d1,d3,d4,d5;
output y1;

mynor nor1 (.a(a1),.b(b1),.y(d1));
mynor nor2 (.a(a1),.b(d1),.y(d3));
mynor nor3 (.a(b1),.b(d1),.y(d4));
mynor nor4 (.a(d3),.b(d4),.y(d5));
mynor nor5 (.a(d5),.b(d5),.y(y1));
endmodule
//things in red mean preassigned things!!!