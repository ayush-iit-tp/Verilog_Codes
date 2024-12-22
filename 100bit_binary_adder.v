module 100bit_binary_adder( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum);
    assign{cout,sum}=a+b+cin;
endmodule
