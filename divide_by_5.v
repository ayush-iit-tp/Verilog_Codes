module divide_by_5 (
    input clk,        // Input clock
    input rst,        // Active-high reset
    output reg clk_out // Output clock (1/5th frequency of input clock)
);

    reg [2:0] count; // 3-bit counter for mod-5

    // Mod-5 Counter
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 0;
        else if (count == 4)
            count <= 0; // Reset counter after counting 5 clocks
        else
            count <= count + 1;
    end

    // Generate Output Clock Signal
    always @(posedge clk or posedge rst) begin
        if (rst)
            clk_out <= 0;
        else if (count == 4)
            clk_out <= ~clk_out; // Toggle clk_out at the end of every mod-5 cycle
    end

endmodule
