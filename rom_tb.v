module rom_tb;
reg clk;
reg en;
reg [3:0] addr;
wire[3:0] data;

rom r1(.clk(clk),
.en(en),
.addr(addr),
.data(data)
);

initial
begin
clk =1'b1;
forever #5
clk =~clk;
end

initial 
begin
en=1'b0;
#10;

en=1'b1;
addr =4'b0010;
#10;

addr =4'b1110;
#10;

addr =4'b1000;
#10;

addr =4'b1011;
#10;

en=1'b0;
addr =4'b1111;
#10;

en=1'b1;
addr =4'b1110;
#10;

addr =4'b1010;
#10;

addr =4'b0000;
#10;

addr =4'bxxxx;
#10;

end

initial 
begin
#80 $stop;
end

endmodule