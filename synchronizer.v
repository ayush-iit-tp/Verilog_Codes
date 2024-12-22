module synchronizer #(parameter WIDTH=3) 
  (input clk_A, clk_B, rst_n, [WIDTH:0] d_in, 
   output reg [WIDTH:0] d_out);

  reg [WIDTH:0] q1;  // Intermediate register in clk_B domain

  // First flip-flop: Transfers data from clk_A domain
  reg [WIDTH:0] d_in_clkB;
  always @(posedge clk_A or negedge rst_n) begin
    if (!rst_n) begin
      d_in_clkB <= 0; 
    end 
    else begin
      d_in_clkB <= d_in;  
    end
  end

  // Second and third flip-flops: Stabilize data in clk_B domain
  always @(posedge clk_B or negedge rst_n) begin
    if (!rst_n) begin
      q1 <= 0;       
      d_out <= 0;    
    end 
    else begin
      q1 <= d_in_clkB;  
      d_out <= q1;      
    end
  end
endmodule

