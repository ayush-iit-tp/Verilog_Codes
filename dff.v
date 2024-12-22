module dff(
    input clk,  
    input d,
    output reg q );
    always @(posedge clk)
   begin // Use a clocked always block
     q <=d; //   copy d to q at every positive edge of clk
 //   Clocked always blocks should use non-blocking assignments
end
endmodule
