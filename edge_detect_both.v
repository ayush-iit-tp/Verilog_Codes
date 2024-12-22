module edge_both_detect (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]middle;
    always @(posedge clk)
        begin
            middle <= in;
            anyedge <= middle ^in;
        end
endmodule
