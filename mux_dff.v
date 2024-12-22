module mux_dff (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    always @(posedge clk)
        begin
            if(L==1'b0)
                Q<=q_in;
                else
               Q<=r_in;     
        end
endmodule
