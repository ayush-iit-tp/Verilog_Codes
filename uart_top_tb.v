// UART Top-Level Testbench
module uart_top_tb();
    reg clock, reset, tx_start, rxd;
    reg [7:0] DATA_IN;
    wire txd, tx_done, rx_done;
    wire [7:0] DATA_OUT;

    uart_top uut (
        .clock(clock),
        .reset(reset),
        .tx_start(tx_start),
        .DATA_IN(DATA_IN),
        .rxd(txd),  // Loopback from txd
        .txd(txd),
        .DATA_OUT(DATA_OUT),
        .tx_done(tx_done),
        .rx_done(rx_done)
    );

    always #5 clock = ~clock;

    initial begin
        clock = 0;
        reset = 1;
        tx_start = 0;
        DATA_IN = 8'h55; // Sample data

        #10 reset = 0;
        #10 tx_start = 1;
        #10 tx_start = 0;

        #1000 if (rx_done) $display("Data Received: %h", DATA_OUT);
        #2000 $finish;
    end
endmodule