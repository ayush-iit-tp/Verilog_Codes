// Top-Level UART Module
module uart_top (
    input wire       clock,        // System clock
    input wire       reset,        // Reset signal
    input wire       tx_start,     // Start signal
    input wire [7:0] DATA_IN,      // Input data
    input wire       rxd,          // Serial input
    output wire      txd,          // Serial output
    output wire      tx_done,      // Transmit complete
    output wire [7:0] DATA_OUT,    // Received data
    output wire      rx_done       // Reception complete
);

    wire baud_tick;

    baud_rate_generator BRG (
        .clock(clock),
        .reset(reset),
        .baud_tick(baud_tick)
    );

    uart_transmitter TX (
        .clock(clock),
        .tx_start(tx_start),
        .DATA(DATA_IN),
        .baud_tick(baud_tick),
        .txd(txd),
        .tx_done(tx_done)
    );

    uart_receiver RX (
        .clock(clock),
        .rxd(rxd),
        .baud_tick(baud_tick),
        .DATA(DATA_OUT),
        .rx_done(rx_done)
    );
endmodule
