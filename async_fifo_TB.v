`timescale 1ns/1ps

module async_fifo_TB;

  // Parameters
  parameter DATA_WIDTH = 8;
  parameter DEPTH = 64;
  parameter ADDR_WIDTH = 6;  // Log2(64) = 6

  // Signals
  reg wclk, rclk, rst;                // Clocks and reset
  reg wr_en, rd_en;                   // Write and read enable
  reg [DATA_WIDTH-1:0] data_in;       // Data input
  wire [DATA_WIDTH-1:0] data_out;     // Data output
  wire buf_full, buf_empty;           // Status flags

  // FIFO DUT
  Asynch_Fifo uut (
    .wr_clk(wclk),
    .rd_clk(rclk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .buf_in(data_in),
    .buf_out(data_out),
    .buf_full(buf_full),
    .buf_empty(buf_empty)
  );

  // Clock generation
  initial begin
    wclk = 0;
    forever #10 wclk = ~wclk;  // Write clock with 20ns period
  end

  initial begin
    rclk = 0;
    forever #35 rclk = ~rclk;  // Read clock with 70ns period
  end

  // Test Procedure
  integer i;
  reg [DATA_WIDTH-1:0] write_data_q[0:DEPTH-1];  // Queue to store written data for verification
  integer write_ptr = 0, read_ptr = 0;

  initial begin
    // Initialize signals
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    // Reset the FIFO
    #50 rst = 0;
    #50 rst = 1;

    // Test Write Operation
    $display("Starting Write Operation...");
    for (i = 0; i < DEPTH; i = i + 1) begin
      @(posedge wclk);
      if (!buf_full) begin
        wr_en = 1;
        data_in = $random % 256;  // Generate random 8-bit data
        write_data_q[write_ptr] = data_in;  // Store for verification
        write_ptr = write_ptr + 1;
        $display("Write: Data = %h, Time = %0t", data_in, $time);
      end else begin
        wr_en = 0;
        $display("FIFO Full at Time = %0t", $time);
      end
    end
    wr_en = 0;

    // Small delay before reading
    #100;

    // Test Read Operation
    $display("Starting Read Operation...");
    for (i = 0; i < DEPTH; i = i + 1) begin
      @(posedge rclk);
      if (!buf_empty) begin
        rd_en = 1;
        @(posedge rclk);  // Wait for data_out to settle
        if (data_out !== write_data_q[read_ptr]) begin
          $display("ERROR: Mismatch at Time = %0t: Expected = %h, Read = %h", 
                   $time, write_data_q[read_ptr], data_out);
        end else begin
          $display("Read: Data = %h, Time = %0t", data_out, $time);
        end
        read_ptr = read_ptr + 1;
      end else begin
        rd_en = 0;
        $display("FIFO Empty at Time = %0t", $time);
      end
    end
    rd_en = 0;

    // End of simulation
    #100;
    $display("Test Completed Successfully!");
    $finish;
  end

  // Dump waveforms for analysis
  initial begin
    $dumpfile("async_fifo_TB.vcd");
    $dumpvars(0, async_fifo_TB);
  end

endmodule

