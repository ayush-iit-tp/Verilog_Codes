/* Or gate with 2 1 bit inputs
Sum = a or b*/   /* */  //is used for multiline commmenting

module mynor(a,b,y);

input a ,b;
wire temp1,temp2,temp3;
output y;

assign y=~(a | b);


endmodule
//things in red mean preassigned things!!!