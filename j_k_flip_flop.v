//module jk flipflop

module jkff(x,y,A,B,Aout,Bout,z);
input x,y,A,B;
output  Aout,Bout,z;
reg Ja,Jb,Ka,Kb;
assign Ja=((~A&x) | ((~B)&y));
assign Jb=((~A)&x&y);
assign Ka = B&(~x)&(~y);
assign Kb = (~A) | (~B)&x;
assign Aout=((Ja&(~A))| ((~Ka)&A));
assign Bout=((Jb&(~B))| ((~Kb)&B)); 
assign z=~A&~x | ~B&~y;
endmodule

/*
solution to q no 5.10 in digital design  verilog
input x,y,A,B;
output  Aout,Bout,z;
reg Ja,Jb,Ka,Kb;
assign Ja=((~A&x) | ((~B)&y));
assign Jb=((~A)&x&y);
assign Ka = B&(~x)&(~y);
assign Kb = (~A) | (~B)&x;
assign Aout=((Ja&(~A))| ((~Ka)&A));
assign Bout=((Jb&(~B))| ((~Kb)&B)); 
assign z=~A&~x | ~B&~y;
endmodule
*/