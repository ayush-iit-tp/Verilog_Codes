// UART Transmitter Testbench
module uart_transmitter_tb();
    reg clock, tx_start;
    reg [7:0] tx_DATA;
    wire txd, tx_done;

    uart_transmitter uut (.clock(clock), .tx_start(tx_start), .tx_DATA(tx_DATA), .txd(txd), .tx_done(tx_done));

    always #5 clock = ~clock; // 100 MHz clock

    initial begin
        clock = 0;
        tx_start = 0;
        tx_DATA = 8'b10101010;

        #10 tx_start = 1;  // Start transmission
        #10 tx_start = 0;
        #2000 $finish;
    end
endmodule