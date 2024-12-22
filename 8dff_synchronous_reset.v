module 8dff_synchronous_reset(
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk)
        begin
            if (reset) 
             q=0;
            else
                q=d;
        end
endmodule
