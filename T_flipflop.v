`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module T_flipflop_test();
reg clk1, rst1 , T;
wire Q,Q_bar;

  T_flipflop DUT(.clk(clk1),.rst_n(rst1),.t(T),.q(Q),.q_bar(Q_bar));  
               
  initial
   begin  
     clk1 <= 0;  
  forever #5 clk1 = ~clk1;
    end
    initial
    begin
    rst1=1'b1;
    #5 rst1=1'b0; T=1'b1;
    #5 T=1'b0;
    #5 T=1'b1;
    #10 T=1'b0;
    end
    initial
#100 $finish;
endmodule    
   