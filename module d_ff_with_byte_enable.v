module d_ff_with_byte_enable
(
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk)
        begin
            if(resetn==1'b0)
                q<=1'b0;
            else if (byteena==2'b00)
                q <=q;
            else if (byteena==2'b01)
                q[7:0]<=d[7:0];
            else if (byteena==2'b10)
                q[15:8]<=d[15:8];
            else if(byteena==2'b11)
                q<=d;          
        end
endmodule
