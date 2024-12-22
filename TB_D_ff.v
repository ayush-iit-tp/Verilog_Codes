module t_DFF (); 
wire Q; 
reg clk, preset, clear; 
reg D; 
DFF M0 (.Q, .D, .clk, .preset, .clear); 
initial #160 $finish; 
initial begin clk = 0; forever #5 clk = ~clk; end
initial fork 
 preset = 0; 
 #20 preset = 1; 
 #50 clear = 0; 
 #80 clear = 1; 
 #10 D = 1; 
 #100 D = 0; 
 #200 D = 1; 
join
endmodule