//ternary conditional operatros
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0]t1,t2;
    assign t1=a<b?a:b;
    assign t2=c<d?c:d;
    assign min =t1<t2?t1:t2;
endmodule

//reduction operators
module top_module (
    input [7:0] in,
    output parity); 
    assign parity=^in[7:0];
endmodule

//The replication operator
module top_module (
    input [7:0] in,
    output [31:0] out );//
    assign out = {{24{in[7]}}, in[7:0]};

endmodule

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    
    assign out_or_bitwise[0] = a[0] | b[0];
    assign out_or_bitwise[1] = a[1] | b[1];
    assign out_or_bitwise[2] = a[2] | b[2];
    
    assign out_or_logical =a || b;
    
    assign out_not[0]=~a[0];
    assign out_not[1]=~a[1];
    assign out_not[2]=~a[2];
    assign out_not[3]=~b[0];
    assign out_not[4]=~b[1];
    assign out_not[5]=~b[2];
endmodule

