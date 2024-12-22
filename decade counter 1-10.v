module decade_1to10 (
    input clk,
    input reset,
    output [3:0] q);
    always @(posedge clk)
        begin
            if(reset)
                q <= 4'd1;
            else if(q >= 4'd1 && q <=4'd9)
                q <= q+1;
            else
                q <= 4'd1;
        end
endmodule
