module full_subtractor(a,b,borin,diff,borout);

input a,b,borin;
output diff,borout;
wire w1,w2,w3;
half_subtractor first(.a(a),.b(b),.diff(w1),.bor(w2));
half_subtractor second(.a(w1),.b(borin),.diff(diff),.bor(w3));
or (borout,w3,w2);
endmodule