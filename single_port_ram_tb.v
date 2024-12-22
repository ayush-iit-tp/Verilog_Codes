module single_port_ram_tb;
    reg [7:0] data;       // Test data input
    reg [5:0] addr;       // Test address input
    reg we;               // Test write enable
    reg clk;              // Test clock
    wire [7:0] q;         // Test output

    // Instantiate the Single-Port RAM module
    single_port_ram uut (
        .data(data),
        .addr(addr),
        .we(we),
        .clk(clk),
        .q(q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // Clock toggles every 5 time units

    // Test procedure
    initial begin
        // Write data to address 0
        we = 1; data = 8'hA5; addr = 6'd0; #10;
        // Write data to address 1
        we = 1; data = 8'h5A; addr = 6'd1; #10;
        // Read data from address 0
        we = 0; addr = 6'd0; #10;
        // Read data from address 1
        we = 0; addr = 6'd1; #10;
        $stop; // End of simulation
    end
endmodule