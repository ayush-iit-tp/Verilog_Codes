/* Or gate with 2 1 bit inputs
Sum = a or b*/   /* */  //is used for multiline commmenting

module And_nor(a,b,y);

input a ,b;
wire temp1,temp2;
output y;

mynor nor1(.a(a),.b(a),.y(temp1));
mynor nor2(.a(b),.b(b),.y(temp2));
mynor nor3(.a(temp1),.b(temp2),.y(y));


endmodule
//things in red mean preassigned things!!!