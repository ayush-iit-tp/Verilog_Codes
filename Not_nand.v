/* Or gate with 2 1 bit inputs
Sum = a or b*/   /* */  //is used for multiline commmenting

module Not_nand(a1,y1);

input a1 ;
output y1;

mynand temp(.a(a1),.b(a1),.y(y1));
endmodule
//things in red mean preassigned things!!!