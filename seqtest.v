module seqtest();
reg x,clk,reset;
wire z;
sequencedetect DUT (x,clk,z,reset);
initial
begin
clk=1'b0; reset=1'b1;
#15 reset=1'b0;
end
always #5 clk=~clk;
initial
begin
#10 x=1;
#5 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;
end
endmodule