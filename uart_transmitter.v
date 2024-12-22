// UART Transmitter Module
module uart_transmitter (
    input wire        clock,       // System clock
    input wire        tx_start,    // Start transmission
    input wire [7:0]  tx_DATA,        // Parallel data input
    input wire        baud_tick,   // Baud rate clock enable
    output reg        txd,         // Serial data output
    output reg        tx_done      // Transmission complete
);

    localparam IDLE  = 3'b000;
    localparam START = 3'b001;
    localparam DATA  = 3'b010;
    localparam STOP  = 3'b011;

    reg [2:0] state;
    reg [3:0] bit_counter;
    reg [7:0] sbuf;

     always @(posedge clock) begin
        if (baud_tick) begin
            case (state)
                IDLE: begin
                    txd <= 1;  // Idle state (high)
                    tx_done <= 0;
                    if (tx_start) begin
                        sbuf <= tx_DATA;  // Load data
                        state <= START;
                        bit_counter <= 0;
                    end
                end

                START: begin
                    txd <= 0;  // Start bit
                    state <= DATA;
                end

                DATA: begin
                    txd <= sbuf[bit_counter];
                    if (bit_counter < 7)
                        bit_counter <= bit_counter + 1;
                    else
                        state <= STOP;
                end

                STOP: begin
                    txd <= 1;  // Stop bit
                    tx_done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule