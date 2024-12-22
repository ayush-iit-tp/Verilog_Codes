module decade_counter (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk)
        begin
             if(reset)
              q <= 4'd0; 
            else if(slowena == 4'd1)
                begin:ayush
                 if(q >= 4'd0 && q <= 4'd8)
                       q <= q+1;     
                else
                      q <= 4'd0;   
                end
        end
endmodule
