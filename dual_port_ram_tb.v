module dual_port_ram_tb;
    reg [7:0] data_a, data_b;   // Test data inputs for Port A and Port B
    reg [5:0] addr_a, addr_b;   // Test addresses for Port A and Port B
    reg we_a, we_b;             // Test write enables for Port A and Port B
    reg clk;                    // Test clock
    wire [7:0] q_a, q_b;        // Test outputs for Port A and Port B

    // Instantiate the Dual-Port RAM module
    dual_port_ram uut (
        .data_a(data_a),
        .data_b(data_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .we_a(we_a),
        .we_b(we_b),
        .clk(clk),
        .q_a(q_a),
        .q_b(q_b)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // Clock toggles every 5 time units

    // Test procedure
    initial begin
        // Initialize signals
        we_a = 0; we_b = 0; data_a = 8'd0; data_b = 8'd0;
        addr_a = 6'd0; addr_b = 6'd0;

        // Test 1: Write to Port A and Port B simultaneously
        #10;
        we_a = 1; data_a = 8'hAA; addr_a = 6'd0;
        we_b = 1; data_b = 8'hBB; addr_b = 6'd1; #10;

        // Test 2: Read from Port A and Port B simultaneously
        we_a = 0; addr_a = 6'd0;
        we_b = 0; addr_b = 6'd1; #10;

        // Test 3: Write to Port A while reading from Port B
        we_a = 1; data_a = 8'hCC; addr_a = 6'd2;
        we_b = 0; addr_b = 6'd1; #10;

        // Test 4: Write to Port B while reading from Port A
        we_a = 0; addr_a = 6'd0;
        we_b = 1; data_b = 8'hDD; addr_b = 6'd3; #10;

        // Test 5: Overwrite a value in Port A
        we_a = 1; data_a = 8'hEE; addr_a = 6'd0;
        we_b = 0; addr_b = 6'd3; #10;

        // Test 6: Read overwritten value in Port A
        we_a = 0; addr_a = 6'd0; #10;

        // Test 7: Simultaneous read from both ports at different addresses
        addr_a = 6'd2;
        addr_b = 6'd3; #10;

        // End of simulation
        $stop;
    end

    // Monitor signals for debugging
    initial begin
        $monitor("Time=%0t | we_a=%b addr_a=%0d data_a=%h q_a=%h | we_b=%b addr_b=%0d data_b=%h q_b=%h",
                 $time, we_a, addr_a, data_a, q_a, we_b, addr_b, data_b, q_b);
    end
endmodule
