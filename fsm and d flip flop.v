// D flip-flops are initially reset to zero before the machine begins.
module top_module (
    input clk,
    input x,
    output z
); 
    reg q1,q2,q3; 
    initial z=1;
    always @(posedge clk)
        begin
             q1 = x ^ q1 ;
             q2 = x & ~q2 ;
             q3 = x | ~q3 ;
            z <=~(q1|q2|q3);
        end
endmodule
