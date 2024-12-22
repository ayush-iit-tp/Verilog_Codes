module async_fifo_TB;

  parameter DATA_WIDTH = 8;  // Data width for FIFO

  // Testbench Signals
  wire [7:0] data_out;   // FIFO output data
  wire full, empty;                 // FIFO flags: full and empty
  reg [7:0] data_in;     // FIFO input data
  reg w_en, wclk, wrst_n;           // Write enable, write clock, and write reset
  reg r_en, rclk, rrst_n;           // Read enable, read clock, and read reset

  // Test Queue for Data Verification
  reg [7:0] wdata_q[0:255];  // Fixed-size array for Verilog compatibility
  integer w_ptr = 0;  // Write pointer
  integer r_ptr = 0;  // Read pointer

  reg [DATA_WIDTH-1:0] wdata;  // Temporary storage for verification

  // Instantiate the Asynchronous FIFO
  asynchronous_fifo as_fifo (
      .wr_clk(wclk),
      .wrst_n(wrst_n),
      .rd_clk(rclk),
      .rrst_n(rrst_n),
      .wr_en(w_en),
      .rd_en(r_en),
      .data_in(data_in),
      .data_out(data_out),
      .full(full),
      .empty(empty)
  );

  //////////////////////////////////////////
  // Clock Generation
  //////////////////////////////////////////
  always #10 wclk = ~wclk;  // Write clock with 20ns period
  always #35 rclk = ~rclk;  // Read clock with 70ns period

  //////////////////////////////////////////
  // Write Logic
  //////////////////////////////////////////
  initial begin
    // Initialization
    wclk = 1'b0; wrst_n = 1'b0;
    w_en = 1'b0;
    data_in = 0;

    // Reset write logic
    repeat(10) @(posedge wclk);
    wrst_n = 1'b1;

    // Write Operation Loop
    repeat(2) begin
      integer i;
      for (i = 0; i < 30; i = i + 1) begin
        @(posedge wclk);
        if (!full) begin
          w_en = (i % 2 == 0) ? 1'b1 : 1'b0;  // Toggle write enable
          if (w_en) begin
            data_in = $random;  // Generate random data
            wdata_q[w_ptr] = data_in;  // Store data in queue
            w_ptr = w_ptr + 1;  // Increment queue pointer
          end
        end
      end
      #50;  // Small delay between write bursts
    end
  end

  //////////////////////////////////////////
  // Read Logic
  //////////////////////////////////////////
  initial begin
    // Initialization
    rclk = 1'b0; rrst_n = 1'b0;
    r_en = 1'b0;

    // Reset read logic
    repeat(20) @(posedge rclk);
    rrst_n = 1'b1;

    // Read Operation Loop
    repeat(2) begin
      integer i;
      for (i = 0; i < 30; i = i + 1) begin
        @(posedge rclk);
        if (!empty) begin
          r_en = (i % 2 == 0) ? 1'b1 : 1'b0;  // Toggle read enable
          if (r_en) begin
            wdata = wdata_q[r_ptr];  // Fetch expected data
            r_ptr = r_ptr + 1;  // Increment read pointer

            // Compare FIFO output with expected data
            if (data_out !== wdata) begin
              $display("ERROR: Time = %0t: Data Mismatch! Expected = %h, Got = %h",
                       $time, wdata, data_out);
            end else begin
              $display("PASS: Time = %0t: Data Match! Expected = %h, Got = %h",
                       $time, wdata, data_out);
            end
          end
        end
      end
      #50;  // Small delay between read bursts
    end
    $finish;  // End simulation
  end

  //////////////////////////////////////////
  // Dump Waveform for Debugging
  //////////////////////////////////////////
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, async_fifo_TB);
  end

endmodule

