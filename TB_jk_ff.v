//module testBench
module TB_jk_ff();

reg x,y;
reg A,B;
wire Aout,Bout,z;
jkff ff(.x(x),.y(y),.A(A),.B(B),.Aout(Aout),.Bout(Bout),.z(z));

initial begin
      x=1'b0;  y=1'b0;  A=1'b0;  B=1'b0;
#100  x=1'b0;  y=1'b0;  A=1'b0;  B=1'b1; 
#100  x=1'b0;  y=1'b0;  A=1'b1;  B=1'b0; 
#100  x=1'b0;  y=1'b0;  A=1'b1;  B=1'b1; 
#100  x=1'b0;  y=1'b1;  A=1'b0;  B=1'b0; 
#100  x=1'b0;  y=1'b1;  A=1'b0;  B=1'b1; 
#100  x=1'b0;  y=1'b1;  A=1'b1;  B=1'b0; 
#100  x=1'b0;  y=1'b1;  A=1'b1;  B=1'b1;
#100  x=1'b1;  y=1'b0;  A=1'b0;  B=1'b0;
#100  x=1'b1;  y=1'b0;  A=1'b0;  B=1'b1; 
#100  x=1'b1;  y=1'b0;  A=1'b1;  B=1'b0; 
#100  x=1'b1;  y=1'b0;  A=1'b1;  B=1'b1; 
#100  x=1'b1;  y=1'b1;  A=1'b0;  B=1'b0; 
#100  x=1'b1;  y=1'b1;  A=1'b0;  B=1'b1; 
#100  x=1'b1;  y=1'b1;  A=1'b1;  B=1'b0; 
#100  x=1'b1;  y=1'b1;  A=1'b1;  B=1'b1;
end

endmodule