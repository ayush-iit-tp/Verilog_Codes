`timescale 1ns / 1ps

module fifo_tb;

    // Parameters for FIFO
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 6; // For depth of 2^6 = 64

    // Signals for DUT (Device Under Test)
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] buf_in;
    wire [DATA_WIDTH-1:0] buf_out;
    wire buf_full;
    wire buf_empty;
    wire [7:0] fifo_counter;

    // Instantiate the FIFO module
    Fifo dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .buf_in(buf_in),
        .buf_out(buf_out),
        .fifo_counter(fifo_counter),
        .buf_empty(buf_empty),
        .buf_full(buf_full)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // Clock with a period of 20ns
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        buf_in = 0;

        #50;  // Hold reset for some time
        rst = 0;

        // Test Case 1: Write data into FIFO
        $display("Test Case 1: Writing to FIFO");
        repeat (10) begin
            @(posedge clk);
            wr_en = 1;
            buf_in = buf_in + 1;  // Increment data on every write
        end
        wr_en = 0;
        #50;

        // Test Case 2: Read data from FIFO
        $display("Test Case 2: Reading from FIFO");
        repeat (10) begin
            @(posedge clk);
            rd_en = 1;
        end
        rd_en = 0;
        #50;

        // Test Case 3: Write until FIFO full
        $display("Test Case 3: Writing until FIFO full");
        while (!buf_full) begin
            @(posedge clk);
            wr_en = 1;
            buf_in = buf_in + 1;
        end
        wr_en = 0;
        $display("FIFO is full, fifo_counter = %d", fifo_counter);
        #50;

        // Test Case 4: Read until FIFO empty
        $display("Test Case 4: Reading until FIFO empty");
        while (!buf_empty) begin
            @(posedge clk);
            rd_en = 1;
        end
        rd_en = 0;
        $display("FIFO is empty, fifo_counter = %d", fifo_counter);
        #50;

        // Test Case 5: Simultaneous Write and Read
        $display("Test Case 5: Simultaneous Write and Read");
        buf_in = 8'hA0;  // Start with specific data value
        repeat (10) begin
            @(posedge clk);
            wr_en = 1;
            rd_en = 1;
            buf_in = buf_in + 1;  // Increment input for writing
            $display("Write data: %h, Read data: %h, fifo_counter = %d", buf_in, buf_out, fifo_counter);
        end
        wr_en = 0;
        rd_en = 0;

        // End of simulation
        $stop;
    end

endmodule

