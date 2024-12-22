`timescale 1ns / 1ps

module fifo_tb;

    // Inputs to the FIFO
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] buf_in;

    // Outputs from the FIFO
    wire [7:0] buf_out;
    wire buf_empty;
    wire buf_full;
    wire [7:0] fifo_counter;

    // Instantiate the FIFO module
    Fifo uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .buf_in(buf_in),
        .buf_out(buf_out),
        .buf_empty(buf_empty),
        .buf_full(buf_full),
        .fifo_counter(fifo_counter)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock (period = 10 ns)
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        buf_in = 0;

        // Reset the FIFO
        #20;
        rst = 0;

        // Test writing to the FIFO
        $display("Writing data to FIFO...");
        wr_en = 1;
        integer i; // Declare loop variable
        for (i = 0; i < 64; i = i + 1) begin
            buf_in = i; // Write incremental values
            #10;
        end
        wr_en = 0;

        // Check full flag
        if (buf_full) $display("FIFO is full as expected.");
        else $display("Error: FIFO should be full!");

        // Test reading from the FIFO
        $display("Reading data from FIFO...");
        rd_en = 1;
        for (i = 0; i < 64; i = i + 1) begin
            #10;
            $display("Read data: %d", buf_out);
        end
        rd_en = 0;

        // Check empty flag
        if (buf_empty) $display("FIFO is empty as expected.");
        else $display("Error: FIFO should be empty!");

        // Simultaneous read and write test
        $display("Testing simultaneous read and write...");
        rst = 1; #20; rst = 0; // Reset FIFO again
        wr_en = 1; rd_en = 1;
        buf_in = 100; // Start writing data from 100
        for (i = 0; i < 10; i = i + 1) begin
            #10;
            buf_in = buf_in + 1; // Increment input data
            $display("Read data: %d", buf_out);
        end
        wr_en = 0; rd_en = 0;

        // Finish simulation
        $display("FIFO test completed.");
        $stop;
    end

endmodule

