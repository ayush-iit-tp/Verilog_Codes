module abcd_swap_ayush(data,rd);
input [15:0] data;
output reg [15:0] rd;
always@(*)
begin
rd[15:8] = data[7:0];
rd[7:0] = data[15:8];
end
endmodule