
module TB_four_in_mux();

reg [3:0]I;//inputs to module
reg [1:0]s;
wire out;

//call or gare module
four_i_one_cond t(.i(I),.s(s),.out(out));
initial 
begin

     I[0] = 1'b1;I[1] = 1'b0;I[2] = 1'b0;I[3] = 1'b0;   s[0] = 1'b0;s[1] = 1'b0;
#100 I[0] = 1'b0;I[1] = 1'b1;I[2] = 1'b1;I[3] = 1'b1;   s[0] = 1'b0;s[1] = 1'b0;
#100 I[0] = 1'b0;I[1] = 1'b1;I[2] = 1'b0;I[3] = 1'b0;   s[0] = 1'b0;s[1] = 1'b1;
#100 I[0] = 1'b1;I[1] = 1'b0;I[2] = 1'b1;I[3] = 1'b1;   s[0] = 1'b0;s[1] = 1'b1;
#100 I[0] = 1'b0;I[1] = 1'b0;I[2] = 1'b1;I[3] = 1'b0;   s[0] = 1'b1;s[1] = 1'b0;
#100 I[0] = 1'b0;I[1] = 1'b0;I[2] = 1'b0;I[3] = 1'b1;   s[0] = 1'b1;s[1] = 1'b1;
 
end

endmodule