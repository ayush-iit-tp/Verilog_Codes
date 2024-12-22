module exor_14(
a,b,y
    );
    input  [3:0]a;
    input  [3:0]b;
    output  [3:0]y;
    assign y = a ^ b;
endmodule