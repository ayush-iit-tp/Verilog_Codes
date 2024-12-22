//designing  in half adder
// sum= a xor b , cout= a and b
// Written by Krishna Bhagat

//module MODULE NAME
module Half_Adder(a,b,Sum,Cout);  //special charecters are not allowed only underscore is allowed
input a , b;//inputs a and b bits with size 1 bit
output Sum,Cout;// Sum and Cout are outputs with size 1-bit
assign Sum= a^ b;
assign Cout = a& b;
	
endmodule 